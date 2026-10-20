import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers.dart';
import '../core/services/catalog_service.dart';
import '../core/utils/money.dart';
import '../data/db/app_database.dart';
import 'common.dart';

class PickedVariant {
  final String variantId;
  final String label;
  const PickedVariant(this.variantId, this.label);
}

/// Drill-down picker: brand → model → variant.
Future<PickedVariant?> pickVariant(BuildContext context, WidgetRef ref) async {
  final catalog = ref.read(catalogServiceProvider);
  final db = ref.read(databaseProvider);

  final brands = await catalog.watchBrands().first;
  if (!context.mounted) return null;
  final brand = await _pickFromList<Brand>(
    context,
    'Select brand',
    brands,
    (b) => b.name,
  );
  if (brand == null || !context.mounted) return null;

  final models = await catalog.watchModels(brand.id).first;
  if (!context.mounted) return null;
  final model = await _pickFromList<ProductModel>(
    context,
    'Select model',
    models,
    (m) => m.name,
  );
  if (model == null || !context.mounted) return null;

  final variants = await catalog.watchVariants(model.id).first;
  if (!context.mounted) return null;
  final variant = await _pickFromList<ProductVariant>(
    context,
    'Select variant',
    variants,
    (v) => CatalogService.variantLabel(v, model.name),
  );
  if (variant == null) return null;
  return PickedVariant(
      variant.id, CatalogService.variantLabel(variant, '${brand.name} ${model.name}'));
}

Future<T?> _pickFromList<T>(
  BuildContext context,
  String title,
  List<T> items,
  String Function(T) label,
) {
  String query = '';
  return showDialog<T>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx2, setS) {
        final filtered = items
            .where((i) =>
                label(i).toLowerCase().contains(query.toLowerCase()))
            .toList();
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search)),
                  onChanged: (v) => setS(() => query = v),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (_, i) => ListTile(
                      title: Text(label(filtered[i])),
                      onTap: () =>
                          Navigator.pop(ctx2, filtered[i]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx2),
                child: const Text('Cancel')),
          ],
        );
      },
    ),
  );
}

Future<Customer?> pickCustomer(BuildContext context, WidgetRef ref) async {
  final svc = ref.read(customerServiceProvider);
  final customers = await svc.watchCustomers('').first;
  if (!context.mounted) return null;
  return _pickFromList<Customer>(
    context,
    'Select customer',
    customers,
    (c) => c.phone.isEmpty ? c.name : '${c.name} · ${c.phone}',
  );
}

Future<Supplier?> pickSupplier(BuildContext context, WidgetRef ref) async {
  final svc = ref.read(purchaseServiceProvider);
  final suppliers = await svc.watchSuppliers().first;
  if (!context.mounted) return null;
  return _pickFromList<Supplier>(
    context,
    'Select supplier',
    suppliers,
    (s) => s.name,
  );
}

/// Available serialized units for a variant (for sale / dispatch pickers).
Future<List<InventoryUnit>> availableUnits(
    WidgetRef ref, String variantId) async {
  final stock = ref.read(stockServiceProvider);
  return stock.watchUnits(status: 'available', variantId: variantId).first;
}

class PickedUnit {
  final String unitId;
  final String label;
  final int cost;
  const PickedUnit(this.unitId, this.label, this.cost);
}

Future<PickedUnit?> pickAvailableUnit(
    BuildContext context, WidgetRef ref, String variantId, String variantLabel) async {
  final units = await availableUnits(ref, variantId);
  if (!context.mounted) return null;
  if (units.isEmpty) {
    showErrorSnack(context, 'No available units for $variantLabel');
    return null;
  }
  final picked = await _pickFromList<InventoryUnit>(
    context,
    'Select unit — $variantLabel',
    units,
    (u) =>
        '${u.imei1 ?? 'No IMEI'} · ${Money.format(u.purchasePrice)} cost',
  );
  if (picked == null) return null;
  return PickedUnit(picked.id, picked.imei1 ?? picked.id, picked.purchasePrice);
}

class PickedBatch {
  final String batchId;
  final int availableQty;
  final int unitCost;
  const PickedBatch(this.batchId, this.availableQty, this.unitCost);
}

Future<PickedBatch?> pickBatch(
    BuildContext context, WidgetRef ref, String variantId) async {
  final db = ref.read(databaseProvider);
  final batches = await (db.select(db.stockBatches)
        ..where((t) =>
            t.variantId.equals(variantId) & t.quantity.isBiggerThanValue(0)))
      .get();
  if (!context.mounted) return null;
  if (batches.isEmpty) {
    showErrorSnack(context, 'No stock batches available');
    return null;
  }
  final picked = await _pickFromList<StockBatche>(
    context,
    'Select batch',
    batches,
    (b) =>
        'Qty ${b.quantity} · ${Money.format(b.purchasePrice)} cost each',
  );
  if (picked == null) return null;
  return PickedBatch(picked.id, picked.quantity, picked.purchasePrice);
}
