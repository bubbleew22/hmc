import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/validators.dart';
import '../../widgets/common.dart';

class BrandDetailScreen extends ConsumerWidget {
  final String brandId;
  const BrandDetailScreen({super.key, required this.brandId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalog = ref.watch(catalogServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Models')),
      floatingActionButton: ref.isAdmin
          ? FloatingActionButton(
              onPressed: () => _addModel(context, ref),
              child: const Icon(Icons.add),
            )
          : null,
      body: StreamBuilder(
        stream: catalog.watchModels(brandId),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final models = snap.data!;
          if (models.isEmpty) {
            return const EmptyState(
              icon: Icons.smartphone_outlined,
              title: 'No models yet',
              subtitle: 'Add phone models for this brand.',
            );
          }
          return ListView.builder(
            itemCount: models.length,
            itemBuilder: (_, i) {
              final m = models[i];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.smartphone_outlined),
                  title: Text(m.name,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push('/model/${m.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _addModel(BuildContext context, WidgetRef ref) async {
    final c = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add model'),
        content: TextFormField(
          controller: c,
          decoration: const InputDecoration(labelText: 'Model name *'),
          autofocus: true,
          validator: (v) => Validators.required(v, 'Model name'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, c.text),
              child: const Text('Add')),
        ],
      ),
    );
    if (name == null || name.trim().isEmpty) return;
    try {
      await ref.read(catalogServiceProvider).addModel(
          brandId: brandId, name: name);
      if (context.mounted) showOkSnack(context, 'Model added');
    } catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }
}
