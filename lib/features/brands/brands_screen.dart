import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../widgets/common.dart';

class BrandsScreen extends ConsumerStatefulWidget {
  const BrandsScreen({super.key});

  @override
  ConsumerState<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends ConsumerState<BrandsScreen> {
  String _query = '';
  bool _showArchived = false;

  Future<void> _addBrand() async {
    final name = await _askName(context, 'Add brand', 'Brand name');
    if (name == null || name.trim().isEmpty) return;
    try {
      await ref.read(catalogServiceProvider).addBrand(name);
      if (mounted) showOkSnack(context, 'Brand added');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final catalog = ref.watch(catalogServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brands'),
        actions: [
          IconButton(
            icon: Icon(_showArchived
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
            tooltip: 'Archived',
            onPressed: () =>
                setState(() => _showArchived = !_showArchived),
          ),
        ],
      ),
      floatingActionButton: ref.isAdmin
          ? FloatingActionButton(
              onPressed: _addBrand, child: const Icon(Icons.add))
          : null,
      body: Column(
        children: [
          SearchField(onChanged: (v) => setState(() => _query = v),
              hint: 'Search brands...'),
          Expanded(
            child: StreamBuilder(
              stream: catalog.watchBrands(
                  includeArchived: _showArchived),
              builder: (ctx, snap) {
                if (!snap.hasData) return const LoadingView();
                var brands = snap.data!;
                if (_query.isNotEmpty) {
                  brands = brands
                      .where((b) => b.name
                          .toLowerCase()
                          .contains(_query.toLowerCase()))
                      .toList();
                }
                if (brands.isEmpty) {
                  return const EmptyState(
                    icon: Icons.category_outlined,
                    title: 'No brands',
                    subtitle: 'Add your first brand to start the catalogue.',
                  );
                }
                return ListView.builder(
                  itemCount: brands.length,
                  itemBuilder: (_, i) {
                    final b = brands[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          child: Text(b.name.characters.first,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800)),
                        ),
                        title: Text(b.name,
                            style: TextStyle(
                                decoration: b.isArchived == 1
                                    ? TextDecoration.lineThrough
                                    : null)),
                        trailing: ref.isAdmin
                            ? PopupMenuButton<String>(
                                onSelected: (v) =>
                                    _onMenu(v, b.id, b.name, b.isArchived == 1),
                                itemBuilder: (_) => [
                                  const PopupMenuItem(
                                      value: 'rename',
                                      child: Text('Rename')),
                                  PopupMenuItem(
                                      value: 'archive',
                                      child: Text(b.isArchived == 1
                                          ? 'Unarchive'
                                          : 'Archive')),
                                ],
                              )
                            : const Icon(Icons.chevron_right),
                        onTap: () => context.push('/brand/${b.id}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onMenu(
      String action, String id, String name, bool archived) async {
    final catalog = ref.read(catalogServiceProvider);
    try {
      if (action == 'rename') {
        final newName = await _askName(context, 'Rename brand', 'Brand name',
            initial: name);
        if (newName != null && newName.trim().isNotEmpty) {
          await catalog.renameBrand(id, newName);
        }
      } else {
        if (!archived && await catalog.brandHasRecords(id)) {
          if (!mounted) return;
          final ok = await confirmDialog(context,
              title: 'Archive brand?',
              message:
                  '$name has linked records. It will be archived (hidden) but never deleted, so history stays intact.');
          if (!ok) return;
        }
        await catalog.archiveBrand(id, !archived);
      }
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }
}

Future<String?> _askName(BuildContext context, String title, String label,
    {String? initial}) {
  final c = TextEditingController(text: initial ?? '');
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: TextField(
          controller: c,
          decoration: InputDecoration(labelText: label),
          autofocus: true),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        FilledButton(
            onPressed: () => Navigator.pop(ctx, c.text),
            child: const Text('Save')),
      ],
    ),
  );
}
