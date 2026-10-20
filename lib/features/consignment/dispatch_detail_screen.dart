import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

class DispatchDetailScreen extends ConsumerWidget {
  final String dispatchId;
  const DispatchDetailScreen({super.key, required this.dispatchId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final svc = ref.watch(dispatchServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Dispatch details')),
      body: FutureBuilder(
        future: Future.wait([
          (db.select(db.dispatches)..where((t) => t.id.equals(dispatchId)))
              .getSingleOrNull(),
          svc.dispatchItems(dispatchId),
        ]),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final d = snap.data![0] as Dispatche?;
          final items = snap.data![1] as List<DispatchItem>;
          if (d == null) {
            return const Center(child: Text('Dispatch not found'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(d.refNo,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800)),
                          Chip(
                              label: Text(
                                  d.status
                                      .replaceAll('_', ' ')
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 11))),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _kv('Recipient', d.recipientName),
                      if (d.recipientPhone.isNotEmpty)
                        _kv('Phone', d.recipientPhone),
                      if (d.recipientAddress.isNotEmpty)
                        _kv('Address', d.recipientAddress),
                      _kv('Date',
                          PkTime.formatDate(d.dispatchDate)),
                      _kv('Agreed total',
                          Money.format(d.agreedPrice)),
                      if (d.notes.isNotEmpty)
                        _kv('Notes', d.notes),
                    ],
                  ),
                ),
              ),
              const SectionHeader(title: 'Items'),
              for (final it in items)
                Card(
                  child: ListTile(
                    leading: Icon(
                        it.status == 'sold'
                            ? Icons.check_circle
                            : it.status == 'returned'
                                ? Icons.undo
                                : Icons.send_outlined,
                        color: it.status == 'sold'
                            ? Colors.green
                            : it.status == 'returned'
                                ? Colors.teal
                                : Colors.blue),
                    title: Text(
                        'Qty ${it.quantity} · agreed ${Money.format(it.agreedPrice)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    subtitle:
                        Text('Status: ${it.status.toUpperCase()}'),
                    trailing: ref.canEditStock &&
                            (it.status == 'sent')
                        ? PopupMenuButton<String>(
                            onSelected: (v) => _onItemAction(
                                context, ref, it, v),
                            itemBuilder: (_) => const [
                              PopupMenuItem(
                                  value: 'sold',
                                  child:
                                      Text('Record sale')),
                              PopupMenuItem(
                                  value: 'returned',
                                  child: Text(
                                      'Record return')),
                            ],
                          )
                        : null,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 100,
                child: Text(k,
                    style:
                        const TextStyle(color: Colors.grey))),
            Expanded(child: Text(v)),
          ],
        ),
      );

  Future<void> _onItemAction(BuildContext context, WidgetRef ref,
      DispatchItem item, String action) async {
    final svc = ref.read(dispatchServiceProvider);
    try {
      if (action == 'sold') {
        final price = TextEditingController(
            text: Money.toEditable(item.agreedPrice));
        final received = TextEditingController(
            text: Money.toEditable(item.agreedPrice));
        final ok = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Confirm consignment sale'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MoneyField(
                    controller: price, label: 'Sale price *'),
                const SizedBox(height: 8),
                MoneyField(
                    controller: received,
                    label: 'Amount received'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () =>
                      Navigator.pop(ctx, false),
                  child: const Text('Cancel')),
              FilledButton(
                  onPressed: () =>
                      Navigator.pop(ctx, true),
                  child: const Text('Confirm')),
            ],
          ),
        );
        if (ok != true || !context.mounted) return;
        final sp = Money.tryParseMajor(price.text) ?? 0;
        final rec = Money.tryParseMajor(received.text) ?? 0;
        await svc.recordConsignmentSale(
          dispatchItemId: item.id,
          quantity: item.quantity,
          salePrice: sp,
          amountReceived: rec,
          date: DateTime.now().millisecondsSinceEpoch,
        );
        if (context.mounted) {
          showOkSnack(context, 'Consignment sale recorded');
        }
      } else {
        final ok = await confirmDialog(context,
            title: 'Record return?',
            message:
                'The unsold units return to available shop stock.');
        if (!ok || !context.mounted) return;
        await svc.recordReturn(
          dispatchItemId: item.id,
          quantity: item.quantity,
          userId: ref.read(sessionProvider)?.userId,
        );
        if (context.mounted) showOkSnack(context, 'Return recorded');
      }
    } catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }
}
