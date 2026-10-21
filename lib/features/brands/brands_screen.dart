import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/brand_logo.dart';
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
    final isAdmin = ref.isAdmin;
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
      body: Column(
        children: [
          SearchField(
              onChanged: (v) => setState(() => _query = v),
              hint: 'Search brand...'),
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
                if (brands.isEmpty && !isAdmin) {
                  return const EmptyState(
                    icon: Icons.category_outlined,
                    title: 'No brands',
                    subtitle:
                        'Add your first brand to start the catalogue.',
                  );
                }
                final tiles = brands.length + (isAdmin ? 1 : 0);
                if (tiles == 0) {
                  return const EmptyState(
                    icon: Icons.category_outlined,
                    title: 'No brands',
                    subtitle:
                        'Add your first brand to start the catalogue.',
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: tiles,
                  itemBuilder: (_, i) {
                    if (i >= brands.length) return _addTile();
                    final b = brands[i];
                    final archived = b.isArchived == 1;
                    return StreamBuilder(
                      stream: catalog.watchModels(b.id),
                      builder: (ctx2, ms) => BrandTile(
                        brandName: b.name,
                        modelCount:
                            ms.hasData ? ms.data!.length : 0,
                        archived: archived,
                        onTap: () => context.push('/brand/${b.id}'),
                        trailingMenu: isAdmin
                            ? PopupMenuButton<String>(
                                iconSize: 20,
                                padding: EdgeInsets.zero,
                                onSelected: (v) => _onMenu(
                                    v, b.id, b.name, archived),
                                itemBuilder: (_) => [
                                  const PopupMenuItem(
                                      value: 'rename',
                                      child: Text('Rename')),
                                  PopupMenuItem(
                                      value: 'archive',
                                      child: Text(archived
                                          ? 'Unarchive'
                                          : 'Archive')),
                                ],
                              )
                            : null,
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

  Widget _addTile() {
    return Card(
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: HmcColors.royal, width: 1.5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: _addBrand,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 36, color: HmcColors.royal),
            SizedBox(height: 6),
            Text(
              'Add New Brand',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: HmcColors.royal,
              ),
            ),
          ],
        ),
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
