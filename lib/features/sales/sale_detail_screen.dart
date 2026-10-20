import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

class SaleDetailScreen extends ConsumerWidget {
  final String saleId;
  const SaleDetailScreen({super.key, required this.saleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final svc = ref.watch(salesServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.receipt_outlined),
            tooltip: 'Receipt',
            onPressed: () => context.push('/sale/$saleId/receipt'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Future.wait([
          (db.select(db.salesInvoices)..where((t) => t.id.equals(saleId)))
              .getSingleOrNull(),
          svc.saleItems(saleId),
        ]),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final inv = snap.data![0] as SalesInvoice?;
          final items = snap.data![1] as List<SalesItem>;
          if (inv == null) {
            return const Center(child: Text('Sale not found'));
          }
          return FutureBuilder(
            future: ref
                .read(customerServiceProvider)
                .getCustomer(inv.customerId),
            builder: (ctx2, cSnap) {
              final customer = cSnap.data;
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(inv.invoiceNo,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              _statusChip(inv.status),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _kv('Date',
                              PkTime.formatDateTime(inv.saleDate)),
                          _kv('Customer', customer?.name ?? '-'),
                          _kv('Phone', customer?.phone ?? '-'),
                          _kv('Payment',
                              '${_prettyType(inv.paymentType)} · ${inv.paymentMethod}'),
                          if (inv.warranty.isNotEmpty)
                            _kv('Warranty', inv.warranty),
                          if (inv.notes.isNotEmpty)
                            _kv('Notes', inv.notes),
                        ],
                      ),
                    ),
                  ),
                  const SectionHeader(title: 'Items'),
                  for (final it in items)
                    Card(
                      child: ListTile(
                        title: Text(
                            'Qty ${it.quantity} × ${Money.format(it.unitPrice)}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        trailing: MoneyText(
                            it.quantity * it.unitPrice),
                      ),
                    ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _moneyRow('Subtotal', inv.subtotal),
                          if (inv.discount > 0)
                            _moneyRow('Discount', -inv.discount),
                          if (inv.tax > 0)
                            _moneyRow('Tax', inv.tax),
                          const Divider(),
                          _moneyRow('Total', inv.total, bold: true),
                          _moneyRow('Paid', inv.paid),
                          _moneyRow('Balance due', inv.total - inv.paid,
                              bold: true,
                              color: inv.total - inv.paid > 0
                                  ? Colors.red
                                  : Colors.green),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (inv.status == 'final' && ref.isAdmin)
                    OutlinedButton.icon(
                      onPressed: () => _cancel(context, ref),
                      icon: const Icon(Icons.cancel_outlined,
                          color: Colors.red),
                      label: const Text('Cancel this sale',
                          style: TextStyle(color: Colors.red)),
                    ),
                  const SizedBox(height: 24),
                ],
              );
            },
          );
        },
      ),
    );
  }

  static String _prettyType(String t) => switch (t) {
        'full' => 'Full payment',
        'partial' => 'Partial payment',
        _ => 'Credit / Udhaar',
      };

  Widget _statusChip(String status) => Chip(
        label: Text(status.toUpperCase(),
            style: const TextStyle(fontSize: 11)),
        backgroundColor: status == 'final'
            ? Colors.green.withOpacity(0.15)
            : Colors.grey.withOpacity(0.2),
      );

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

  Widget _moneyRow(String label, int minor,
          {bool bold = false, Color? color}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(
                    fontWeight:
                        bold ? FontWeight.w800 : FontWeight.w600)),
            MoneyText(minor,
                style: TextStyle(
                    fontWeight:
                        bold ? FontWeight.w800 : FontWeight.w600),
                negativeColor: Colors.red),
          ],
        ),
      );

  Future<void> _cancel(BuildContext context, WidgetRef ref) async {
    final ok = await confirmDialog(context,
        title: 'Cancel sale?',
        message:
            'The invoice stays in history as CANCELLED and stock returns to available. Payments already recorded stay as history.',
        confirmLabel: 'Cancel sale',
        danger: true);
    if (!ok) return;
    try {
      await ref.read(salesServiceProvider).cancelSale(saleId,
          userId: ref.read(sessionProvider)?.userId);
      if (context.mounted) {
        showOkSnack(context, 'Sale cancelled');
        context.pop();
      }
    } catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }
}
