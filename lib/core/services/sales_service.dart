import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';
import 'accounting.dart';
import 'shop_service.dart';
import 'stock_service.dart';

class SaleItemInput {
  /// Serialized unit sale:
  final String? unitId;
  /// Batch sale:
  final String? batchId;
  final String variantId;
  final int quantity;
  final int unitPrice;

  const SaleItemInput({
    this.unitId,
    this.batchId,
    required this.variantId,
    required this.quantity,
    required this.unitPrice,
  });
}

/// Sales: finalize (atomic stock decrement + invoice + payment),
/// idempotent against double submission.
class SalesService {
  final AppDatabase db;
  final StockService stock;
  final ShopService shop;
  SalesService(this.db)
      : stock = StockService(db),
        shop = ShopService(db);

  /// Finalizes a sale. Safe to retry with the same [idempotencyKey] —
  /// the original invoice is returned instead of creating a duplicate.
  Future<SalesInvoice> finalizeSale({
    required String idempotencyKey,
    required int saleDate,
    required String customerId,
    required List<SaleItemInput> items,
    int discount = 0,
    int tax = 0,
    int paid = 0,
    String paymentMethod = 'Cash',
    String notes = '',
    String warranty = '',
    String? userId,
  }) =>
      db.transaction(() async {
        final existing = await (db.select(db.salesInvoices)
              ..where((t) => t.idempotencyKey.equals(idempotencyKey)))
            .getSingleOrNull();
        if (existing != null) return existing; // duplicate submission guard

        if (items.isEmpty) throw ArgumentError('Sale must have items');

        // Validate + lock stock first.
        final lines = <SaleLineInput>[];
        for (final item in items) {
          if (item.unitId != null) {
            final unit = await (db.select(db.inventoryUnits)
                  ..where((t) => t.id.equals(item.unitId!)))
                .getSingle();
            if (unit.status != 'available') {
              throw StateError(
                  'Unit ${unit.imei1 ?? unit.id} is not available (${unit.status})');
            }
            lines.add(SaleLineInput(
              quantity: 1,
              unitPriceMinor: item.unitPrice,
              unitCostMinor: unit.purchasePrice,
            ));
          } else if (item.batchId != null) {
            final batch = await (db.select(db.stockBatches)
                  ..where((t) => t.id.equals(item.batchId!)))
                .getSingle();
            if (batch.quantity < item.quantity) {
              throw StateError(
                  'Insufficient stock (have ${batch.quantity}, need ${item.quantity})');
            }
            lines.add(SaleLineInput(
              quantity: item.quantity,
              unitPriceMinor: item.unitPrice,
              unitCostMinor: batch.purchasePrice,
            ));
          } else {
            throw ArgumentError('Sale item needs a unitId or batchId');
          }
        }

        final totals =
            calcSaleTotals(lines: lines, discount: discount, tax: tax, paid: paid);
        final paymentType =
            paid == 0 ? 'credit' : (paid == totals.total ? 'full' : 'partial');

        final n = await shop.nextInvoiceNumber();
        final invoiceNo = shop.formatInvoiceNo(n);
        final saleId = newId();
        final now = PkTime.nowEpochMs();

        await db.into(db.salesInvoices).insert(SalesInvoicesCompanion(
          id: Value(saleId),
          invoiceNo: Value(invoiceNo),
          saleDate: Value(saleDate),
          customerId: Value(customerId),
          subtotal: Value(totals.subtotal),
          discount: Value(totals.discount),
          tax: Value(totals.tax),
          total: Value(totals.total),
          paid: Value(totals.paid),
          paymentType: Value(paymentType),
          paymentMethod: Value(paymentMethod),
          idempotencyKey: Value(idempotencyKey),
          notes: Value(notes),
          warranty: Value(warranty),
          userId: Value(userId),
          createdAt: Value(now),
        ));

        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          final line = lines[i];
          final perUnitCost = line.unitCostMinor ~/ line.quantity;
          await db.into(db.salesItems).insert(SalesItemsCompanion(
            id: Value(newId()),
            saleId: Value(saleId),
            variantId: Value(item.variantId),
            unitId: Value(item.unitId),
            batchId: Value(item.batchId),
            quantity: Value(line.quantity),
            unitPrice: Value(line.unitPriceMinor),
            unitCost: Value(perUnitCost),
          ));
          if (item.unitId != null) {
            await stock.moveUnit(
              unitId: item.unitId!,
              toStatus: 'sold',
              reason: 'Sale $invoiceNo',
              refType: 'sale',
              refId: saleId,
              userId: userId,
            );
          } else {
            await stock.consumeBatch(
              batchId: item.batchId!,
              quantity: line.quantity,
              reason: 'Sale $invoiceNo',
              refType: 'sale',
              refId: saleId,
              userId: userId,
            );
          }
        }

        if (paid > 0) {
          final paymentId = newId();
          await db.into(db.customerPayments).insert(CustomerPaymentsCompanion(
            id: Value(paymentId),
            customerId: Value(customerId),
            saleId: Value(saleId),
            amount: Value(paid),
            date: Value(saleDate),
            method: Value(paymentMethod),
            notes: const Value('Payment with sale'),
            createdAt: Value(now),
          ));
          await db.into(db.paymentAllocations).insert(PaymentAllocationsCompanion(
            id: Value(newId()),
            paymentId: Value(paymentId),
            saleId: Value(saleId),
            amount: Value(paid),
          ));
        }

        return (db.select(db.salesInvoices)..where((t) => t.id.equals(saleId)))
            .getSingle();
      });

  /// Cancels a finalized invoice via reversal (never deletes records).
  /// Stock is returned to available; linked payments stay as history.
  Future<void> cancelSale(String saleId, {String? userId, String reason = ''}) =>
      db.transaction(() async {
        final inv = await (db.select(db.salesInvoices)
              ..where((t) => t.id.equals(saleId)))
            .getSingle();
        if (inv.status != 'final') {
          throw StateError('Only finalized invoices can be cancelled');
        }
        final items = await (db.select(db.salesItems)
              ..where((t) => t.saleId.equals(saleId)))
            .get();
        for (final item in items) {
          if (item.unitId != null) {
            await stock.moveUnit(
              unitId: item.unitId!,
              toStatus: 'available',
              reason: 'Sale ${inv.invoiceNo} cancelled${reason.isEmpty ? '' : ': $reason'}',
              refType: 'sale_cancel',
              refId: saleId,
              userId: userId,
            );
          } else if (item.batchId != null) {
            await stock.restockBatch(
              batchId: item.batchId!,
              quantity: item.quantity,
              reason: 'Sale ${inv.invoiceNo} cancelled',
              refType: 'sale_cancel',
              refId: saleId,
              userId: userId,
            );
          }
        }
        await (db.update(db.salesInvoices)..where((t) => t.id.equals(saleId)))
            .write(const SalesInvoicesCompanion(status: Value('cancelled')));
      });

  Stream<List<SalesInvoice>> watchSales({int limit = 200}) =>
      (db.select(db.salesInvoices)
            ..orderBy([(t) => OrderingTerm.desc(t.saleDate)])
            ..limit(limit))
          .watch();

  Future<List<SalesItem>> saleItems(String saleId) =>
      (db.select(db.salesItems)..where((t) => t.saleId.equals(saleId))).get();
}
