import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

class SalesHistoryScreen extends ConsumerWidget {
  const SalesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svc = ref.watch(salesServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Sales history')),
      floatingActionButton: ref.canSell
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/sale/new'),
              icon: const Icon(Icons.add),
              label: const Text('New sale'),
            )
          : null,
      body: StreamBuilder(
        stream: svc.watchSales(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final rows = snap.data!;
          if (rows.isEmpty) {
            return const EmptyState(
              icon: Icons.receipt_long_outlined,
              title: 'No sales yet',
              subtitle: 'Your invoices will appear here.',
            );
          }
          return ListView.builder(
            itemCount: rows.length,
            itemBuilder: (_, i) {
              final s = rows[i];
              final due = s.total - s.paid;
              return Card(
                child: ListTile(
                  leading: Icon(
                    Icons.receipt_long_outlined,
                    color: s.status == 'cancelled'
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(s.invoiceNo,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          decoration: s.status == 'cancelled'
                              ? TextDecoration.lineThrough
                              : null)),
                  subtitle: Text(
                      '${PkTime.formatDateTime(s.saleDate)} · ${s.paymentMethod}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MoneyText(s.total,
                          style:
                              const TextStyle(fontWeight: FontWeight.w700)),
                      if (due > 0 && s.status == 'final')
                        Text('Due ${Money.format(due)}',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12)),
                      if (s.status == 'cancelled')
                        const Text('CANCELLED',
                            style: TextStyle(
                                color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  onTap: () => context.push('/sale/${s.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
