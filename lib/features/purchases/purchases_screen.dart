import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

class PurchasesScreen extends ConsumerWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svc = ref.watch(purchaseServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Purchases')),
      floatingActionButton: ref.canEditStock
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/purchase/new'),
              icon: const Icon(Icons.add),
              label: const Text('New purchase'),
            )
          : null,
      body: StreamBuilder(
        stream: svc.watchPurchases(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final rows = snap.data!;
          if (rows.isEmpty) {
            return const EmptyState(
              icon: Icons.shopping_bag_outlined,
              title: 'No purchases yet',
              subtitle: 'Record your first stock purchase.',
            );
          }
          return ListView.builder(
            itemCount: rows.length,
            itemBuilder: (_, i) {
              final p = rows[i];
              final due = p.total - p.paid;
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: Text(p.refNo,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(PkTime.formatDate(p.purchaseDate)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MoneyText(p.total,
                          style:
                              const TextStyle(fontWeight: FontWeight.w700)),
                      if (due > 0)
                        Text('Due ${Money.format(due)}',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12)),
                    ],
                  ),
                  onTap: () => context.push('/purchase/${p.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
