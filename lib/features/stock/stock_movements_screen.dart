import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

/// Full audit trail of every stock movement.
class StockMovementsScreen extends ConsumerStatefulWidget {
  const StockMovementsScreen({super.key});

  @override
  ConsumerState<StockMovementsScreen> createState() =>
      _StockMovementsScreenState();
}

class _StockMovementsScreenState
    extends ConsumerState<StockMovementsScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final stock = ref.watch(stockServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Stock movements')),
      body: Column(
        children: [
          SearchField(
              onChanged: (v) => setState(() => _query = v),
              hint: 'Search reason...'),
          Expanded(
            child: FutureBuilder(
              future: stock.movementHistory(limit: 300),
              builder: (ctx, snap) {
                if (!snap.hasData) return const LoadingView();
                var rows = snap.data!;
                if (_query.trim().isNotEmpty) {
                  final q = _query.trim().toLowerCase();
                  rows = rows
                      .where((r) =>
                          r.reason.toLowerCase().contains(q))
                      .toList();
                }
                if (rows.isEmpty) {
                  return const EmptyState(
                    icon: Icons.history,
                    title: 'No movements',
                    subtitle: 'Every stock change is recorded here.',
                  );
                }
                return ListView.builder(
                  itemCount: rows.length,
                  itemBuilder: (_, i) {
                    final m = rows[i];
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          m.quantityDelta < 0
                              ? Icons.remove_circle_outline
                              : Icons.add_circle_outline,
                          color: m.quantityDelta < 0
                              ? Colors.red
                              : Colors.green,
                        ),
                        title: Text(m.reason,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        subtitle: Text(
                            '${m.fromStatus ?? '-'} → ${m.toStatus} · ${PkTime.formatDateTime(m.createdAt)}'),
                        trailing: m.quantityDelta != 0
                            ? Text(
                                m.quantityDelta > 0
                                    ? '+${m.quantityDelta}'
                                    : '${m.quantityDelta}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
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
}
