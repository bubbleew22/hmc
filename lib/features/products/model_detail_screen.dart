import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/services/catalog_service.dart';
import '../../widgets/common.dart';

class ModelDetailScreen extends ConsumerWidget {
  final String modelId;
  const ModelDetailScreen({super.key, required this.modelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalog = ref.watch(catalogServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Variants')),
      floatingActionButton: ref.isAdmin
          ? FloatingActionButton(
              onPressed: () => _addVariant(context, ref),
              child: const Icon(Icons.add),
            )
          : null,
      body: FutureBuilder(
        future: (ref.read(databaseProvider).select(
                    ref.read(databaseProvider).productModels)
              ..where((t) => t.id.equals(modelId)))
            .getSingleOrNull(),
        builder: (ctx, modelSnap) {
          return StreamBuilder(
            stream: catalog.watchVariants(modelId),
            builder: (ctx2, snap) {
              if (!snap.hasData) return const LoadingView();
              final variants = snap.data!;
              final modelName = modelSnap.data?.name ?? 'Model';
              if (variants.isEmpty) {
                return const EmptyState(
                  icon: Icons.memory_outlined,
                  title: 'No variants yet',
                  subtitle:
                      'Add RAM / storage / color variants for this model.',
                );
              }
              return ListView.builder(
                itemCount: variants.length,
                itemBuilder: (_, i) {
                  final v = variants[i];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.phone_android_outlined),
                      title: Text(
                          CatalogService.variantLabel(v, modelName),
                          style:
                              const TextStyle(fontWeight: FontWeight.w600)),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/variant/${v.id}'),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _addVariant(BuildContext context, WidgetRef ref) async {
    final ram = TextEditingController();
    final storage = TextEditingController();
    final color = TextEditingController();
    String condition = 'New';
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx2, setS) => AlertDialog(
          title: const Text('Add variant'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: ram,
                    decoration: const InputDecoration(
                        labelText: 'RAM (e.g. 8GB)')),
                TextField(
                    controller: storage,
                    decoration: const InputDecoration(
                        labelText: 'Storage (e.g. 256GB)')),
                TextField(
                    controller: color,
                    decoration: const InputDecoration(
                        labelText: 'Color (e.g. Black)')),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: condition,
                  decoration:
                      const InputDecoration(labelText: 'Condition'),
                  items: const ['New', 'Used', 'Refurbished']
                      .map((c) =>
                          DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) =>
                      setS(() => condition = v ?? 'New'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx2, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx2, true),
                child: const Text('Add')),
          ],
        ),
      ),
    );
    if (ok != true) return;
    try {
      await ref.read(catalogServiceProvider).addVariant(
            modelId: modelId,
            ram: ram.text,
            storage: storage.text,
            color: color.text,
            condition: condition,
          );
      if (context.mounted) showOkSnack(context, 'Variant added');
    } catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }
}
