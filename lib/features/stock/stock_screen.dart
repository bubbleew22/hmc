import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/money.dart';
import '../../widgets/brand_logo.dart';
import '../../widgets/common.dart';
import '../../widgets/premium.dart';

/// Inventory overview: search by IMEI/model/brand, filter by status.
class StockScreen extends ConsumerStatefulWidget {
  const StockScreen({super.key});

  @override
  ConsumerState<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends ConsumerState<StockScreen> {
  String _query = '';
  String _status = 'all';
  String _view = 'units'; // 'units' | 'batches'

  static const statuses = [
    'all',
    'available',
    'reserved',
    'dispatched',
    'sold',
    'returned',
    'damaged'
  ];

  @override
  Widget build(BuildContext context) {
    final stock = ref.watch(stockServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Movements',
            onPressed: () => context.push('/stock/movements'),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchField(
              onChanged: (v) => setState(() => _query = v),
              hint: 'Search IMEI, serial...'),
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                for (final s in statuses)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(s == 'all' ? 'All' : s.toUpperCase()),
                      selected: _status == s,
                      onSelected: (_) => setState(() => _status = s),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Units'),
                  selected: _view == 'units',
                  onSelected: (_) => setState(() => _view = 'units'),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Batches'),
                  selected: _view == 'batches',
                  onSelected: (_) => setState(() => _view = 'batches'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _view == 'units'
                ? StreamBuilder(
              stream: stock.watchUnits(
                  status: _status == 'all' ? null : _status),
              builder: (ctx, snap) {
                if (!snap.hasData) return const LoadingView();
                var units = snap.data!;
                if (_query.trim().isNotEmpty) {
                  final q = _query.trim().toLowerCase();
                  units = units.where((u) {
                    return (u.imei1 ?? '')
                            .toLowerCase()
                            .contains(q) ||
                        (u.imei2 ?? '').toLowerCase().contains(q) ||
                        (u.serial ?? '').toLowerCase().contains(q);
                  }).toList();
                }
                if (units.isEmpty) {
                  return const EmptyState(
                    icon: Icons.inventory_2_outlined,
                    title: 'No units found',
                    subtitle:
                        'Add stock or try a different search / filter.',
                  );
                }
                return ListView.builder(
                  itemCount: units.length,
                  itemBuilder: (_, i) {
                    final u = units[i];
                    final available = u.status == 'available';
                    final statusColor = _statusColor(u.status);
                    return PremiumListRow(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      leading: const PhoneThumb(size: 48),
                      title: u.imei1 ?? 'No IMEI',
                      subtitle:
                          '${u.status.toUpperCase()} · ${Money.format(u.purchasePrice)}',
                      showChevron: false,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StatusPill(
                            label: available
                                ? 'In Stock'
                                : u.status.toUpperCase(),
                            color: available
                                ? HmcColors.success
                                : statusColor,
                          ),
                          PopupMenuButton<String>(
                            onSelected: (v) => _moveUnit(u.id, v),
                            itemBuilder: (_) => [
                              for (final s in [
                                'available',
                                'reserved',
                                'dispatched',
                                'damaged'
                              ])
                                if (s != u.status)
                                  PopupMenuItem(
                                      value: s,
                                      child: Text(
                                          'Mark ${s.toUpperCase()}')),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            )
                : StreamBuilder(
                    stream: stock.watchAllBatches(),
                    builder: (ctx, snap) {
                      if (!snap.hasData) return const LoadingView();
                      final batches = snap.data!;
                      if (batches.isEmpty) {
                        return const EmptyState(
                          icon: Icons.inventory_2_outlined,
                          title: 'No batches found',
                          subtitle:
                              'Batches are bulk stock added without IMEI numbers.',
                        );
                      }
                      return ListView.builder(
                        itemCount: batches.length,
                        itemBuilder: (_, i) {
                          final b = batches[i];
                          return FutureBuilder(
                            future: ref
                                .read(catalogServiceProvider)
                                .getVariant(b.variantId),
                            builder: (ctx2, vSnap) {
                              final v = vSnap.data;
                              return PremiumListRow(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 5),
                                leading: const PhoneThumb(size: 48),
                                title: v != null
                                    ? '${v.ram}/${v.storage}'
                                    : 'Batch',
                                subtitle:
                                    'Qty: ${b.quantity} · ${Money.format(b.purchasePrice)}/unit',
                                showChevron: false,
                                trailing: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: HmcColors.royal
                                        .withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${b.quantity} pcs',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: HmcColors.royal),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
          ),
          if (ref.canEditStock)
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => context.push('/stock/add'),
                    icon: const Icon(Icons.add),
                    label: const Text('Add New Model'),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  static Color _statusColor(String s) => switch (s) {
        'available' => Colors.green,
        'reserved' => Colors.orange,
        'dispatched' => Colors.blue,
        'sold' => Colors.grey,
        'returned' => Colors.teal,
        'damaged' => Colors.red,
        _ => Colors.grey,
      };

  Future<void> _moveUnit(String unitId, String to) async {
    final reason = await _askReason(context, 'Mark ${to.toUpperCase()}');
    if (reason == null) return;
    try {
      await ref
          .read(stockServiceProvider)
          .adjustUnit(unitId: unitId, toStatus: to, reason: reason);
      if (mounted) showOkSnack(context, 'Updated');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }
}

Future<String?> _askReason(BuildContext context, String title) {
  final c = TextEditingController();
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: TextField(
        controller: c,
        decoration:
            const InputDecoration(labelText: 'Reason (required)'),
        autofocus: true,
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel')),
        FilledButton(
            onPressed: () => Navigator.pop(
                ctx, c.text.trim().isEmpty ? null : c.text),
            child: const Text('Save')),
      ],
    ),
  );
}
