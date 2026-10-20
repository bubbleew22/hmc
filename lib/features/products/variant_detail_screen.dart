import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../widgets/common.dart';

/// Variant detail: serialized units + quantity batches with status counts.
class VariantDetailScreen extends ConsumerWidget {
  final String variantId;
  const VariantDetailScreen({super.key, required this.variantId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stock = ref.watch(stockServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Product details')),
      floatingActionButton: ref.canEditStock
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/stock/add?variant=$variantId'),
              icon: const Icon(Icons.add),
              label: const Text('Add stock'),
            )
          : null,
      body: FutureBuilder(
        future: Future.wait([
          stock.unitCountsByStatus(variantId),
          stock.batchAvailableQty(variantId),
          stock.watchUnits(variantId: variantId).first,
        ]),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final counts = snap.data![0] as Map<String, int>;
          final batchQty = snap.data![1] as int;
          final units = snap.data![2] as List;
          final available = (counts['available'] ?? 0) + batchQty;
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _chip('Available', available, Colors.green),
                    _chip('Reserved', counts['reserved'] ?? 0, Colors.orange),
                    _chip('Dispatched', counts['dispatched'] ?? 0, Colors.blue),
                    _chip('Sold', counts['sold'] ?? 0, Colors.grey),
                    _chip('Returned', counts['returned'] ?? 0, Colors.teal),
                    _chip('Damaged', counts['damaged'] ?? 0, Colors.red),
                  ],
                ),
              ),
              const SectionHeader(title: 'Serialized units'),
              if (units.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('No serialized units.',
                      style: TextStyle(color: Colors.grey)),
                )
              else
                for (final u in units)
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.smartphone,
                          color: _statusColor(u.status as String)),
                      title: Text((u.imei1 as String?) ?? 'No IMEI',
                          style:
                              const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(
                          '${(u.status as String).toUpperCase()} · ${Money.format(u.purchasePrice as int)}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => _showUnit(context, ref, u),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }

  Widget _chip(String label, int count, Color color) => Chip(
        avatar: CircleAvatar(
            backgroundColor: color, child: Text('$count',
                style: const TextStyle(color: Colors.white, fontSize: 12))),
        label: Text(label),
      );

  static Color _statusColor(String s) => switch (s) {
        'available' => Colors.green,
        'reserved' => Colors.orange,
        'dispatched' => Colors.blue,
        'sold' => Colors.grey,
        'returned' => Colors.teal,
        'damaged' => Colors.red,
        _ => Colors.grey,
      };

  void _showUnit(BuildContext context, WidgetRef ref, dynamic u) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(u.imei1 ?? 'Unit'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _kv('Status', (u.status as String).toUpperCase()),
            _kv('IMEI 2', (u.imei2 as String?) ?? '-'),
            _kv('Serial', (u.serial as String?) ?? '-'),
            _kv('PTA', u.ptaStatus as String),
            _kv('Cost', Money.format(u.purchasePrice as int)),
            _kv('Sale price', Money.format(u.salePrice as int)),
            if ((u.notes as String).isNotEmpty)
              _kv('Notes', u.notes as String),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Close')),
        ],
      ),
    );
  }

  Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 90,
                child: Text(k,
                    style: const TextStyle(color: Colors.grey))),
            Expanded(child: Text(v)),
          ],
        ),
      );
}
