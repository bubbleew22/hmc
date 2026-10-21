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

  /// Seeds the Google Pixel catalogue (models + storage variants).
  /// Runs once: skips entirely if any model already exists.
  /// Full catalogue: brand -> list of [model name, ram].
  /// Per-brand seeding: brands that already have models are skipped,
  /// so updating the app never duplicates or wipes existing data.
  static const _brandCatalogs = {
    'Google Pixel': [
      ['Pixel 4', '6GB'], ['Pixel 4 XL', '6GB'], ['Pixel 4a', '6GB'],
      ['Pixel 4a (5G)', '6GB'], ['Pixel 5', '8GB'], ['Pixel 5a (5G)', '6GB'],
      ['Pixel 6', '8GB'], ['Pixel 6 Pro', '12GB'], ['Pixel 6a', '6GB'],
      ['Pixel 7', '8GB'], ['Pixel 7 Pro', '12GB'], ['Pixel 7a', '8GB'],
      ['Pixel 8', '8GB'], ['Pixel 8 Pro', '12GB'], ['Pixel 8a', '8GB'],
      ['Pixel 9', '12GB'], ['Pixel 9 Pro', '16GB'], ['Pixel 9 Pro XL', '16GB'],
      ['Pixel 9 Pro Fold', '16GB'], ['Pixel 9a', '8GB'],
      ['Pixel 10', '12GB'], ['Pixel 10 Pro', '16GB'], ['Pixel 10 Pro XL', '16GB'],
    ],
    'Apple': [
      ['iPhone 11', '4GB'], ['iPhone 11 Pro', '4GB'], ['iPhone 11 Pro Max', '4GB'],
      ['iPhone 12', '4GB'], ['iPhone 12 Pro', '6GB'], ['iPhone 12 Pro Max', '6GB'],
      ['iPhone 13', '4GB'], ['iPhone 13 Pro', '6GB'], ['iPhone 13 Pro Max', '6GB'],
      ['iPhone 14', '6GB'], ['iPhone 14 Plus', '6GB'],
      ['iPhone 14 Pro', '6GB'], ['iPhone 14 Pro Max', '6GB'],
      ['iPhone 15', '6GB'], ['iPhone 15 Plus', '6GB'],
      ['iPhone 15 Pro', '8GB'], ['iPhone 15 Pro Max', '8GB'],
      ['iPhone 16', '8GB'], ['iPhone 16 Plus', '8GB'],
      ['iPhone 16 Pro', '8GB'], ['iPhone 16 Pro Max', '8GB'],
    ],
    'Samsung': [
      ['Galaxy S21', '8GB'], ['Galaxy S21+', '8GB'], ['Galaxy S21 Ultra', '12GB'],
      ['Galaxy S22', '8GB'], ['Galaxy S22+', '8GB'], ['Galaxy S22 Ultra', '12GB'],
      ['Galaxy S23', '8GB'], ['Galaxy S23+', '8GB'], ['Galaxy S23 Ultra', '12GB'],
      ['Galaxy S24', '8GB'], ['Galaxy S24+', '12GB'], ['Galaxy S24 Ultra', '12GB'],
      ['Galaxy S25', '12GB'], ['Galaxy S25+', '12GB'], ['Galaxy S25 Ultra', '12GB'],
      ['Galaxy A14', '4GB'], ['Galaxy A24', '6GB'], ['Galaxy A34', '6GB'],
      ['Galaxy A54', '8GB'], ['Galaxy A55', '8GB'],
      ['Galaxy Z Flip 5', '8GB'], ['Galaxy Z Flip 6', '12GB'],
      ['Galaxy Z Fold 5', '12GB'], ['Galaxy Z Fold 6', '12GB'],
    ],
    'Xiaomi': [
      ['Xiaomi 13', '8GB'], ['Xiaomi 13 Pro', '12GB'],
      ['Xiaomi 14', '12GB'], ['Xiaomi 14 Ultra', '16GB'],
      ['Redmi Note 12', '6GB'], ['Redmi Note 12 Pro', '8GB'],
      ['Redmi Note 13', '6GB'], ['Redmi Note 13 Pro', '8GB'],
    ],
    'Redmi': [
      ['Redmi 12', '8GB'], ['Redmi 13C', '8GB'],
      ['Redmi Note 12', '6GB'], ['Redmi Note 13', '8GB'],
    ],
    'POCO': [
      ['POCO X6', '8GB'], ['POCO X6 Pro', '12GB'],
      ['POCO F6', '12GB'], ['POCO M6 Pro', '8GB'],
    ],
    'Vivo': [
      ['Vivo V29', '8GB'], ['Vivo V30', '8GB'],
      ['Vivo Y36', '8GB'], ['Vivo Y28', '8GB'],
    ],
    'Oppo': [
      ['Oppo Reno 11', '8GB'], ['Oppo Reno 12', '12GB'],
      ['Oppo A58', '6GB'], ['Oppo A78', '8GB'],
    ],
    'Realme': [
      ['Realme 11 Pro', '8GB'], ['Realme 12 Pro', '8GB'],
      ['Realme C67', '8GB'], ['Realme Note 50', '4GB'],
    ],
    'Infinix': [
      ['Infinix Note 40', '8GB'], ['Infinix Note 40 Pro', '8GB'],
      ['Infinix Hot 40', '8GB'], ['Infinix Smart 8', '4GB'],
    ],
    'Tecno': [
      ['Tecno Camon 30', '8GB'], ['Tecno Spark 20', '8GB'],
      ['Tecno Spark 20 Pro', '8GB'], ['Tecno Pova 6', '8GB'],
    ],
    'OnePlus': [
      ['OnePlus 11', '8GB'], ['OnePlus 12', '12GB'], ['OnePlus 12R', '8GB'],
      ['OnePlus Nord 4', '8GB'], ['OnePlus Nord CE4', '8GB'],
    ],
    'Motorola': [
      ['Motorola Edge 40', '8GB'], ['Moto G85', '8GB'], ['Moto G54', '8GB'],
    ],
    'Nokia': [
      ['Nokia G42', '6GB'], ['Nokia G60', '6GB'],
    ],
    'Honor': [
      ['Honor X9b', '8GB'], ['Honor 200', '12GB'], ['Honor Magic 6 Lite', '8GB'],
    ],
    'Huawei': [
      ['Huawei Nova 12', '8GB'], ['Huawei Pura 70', '12GB'],
    ],
    'Itel': [
      ['Itel S24', '8GB'], ['Itel P55', '8GB'],
    ],
    'Nothing': [
      ['Nothing Phone (1)', '8GB'], ['Nothing Phone (2)', '12GB'],
      ['Nothing Phone (2a)', '8GB'],
    ],
    'Sony': [
      ['Sony Xperia 1 V', '12GB'], ['Sony Xperia 10 V', '6GB'],
    ],
  };

  static const _defaultStorages = ['128GB', '256GB', '512GB', '1TB'];

  Future<void> seedDefaultModels() async {
    final now = PkTime.nowEpochMs();
    for (final entry in _brandCatalogs.entries) {
      final brand = await (db.select(db.brands)
            ..where((t) => t.name.equals(entry.key)))
          .getSingleOrNull();
      if (brand == null) continue;
      // Skip brands that already have models (e.g. Pixel from v1.0.4).
      final existing = await (db.selectOnly(db.productModels)
            ..addColumns([db.productModels.id.count()])
            ..where(db.productModels.brandId.equals(brand.id)))
          .getSingle();
      if ((existing.read(db.productModels.id.count()) ?? 0) > 0) continue;

      for (final m in entry.value) {
        final modelId = newId();
        await db.into(db.productModels).insert(ProductModelsCompanion(
          id: Value(modelId),
          brandId: Value(brand.id),
          name: Value(m[0]),
          createdAt: Value(now),
        ));
        for (final storage in _defaultStorages) {
          await db.into(db.productVariants).insert(ProductVariantsCompanion(
            id: Value(newId()),
            modelId: Value(modelId),
            ram: Value(m[1]),
            storage: Value(storage),
          ));
        }
      }
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
