import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

class DispatchListScreen extends ConsumerWidget {
  const DispatchListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svc = ref.watch(dispatchServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Dispatch & consignment')),
      floatingActionButton: ref.canEditStock
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/dispatch/new'),
              icon: const Icon(Icons.add),
              label: const Text('New dispatch'),
            )
          : null,
      body: Column(
        children: [
          FutureBuilder(
            future: svc.outstandingByRecipient(),
            builder: (ctx, snap) {
              final map = snap.data ?? {};
              if (map.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text('Outstanding with people',
                            style: TextStyle(
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 8),
                        for (final e in map.entries)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(e.key),
                                Text('${e.value} units',
                                    style: const TextStyle(
                                        fontWeight:
                                            FontWeight.w700)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: svc.watchDispatches(),
              builder: (ctx, snap) {
                if (!snap.hasData) return const LoadingView();
                final rows = snap.data!;
                if (rows.isEmpty) {
                  return const EmptyState(
                    icon: Icons.send_outlined,
                    title: 'No dispatches',
                    subtitle:
                        'Track stock sent to other people here.',
                  );
                }
                return ListView.builder(
                  itemCount: rows.length,
                  itemBuilder: (_, i) {
                    final d = rows[i];
                    return Card(
                      child: ListTile(
                        leading:
                            const Icon(Icons.send_outlined),
                        title: Text(d.recipientName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        subtitle: Text(
                            '${d.refNo} · ${PkTime.formatDate(d.dispatchDate)}'),
                        trailing: Chip(
                            label: Text(
                                _prettyStatus(d.status),
                                style: const TextStyle(
                                    fontSize: 11))),
                        onTap: () =>
                            context.push('/dispatch/${d.id}'),
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

  static String _prettyStatus(String s) => s.replaceAll('_', ' ').toUpperCase();
}
