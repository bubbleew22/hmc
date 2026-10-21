import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

class PurchaseDetailScreen extends ConsumerWidget {
  final String purchaseId;
  const PurchaseDetailScreen({super.key, required this.purchaseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase details')),
      body: FutureBuilder(
        future: (db.select(db.purchaseInvoices)
              ..where((t) => t.id.equals(purchaseId)))
            .getSingleOrNull(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final p = snap.data;
          if (p == null) {
            return const Center(child: Text('Purchase not found'));
          }
          return FutureBuilder(
            future: (db.select(db.purchaseItems)
                  ..where((t) => t.purchaseId.equals(purchaseId)))
                .get(),
            builder: (ctx2, itemsSnap) {
              final items = itemsSnap.data ?? [];
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _kv('Reference', p.refNo),
                  _kv('Date', PkTime.formatDate(p.purchaseDate)),
                  _kv('Subtotal', p.subtotal),
                  _kv('Discount', p.discount),
                  _kv('Expenses', p.expenses),
                  _kv('Total', p.total, bold: true),
                  _kv('Paid', p.paid),
                  _kv('Balance', p.total - p.paid, bold: true),
                  _kv('Method', p.paymentMethod),
                  if (p.notes.isNotEmpty) _kv('Notes', p.notes),
                  if (p.userId != null)
                    FutureBuilder(
                      future: (db.select(db.localUsers)
                            ..where((t) => t.id.equals(p.userId!)))
                          .getSingleOrNull(),
                      builder: (ctx3, uSnap) {
                        final uname = uSnap.data?.name;
                        if (uname == null || uname.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return _kv('Purchased by', uname);
                      },
                    ),
                  const SizedBox(height: 16),
                  const Text('Items',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 8),
                  for (final it in items)
                    Card(
                      child: ListTile(
                        title: Text(
                            'Qty ${it.quantity} × unit',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        trailing: Text(
                            '${(it.unitCost / 100).toStringAsFixed(0)} Rs avg'),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _kv(String k, Object v, {bool bold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
                width: 110,
                child: Text(k,
                    style: const TextStyle(color: Colors.grey))),
            Expanded(
              child: v is int
                  ? MoneyText(v,
                      style: TextStyle(
                          fontWeight:
                              bold ? FontWeight.w800 : FontWeight.w600))
                  : Text(v.toString(),
                      style: TextStyle(
                          fontWeight:
                              bold ? FontWeight.w800 : FontWeight.normal)),
            ),
          ],
        ),
      );
}
