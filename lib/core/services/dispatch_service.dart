import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';
import 'stock_service.dart';

class DispatchLineInput {
  final String? unitId;
  final String? batchId;
  final String variantId;
  final int quantity;
  final int unitCost;
  final int agreedPrice;

  const DispatchLineInput({
    this.unitId,
    this.batchId,
    required this.variantId,
    required this.quantity,
    required this.unitCost,
    required this.agreedPrice,
  });
}

/// Dispatch & consignment. Dispatch is NEVER a sale until confirmed.
class DispatchService {
  final AppDatabase db;
  final StockService stock;
  DispatchService(this.db) : stock = StockService(db);

  Future<Dispatche> createDispatch({
    required String recipientName,
    String recipientPhone = '',
    String recipientAddress = '',
    required int dispatchDate,
    required List<DispatchLineInput> items,
    String notes = '',
    String? userId,
  }) =>
      db.transaction(() async {
        if (recipientName.trim().isEmpty) {
          throw ArgumentError('Recipient name is required');
        }
        if (items.isEmpty) throw ArgumentError('Dispatch needs items');

        final id = newId();
        final refNo =
            'DSP-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
        var agreedTotal = 0;
        for (final l in items) {
          agreedTotal += l.quantity * l.agreedPrice;
        }
        final now = PkTime.nowEpochMs();
        await db.into(db.dispatches).insert(DispatchesCompanion(
          id: Value(id),
          refNo: Value(refNo),
          recipientName: Value(recipientName.trim()),
          recipientPhone: Value(recipientPhone.trim()),
          recipientAddress: Value(recipientAddress.trim()),
          dispatchDate: Value(dispatchDate),
          agreedPrice: Value(agreedTotal),
          status: const Value('sent'),
          notes: Value(notes),
          createdAt: Value(now),
        ));

        for (final l in items) {
          if (l.unitId != null) {
            final unit = await (db.select(db.inventoryUnits)
                  ..where((t) => t.id.equals(l.unitId!)))
                .getSingle();
            if (unit.status != 'available') {
              throw StateError('Unit is not available for dispatch');
            }
            await db.into(db.dispatchItems).insert(DispatchItemsCompanion(
              id: Value(newId()),
              dispatchId: Value(id),
              unitId: Value(l.unitId),
              variantId: Value(l.variantId),
              quantity: const Value(1),
              unitCost: Value(unit.purchasePrice),
              agreedPrice: Value(l.agreedPrice),
              status: const Value('sent'),
            ));
            await stock.moveUnit(
              unitId: l.unitId!,
              toStatus: 'dispatched',
              reason: 'Dispatched to ${recipientName.trim()} ($refNo)',
              refType: 'dispatch',
              refId: id,
              userId: userId,
            );
          } else if (l.batchId != null) {
            await stock.consumeBatch(
              batchId: l.batchId!,
              quantity: l.quantity,
              reason: 'Dispatched to ${recipientName.trim()} ($refNo)',
              refType: 'dispatch',
              refId: id,
              userId: userId,
            );
            await db.into(db.dispatchItems).insert(DispatchItemsCompanion(
              id: Value(newId()),
              dispatchId: Value(id),
              batchId: Value(l.batchId),
              variantId: Value(l.variantId),
              quantity: Value(l.quantity),
              unitCost: Value(l.unitCost),
              agreedPrice: Value(l.agreedPrice),
              status: const Value('sent'),
            ));
          }
        }
        return (db.select(db.dispatches)..where((t) => t.id.equals(id)))
            .getSingle();
      });

  /// Records confirmed recipient sales. Only now does revenue recognition
  /// happen (via a linked sales invoice handled by the caller or here).
  Future<void> recordConsignmentSale({
    required String dispatchItemId,
    required int quantity,
    required int salePrice,
    int amountReceived = 0,
    required int date,
  }) =>
      db.transaction(() async {
        final item = await (db.select(db.dispatchItems)
              ..where((t) => t.id.equals(dispatchItemId)))
            .getSingle();
        if (item.status == 'returned' || item.status == 'cancelled') {
          throw StateError('Item is no longer with the recipient');
        }
        final soldSoFar = await _soldQty(dispatchItemId);
        final returnedSoFar = await _returnedQty(dispatchItemId);
        if (soldSoFar + returnedSoFar + quantity > item.quantity) {
          throw StateError('Quantity exceeds dispatched quantity');
        }
        await db.into(db.consignmentSales).insert(ConsignmentSalesCompanion(
          id: Value(newId()),
          dispatchItemId: Value(dispatchItemId),
          quantity: Value(quantity),
          salePrice: Value(salePrice),
          amountReceived: Value(amountReceived),
          date: Value(date),
          createdAt: Value(PkTime.nowEpochMs()),
        ));
        final totalSold = soldSoFar + quantity;
        final newStatus =
            totalSold == item.quantity ? 'sold' : item.status;
        await (db.update(db.dispatchItems)
              ..where((t) => t.id.equals(dispatchItemId)))
            .write(DispatchItemsCompanion(status: Value(newStatus)));
        if (item.unitId != null && quantity == item.quantity) {
          await stock.moveUnit(
            unitId: item.unitId!,
            toStatus: 'sold',
            reason: 'Consignment sale confirmed',
            refType: 'consignment_sale',
            refId: dispatchItemId,
          );
        }
        await _refreshDispatchStatus(item.dispatchId);
      });

  /// Unsold units come back to available stock.
  Future<void> recordReturn({
    required String dispatchItemId,
    required int quantity,
    String? userId,
  }) =>
      db.transaction(() async {
        final item = await (db.select(db.dispatchItems)
              ..where((t) => t.id.equals(dispatchItemId)))
            .getSingle();
        final soldSoFar = await _soldQty(dispatchItemId);
        // Model returns as negative-quantity consignment rows is overkill;
        // track via item status + movement when fully returned.
        final remaining = item.quantity - soldSoFar;
        if (quantity > remaining) {
          throw StateError('Return quantity exceeds outstanding quantity');
        }
        if (item.unitId != null) {
          await stock.moveUnit(
            unitId: item.unitId!,
            toStatus: 'available',
            reason: 'Dispatch return — back to shop stock',
            refType: 'dispatch_return',
            refId: dispatchItemId,
            userId: userId,
          );
          await (db.update(db.dispatchItems)
                ..where((t) => t.id.equals(dispatchItemId)))
              .write(const DispatchItemsCompanion(status: Value('returned')));
        } else if (item.batchId != null) {
          await stock.restockBatch(
            batchId: item.batchId!,
            quantity: quantity,
            reason: 'Dispatch return — back to shop stock',
            refType: 'dispatch_return',
            refId: dispatchItemId,
            userId: userId,
          );
          final newStatus =
              quantity == remaining ? 'returned' : 'sent';
          await (db.update(db.dispatchItems)
                ..where((t) => t.id.equals(dispatchItemId)))
              .write(DispatchItemsCompanion(status: Value(newStatus)));
        }
        await _refreshDispatchStatus(item.dispatchId);
      });

  Future<int> _soldQty(String dispatchItemId) async {
    final rows = await (db.select(db.consignmentSales)
          ..where((t) => t.dispatchItemId.equals(dispatchItemId)))
        .get();
    return rows.fold<int>(0, (s, r) => s + r.quantity);
  }

  Future<int> _returnedQty(String dispatchItemId) async {
    // Returns are reflected in item status; batch partial returns restock
    // immediately so outstanding = quantity − sold − (restocked).
    final item = await (db.select(db.dispatchItems)
          ..where((t) => t.id.equals(dispatchItemId)))
        .getSingleOrNull();
    if (item == null || item.status != 'returned') return 0;
    final sold = await _soldQty(dispatchItemId);
    return item.quantity - sold;
  }

  Future<void> _refreshDispatchStatus(String dispatchId) async {
    final items = await (db.select(db.dispatchItems)
          ..where((t) => t.dispatchId.equals(dispatchId)))
        .get();
    if (items.isEmpty) return;
    final statuses = items.map((i) => i.status).toSet();
    String status;
    if (statuses.length == 1) {
      status = switch (statuses.single) {
        'sold' => 'sold',
        'returned' => 'returned',
        'cancelled' => 'cancelled',
        _ => 'sent',
      };
    } else if (statuses.contains('sold')) {
      status = 'partially_sold';
    } else if (statuses.contains('returned')) {
      status = 'partially_returned';
    } else {
      status = 'sent';
    }
    await (db.update(db.dispatches)..where((t) => t.id.equals(dispatchId)))
        .write(DispatchesCompanion(status: Value(status)));
  }

  Stream<List<Dispatche>> watchDispatches() =>
      (db.select(db.dispatches)
            ..orderBy([(t) => OrderingTerm.desc(t.dispatchDate)]))
          .watch();

  Future<List<DispatchItem>> dispatchItems(String dispatchId) =>
      (db.select(db.dispatchItems)
            ..where((t) => t.dispatchId.equals(dispatchId)))
          .get();

  /// Person-wise outstanding: units still with each recipient.
  Future<Map<String, int>> outstandingByRecipient() async {
    final items = await db.select(db.dispatchItems).get();
    final dispatches = await db.select(db.dispatches).get();
    final nameById = {for (final d in dispatches) d.id: d.recipientName};
    final out = <String, int>{};
    for (final i in items) {
      if (i.status != 'sent') continue;
      final sold = await _soldQty(i.id);
      final outstanding = i.quantity - sold;
      if (outstanding <= 0) continue;
      final name = nameById[i.dispatchId] ?? 'Unknown';
      out[name] = (out[name] ?? 0) + outstanding;
    }
    return out;
  }
}
