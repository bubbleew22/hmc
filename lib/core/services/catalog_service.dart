import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';

/// Brand / model / variant catalogue.
class CatalogService {
  final AppDatabase db;
  CatalogService(this.db);

  static const defaultBrands = [
    'Apple', 'Samsung', 'Google Pixel', 'Xiaomi', 'Redmi', 'POCO', 'Vivo',
    'Oppo', 'Realme', 'Infinix', 'Tecno', 'OnePlus', 'Motorola', 'Nokia',
    'Honor', 'Huawei', 'Itel', 'Nothing', 'Sony', 'Other',
  ];

  Future<void> seedDefaultBrands() async {
    final query = db.selectOnly(db.brands)
      ..addColumns([db.brands.id.count()]);
    final row = await query.getSingle();
    if ((row.read(db.brands.id.count()) ?? 0) > 0) return;
    var order = 0;
    for (final name in defaultBrands) {
      await db.into(db.brands).insert(BrandsCompanion(
        id: Value(newId()),
        name: Value(name),
        sortOrder: Value(order++),
        createdAt: Value(PkTime.nowEpochMs()),
      ));
    }
  }

  Stream<List<Brand>> watchBrands({bool includeArchived = false}) {
    final q = db.select(db.brands)
      ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]);
    if (!includeArchived) q.where((t) => t.isArchived.equals(0));
    return q.watch();
  }

  Future<List<Brand>> searchBrands(String query) {
    final q = db.select(db.brands)
      ..where((t) => t.name.like('%$query%'))
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);
    return q.get();
  }

  Future<Brand> addBrand(String name) async {
    final row = BrandsCompanion(
      id: Value(newId()),
      name: Value(name.trim()),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.brands).insert(row);
    return (db.select(db.brands)..where((t) => t.id.equals(row.id.value)))
        .getSingle();
  }

  Future<void> renameBrand(String id, String name) =>
      (db.update(db.brands)..where((t) => t.id.equals(id)))
          .write(BrandsCompanion(name: Value(name.trim())));

  /// Archiving keeps history; brands with financial records are never deleted.
  Future<void> archiveBrand(String id, bool archived) =>
      (db.update(db.brands)..where((t) => t.id.equals(id)))
          .write(BrandsCompanion(isArchived: Value(archived ? 1 : 0)));

  Future<bool> brandHasRecords(String brandId) async {
    final models = await (db.select(db.productModels)
          ..where((t) => t.brandId.equals(brandId)))
        .get();
    if (models.isEmpty) return false;
    final modelIds = models.map((m) => m.id).toList();
    final variants = await (db.select(db.productVariants)
          ..where((t) => t.modelId.isIn(modelIds)))
        .get();
    return variants.isNotEmpty;
  }

  // ── Models ──

  Stream<List<ProductModel>> watchModels(String brandId) =>
      (db.select(db.productModels)
            ..where((t) => t.brandId.equals(brandId))
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch();

  Future<ProductModel> addModel({
    required String brandId,
    required String name,
    String? photoPath,
  }) async {
    final row = ProductModelsCompanion(
      id: Value(newId()),
      brandId: Value(brandId),
      name: Value(name.trim()),
      photoPath: Value(photoPath),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.productModels).insert(row);
    return (db.select(db.productModels)..where((t) => t.id.equals(row.id.value)))
        .getSingle();
  }

  // ── Variants ──

  Stream<List<ProductVariant>> watchVariants(String modelId) =>
      (db.select(db.productVariants)
            ..where((t) => t.modelId.equals(modelId)))
          .watch();

  Future<ProductVariant> addVariant({
    required String modelId,
    required String ram,
    required String storage,
    required String color,
    required String condition,
  }) async {
    final row = ProductVariantsCompanion(
      id: Value(newId()),
      modelId: Value(modelId),
      ram: Value(ram.trim()),
      storage: Value(storage.trim()),
      color: Value(color.trim()),
      condition: Value(condition),
    );
    await db.into(db.productVariants).insert(row);
    return (db.select(db.productVariants)
          ..where((t) => t.id.equals(row.id.value)))
        .getSingle();
  }

  /// Human label for pickers: "Galaxy S24 · 8GB/256GB · Black · New".
  static String variantLabel(ProductVariant v, String modelName) {
    final parts = [modelName, v.storage.isEmpty ? '' : '${v.ram}/${v.storage}',
        v.color, v.condition].where((p) => p.trim().isNotEmpty);
    return parts.join(' · ');
  }
}
