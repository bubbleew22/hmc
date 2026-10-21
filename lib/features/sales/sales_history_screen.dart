import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';
import '../../widgets/premium.dart';

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
              final cancelled = s.status == 'cancelled';
              return PremiumListRow(
                leading: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: (cancelled
                            ? HmcColors.slate
                            : HmcColors.royal)
                        .withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.receipt_long_outlined,
                    color: cancelled
                        ? HmcColors.slate
                        : HmcColors.royal,
                    size: 22,
                  ),
                ),
                title: s.invoiceNo,
                subtitle:
                    '${PkTime.formatDateTime(s.saleDate)} · ${s.paymentMethod}',
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MoneyText(s.total,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            decoration: cancelled
                                ? TextDecoration.lineThrough
                                : null)),
                    if (due > 0 && s.status == 'final')
                      Text('Due ${Money.format(due)}',
                          style: const TextStyle(
                              color: HmcColors.danger,
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                    if (cancelled)
                      const StatusPill(
                          label: 'CANCELLED',
                          color: HmcColors.slate),
                  ],
                ),
                onTap: () => context.push('/sale/${s.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
