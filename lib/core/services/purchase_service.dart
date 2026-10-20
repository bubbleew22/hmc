import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';
import 'stock_service.dart';

class PurchaseLineInput {
  final String variantId;
  final int quantity;
  final int unitCost;
  final List<String> imeis; // one per unit when serialized

  const PurchaseLineInput({
    required this.variantId,
    required this.quantity,
    required this.unitCost,
    this.imeis = const [],
  });
}

/// Purchases: invoices, stock intake (exactly once), supplier payments.
class PurchaseService {
  final AppDatabase db;
  final StockService stock;
  PurchaseService(this.db) : stock = StockService(db);

  Future<Supplier> addSupplier({
    required String name,
    String phone = '',
    String address = '',
    String notes = '',
  }) async {
    final row = SuppliersCompanion(
      id: Value(newId()),
      name: Value(name.trim()),
      phone: Value(phone.trim()),
      address: Value(address.trim()),
      notes: Value(notes.trim()),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.suppliers).insert(row);
    return (db.select(db.suppliers)..where((t) => t.id.equals(row.id.value)))
        .getSingle();
  }

  Stream<List<Supplier>> watchSuppliers() =>
      (db.select(db.suppliers)..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch();

  /// Records a purchase invoice and receives stock exactly once, atomically.
  Future<PurchaseInvoice> recordPurchase({
    required String supplierId,
    required int purchaseDate,
    required List<PurchaseLineInput> lines,
    int discount = 0,
    int expenses = 0,
    int paid = 0,
    String paymentMethod = 'Cash',
    String notes = '',
    String? userId,
  }) =>
      db.transaction(() async {
        if (lines.isEmpty) throw ArgumentError('Purchase needs items');
        var subtotal = 0;
        for (final l in lines) {
          if (l.quantity <= 0) throw ArgumentError('Quantity must be positive');
          if (l.unitCost < 0) throw ArgumentError('Cost cannot be negative');
          if (l.imeis.isNotEmpty && l.imeis.length != l.quantity) {
            throw ArgumentError('IMEI count must match quantity');
          }
          subtotal += l.quantity * l.unitCost;
        }
        if (discount < 0 || discount > subtotal) {
          throw ArgumentError('Invalid discount');
        }
        final total = subtotal - discount + expenses;
        if (paid < 0 || paid > total) {
          throw ArgumentError('Invalid paid amount');
        }

        final id = newId();
        final refNo =
            'PO-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
        final now = PkTime.nowEpochMs();
        await db.into(db.purchaseInvoices).insert(PurchaseInvoicesCompanion(
          id: Value(id),
          refNo: Value(refNo),
          supplierId: Value(supplierId),
          purchaseDate: Value(purchaseDate),
          subtotal: Value(subtotal),
          discount: Value(discount),
          expenses: Value(expenses),
          total: Value(total),
          paid: Value(paid),
          paymentMethod: Value(paymentMethod),
          notes: Value(notes),
          createdAt: Value(now),
        ));

        for (final l in lines) {
          if (l.imeis.isNotEmpty) {
            for (final imei in l.imeis) {
              final unit = await stock.addUnit(
                variantId: l.variantId,
                imei1: imei,
                purchasePrice: l.unitCost,
                salePrice: l.unitCost,
                supplierId: supplierId,
                purchaseDate: purchaseDate,
                userId: userId,
                batchRef: refNo,
              );
              await db.into(db.purchaseItems).insert(PurchaseItemsCompanion(
                id: Value(newId()),
                purchaseId: Value(id),
                variantId: Value(l.variantId),
                unitId: Value(unit.id),
                quantity: const Value(1),
                unitCost: Value(l.unitCost),
              ));
            }
          } else {
            final batch = await stock.addBatch(
              variantId: l.variantId,
              quantity: l.quantity,
              purchasePrice: l.unitCost,
              supplierId: supplierId,
              purchaseDate: purchaseDate,
              userId: userId,
              batchRef: refNo,
            );
            await db.into(db.purchaseItems).insert(PurchaseItemsCompanion(
              id: Value(newId()),
              purchaseId: Value(id),
              variantId: Value(l.variantId),
              batchId: Value(batch.id),
              quantity: Value(l.quantity),
              unitCost: Value(l.unitCost),
            ));
          }
        }

        if (paid > 0) {
          await db.into(db.supplierPayments).insert(SupplierPaymentsCompanion(
            id: Value(newId()),
            supplierId: Value(supplierId),
            purchaseId: Value(id),
            amount: Value(paid),
            date: Value(purchaseDate),
            method: Value(paymentMethod),
            createdAt: Value(now),
          ));
        }
        return (db.select(db.purchaseInvoices)
              ..where((t) => t.id.equals(id)))
            .getSingle();
      });

  Future<void> paySupplier({
    required String supplierId,
    String? purchaseId,
    required int amount,
    required int date,
    String method = 'Cash',
    String notes = '',
  }) =>
      db.transaction(() async {
        if (amount <= 0) throw ArgumentError('Amount must be positive');
        await db.into(db.supplierPayments).insert(SupplierPaymentsCompanion(
          id: Value(newId()),
          supplierId: Value(supplierId),
          purchaseId: Value(purchaseId),
          amount: Value(amount),
          date: Value(date),
          method: Value(method),
          notes: Value(notes),
          createdAt: Value(PkTime.nowEpochMs()),
        ));
        if (purchaseId != null) {
          final inv = await (db.select(db.purchaseInvoices)
                ..where((t) => t.id.equals(purchaseId)))
              .getSingle();
          final newPaid = inv.paid + amount;
          if (newPaid > inv.total) {
            throw StateError('Payment exceeds purchase balance');
          }
          await (db.update(db.purchaseInvoices)
                ..where((t) => t.id.equals(purchaseId)))
              .write(PurchaseInvoicesCompanion(paid: Value(newPaid)));
        }
      });

  /// Supplier outstanding = invoice totals − payments, from records only.
  Future<int> supplierBalance(String supplierId) async {
    final invoices = await (db.select(db.purchaseInvoices)
          ..where((t) => t.supplierId.equals(supplierId)))
        .get();
    final payments = await (db.select(db.supplierPayments)
          ..where((t) => t.supplierId.equals(supplierId)))
        .get();
    final invoiced = invoices.fold<int>(0, (s, i) => s + i.total);
    final paid = payments.fold<int>(0, (s, p) => s + p.amount);
    return invoiced - paid;
  }

  Stream<List<PurchaseInvoice>> watchPurchases() =>
      (db.select(db.purchaseInvoices)
            ..orderBy([(t) => OrderingTerm.desc(t.purchaseDate)]))
          .watch();
}
