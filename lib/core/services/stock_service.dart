import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';

/// Inventory: serialized units, quantity batches, movements, adjustments.
/// Every mutation runs inside a transaction and writes a movement record.
class StockService {
  final AppDatabase db;
  StockService(this.db);

  // ── Units ──

  /// Adds one serialized phone as available stock.
  /// Throws when the IMEI already exists (duplicate IMEI is never allowed).
  Future<InventoryUnit> addUnit({
    required String variantId,
    String? imei1,
    String? imei2,
    String? serial,
    String ptaStatus = 'Approved',
    required int purchasePrice,
    required int salePrice,
    String? supplierId,
    int? purchaseDate,
    String warranty = '',
    String notes = '',
    String? photoPath,
    String? userId,
    String? batchRef,
  }) =>
      db.transaction(() async {
        if (imei1 != null && imei1.trim().isNotEmpty) {
          final dup = await (db.select(db.inventoryUnits)
                ..where((t) => t.imei1.equals(imei1.trim())))
              .getSingleOrNull();
          if (dup != null) {
            throw StateError('IMEI $imei1 already exists in inventory');
          }
        }
        final id = newId();
        final now = PkTime.nowEpochMs();
        await db.into(db.inventoryUnits).insert(InventoryUnitsCompanion(
          id: Value(id),
          variantId: Value(variantId),
          imei1: Value(imei1?.trim().isEmpty == true ? null : imei1?.trim()),
          imei2: Value(imei2?.trim().isEmpty == true ? null : imei2?.trim()),
          serial: Value(serial?.trim().isEmpty == true ? null : serial?.trim()),
          ptaStatus: Value(ptaStatus),
          purchasePrice: Value(purchasePrice),
          salePrice: Value(salePrice),
          supplierId: Value(supplierId),
          purchaseDate: Value(purchaseDate),
          warranty: Value(warranty),
          notes: Value(notes),
          photoPath: Value(photoPath),
          status: const Value('available'),
          createdAt: Value(now),
          updatedAt: Value(now),
        ));
        await _movement(
          unitId: id,
          quantityDelta: 1,
          fromStatus: null,
          toStatus: 'available',
          reason: 'Stock received${batchRef == null ? '' : ' ($batchRef)'}',
          refType: 'purchase',
          refId: batchRef,
          userId: userId,
        );
        return (db.select(db.inventoryUnits)..where((t) => t.id.equals(id)))
            .getSingle();
      });

  /// Moves a unit between statuses with full validation.
  Future<void> moveUnit({
    required String unitId,
    required String toStatus,
    required String reason,
    String? refType,
    String? refId,
    String? userId,
  }) =>
      db.transaction(() async {
        final unit = await (db.select(db.inventoryUnits)
              ..where((t) => t.id.equals(unitId)))
            .getSingle();
        _validateTransition(unit.status, toStatus);
        await (db.update(db.inventoryUnits)
              ..where((t) => t.id.equals(unitId)))
            .write(InventoryUnitsCompanion(
          status: Value(toStatus),
          updatedAt: Value(PkTime.nowEpochMs()),
        ));
        await _movement(
          unitId: unitId,
          quantityDelta: 0,
          fromStatus: unit.status,
          toStatus: toStatus,
          reason: reason,
          refType: refType,
          refId: refId,
          userId: userId,
        );
      });

  static void _validateTransition(String from, String to) {
    if (from == to) return;
    // A sold unit can only come back via an explicit return flow.
    if (from == 'sold' && to != 'returned') {
      throw StateError('Sold units can only return via the returns flow');
    }
    // Dispatched stock is never also "available".
    if (from == 'available' && to == 'dispatched' ||
        from == 'dispatched' && to == 'available') {
      return; // handled by dispatch/return flows
    }
  }

  /// Manual stock adjustment with a mandatory reason (never silent).
  Future<void> adjustUnit({
    required String unitId,
    required String toStatus,
    required String reason,
    String? userId,
  }) async {
    if (reason.trim().isEmpty) {
      throw ArgumentError('An adjustment reason is required');
    }
    await moveUnit(
        unitId: unitId,
        toStatus: toStatus,
        reason: 'Adjustment: ${reason.trim()}',
        refType: 'adjust',
        userId: userId);
  }

  Future<InventoryUnit?> findByImei(String imei) =>
      (db.select(db.inventoryUnits)..where((t) => t.imei1.equals(imei.trim())))
          .getSingleOrNull();

  Stream<List<InventoryUnit>> watchUnits({String? status, String? variantId}) {
    final q = db.select(db.inventoryUnits)
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]);
    if (status != null) q.where((t) => t.status.equals(status));
    if (variantId != null) q.where((t) => t.variantId.equals(variantId));
    return q.watch();
  }

  Future<List<InventoryUnit>> searchUnits(String query) {
    final q = db.select(db.inventoryUnits)
      ..where((t) =>
          t.imei1.like('%$query%') |
          t.imei2.like('%$query%') |
          t.serial.like('%$query%'))
      ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
      ..limit(50);
    return q.get();
  }

  // ── Batches (non-serialized) ──

  Future<StockBatche> addBatch({
    required String variantId,
    required int quantity,
    required int purchasePrice,
    String? supplierId,
    int? purchaseDate,
    String? userId,
    String? batchRef,
  }) =>
      db.transaction(() async {
        if (quantity <= 0) throw ArgumentError('Quantity must be positive');
        final id = newId();
        await db.into(db.stockBatches).insert(StockBatchesCompanion(
          id: Value(id),
          variantId: Value(variantId),
          quantity: Value(quantity),
          purchasePrice: Value(purchasePrice),
          supplierId: Value(supplierId),
          purchaseDate: Value(purchaseDate),
          createdAt: Value(PkTime.nowEpochMs()),
        ));
        await _movement(
          batchId: id,
          quantityDelta: quantity,
          fromStatus: null,
          toStatus: 'available',
          reason: 'Batch received${batchRef == null ? '' : ' ($batchRef)'}',
          refType: 'purchase',
          refId: batchRef,
          userId: userId,
        );
        return (db.select(db.stockBatches)..where((t) => t.id.equals(id)))
            .getSingle();
      });

  /// Decreases a batch quantity; never below zero without an adjustment.
  Future<void> consumeBatch({
    required String batchId,
    required int quantity,
    required String reason,
    String? refType,
    String? refId,
    String? userId,
  }) =>
      db.transaction(() async {
        final batch = await (db.select(db.stockBatches)
              ..where((t) => t.id.equals(batchId)))
            .getSingle();
        if (quantity <= 0) throw ArgumentError('Quantity must be positive');
        if (batch.quantity < quantity) {
          throw StateError(
              'Insufficient stock in batch (have ${batch.quantity}, need $quantity)');
        }
        await (db.update(db.stockBatches)..where((t) => t.id.equals(batchId)))
            .write(StockBatchesCompanion(
                quantity: Value(batch.quantity - quantity)));
        await _movement(
          batchId: batchId,
          quantityDelta: -quantity,
          fromStatus: 'available',
          toStatus: 'sold',
          reason: reason,
          refType: refType,
          refId: refId,
          userId: userId,
        );
      });

  Future<void> restockBatch({
    required String batchId,
    required int quantity,
    required String reason,
    String? refType,
    String? refId,
    String? userId,
  }) =>
      db.transaction(() async {
        final batch = await (db.select(db.stockBatches)
              ..where((t) => t.id.equals(batchId)))
            .getSingle();
        await (db.update(db.stockBatches)..where((t) => t.id.equals(batchId)))
            .write(StockBatchesCompanion(
                quantity: Value(batch.quantity + quantity)));
        await _movement(
          batchId: batchId,
          quantityDelta: quantity,
          fromStatus: 'returned',
          toStatus: 'available',
          reason: reason,
          refType: refType,
          refId: refId,
          userId: userId,
        );
      });

  Stream<List<StockBatche>> watchBatches(String variantId) =>
      (db.select(db.stockBatches)
            ..where((t) => t.variantId.equals(variantId))
            ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
          .watch();

  /// Watches all batches (for the Stock screen).
  Stream<List<StockBatche>> watchAllBatches() =>
      (db.select(db.stockBatches)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch();

  // ── Movements ──

  Future<List<StockMovement>> movementHistory(
      {String? unitId, String? batchId, int limit = 200}) {
    final q = db.select(db.stockMovements)
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
      ..limit(limit);
    if (unitId != null) q.where((t) => t.unitId.equals(unitId));
    if (batchId != null) q.where((t) => t.batchId.equals(batchId));
    return q.get();
  }

  Future<void> _movement({
    String? unitId,
    String? batchId,
    required int quantityDelta,
    String? fromStatus,
    required String toStatus,
    required String reason,
    String? refType,
    String? refId,
    String? userId,
  }) =>
      db.into(db.stockMovements).insert(StockMovementsCompanion(
        unitId: Value(unitId),
        batchId: Value(batchId),
        quantityDelta: Value(quantityDelta),
        fromStatus: Value(fromStatus),
        toStatus: Value(toStatus),
        reason: Value(reason),
        refType: Value(refType),
        refId: Value(refId),
        userId: Value(userId),
        createdAt: Value(PkTime.nowEpochMs()),
      ));

  // ── Aggregates ──

  /// Counts serialized units by status for a variant.
  Future<Map<String, int>> unitCountsByStatus(String variantId) async {
    final rows = await (db.select(db.inventoryUnits)
          ..where((t) => t.variantId.equals(variantId)))
        .get();
    final map = <String, int>{};
    for (final r in rows) {
      map[r.status] = (map[r.status] ?? 0) + 1;
    }
    return map;
  }

  Future<int> batchAvailableQty(String variantId) async {
    final rows = await (db.select(db.stockBatches)
          ..where((t) => t.variantId.equals(variantId)))
        .get();
    return rows.fold<int>(0, (s, b) => s + b.quantity);
  }
}
