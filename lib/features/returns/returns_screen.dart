import 'package:drift/drift.dart' show OrderingTerm, Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/utils/ids.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

/// Product returns & refunds with explicit restocking rules.
class ReturnsScreen extends ConsumerStatefulWidget {
  const ReturnsScreen({super.key});

  @override
  ConsumerState<ReturnsScreen> createState() => _ReturnsScreenState();
}

class _ReturnsScreenState extends ConsumerState<ReturnsScreen> {
  Future<void> _newReturn() async {
    // Pick a sold unit to return.
    final stock = ref.read(stockServiceProvider);
    final sold = await stock.watchUnits(status: 'sold').first;
    if (!mounted) return;
    if (sold.isEmpty) {
      showErrorSnack(context, 'No sold units to return');
      return;
    }
    final unit = await showDialog<InventoryUnit>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Select sold unit'),
        content: SizedBox(
          width: double.maxFinite,
          height: 380,
          child: ListView.builder(
            itemCount: sold.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(sold[i].imei1 ?? sold[i].id),
              subtitle: Text(Money.format(sold[i].purchasePrice)),
              onTap: () => Navigator.pop(ctx, sold[i]),
            ),
          ),
        ),
      ),
    );
    if (unit == null || !mounted) return;

    final refund = TextEditingController();
    final reason = TextEditingController();
    var restock = true;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx2, setS) => AlertDialog(
          title: const Text('Return unit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MoneyField(controller: refund, label: 'Refund amount *'),
              TextField(
                  controller: reason,
                  decoration: const InputDecoration(
                      labelText: 'Reason')),
              CheckboxListTile(
                value: restock,
                title: const Text('Return to available stock'),
                onChanged: (v) => setS(() => restock = v ?? true),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx2, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx2, true),
                child: const Text('Record return')),
          ],
        ),
      ),
    );
    if (ok != true || !mounted) return;
    final refundMinor = Money.tryParseMajor(refund.text);
    if (refundMinor == null || refundMinor < 0) {
      showErrorSnack(context, 'Enter a valid refund amount');
      return;
    }
    try {
      final db = ref.read(databaseProvider);
      await db.transaction(() async {
        final id = newId();
        final now = PkTime.nowEpochMs();
        await db.into(db.productReturns).insert(ProductReturnsCompanion(
          id: Value(id),
          unitId: Value(unit.id),
          variantId: Value(unit.variantId),
          quantity: const Value(1),
          refundAmount: Value(refundMinor),
          reason: Value(reason.text),
          restock: Value(restock ? 1 : 0),
          date: Value(now),
          createdAt: Value(now),
        ));
        if (refundMinor > 0) {
          await db.into(db.refunds).insert(RefundsCompanion(
            id: Value(newId()),
            returnId: Value(id),
            amount: Value(refundMinor),
            date: Value(now),
            createdAt: Value(now),
          ));
        }
        await ref.read(stockServiceProvider).moveUnit(
              unitId: unit.id,
              toStatus: restock ? 'available' : 'damaged',
              reason:
                  'Customer return${reason.text.isEmpty ? '' : ': ${reason.text}'}',
              refType: 'return',
              refId: id,
              userId: ref.read(sessionProvider)?.userId,
            );
      });
      if (mounted) showOkSnack(context, 'Return recorded');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Returns & refunds')),
      floatingActionButton: ref.canEditStock
          ? FloatingActionButton.extended(
              onPressed: _newReturn,
              icon: const Icon(Icons.assignment_return_outlined),
              label: const Text('New return'),
            )
          : null,
      body: StreamBuilder(
        stream: (db.select(db.productReturns)
              ..orderBy([(t) => OrderingTerm.desc(t.date)]))
            .watch(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final rows = snap.data!;
          if (rows.isEmpty) {
            return const EmptyState(
              icon: Icons.assignment_return_outlined,
              title: 'No returns',
              subtitle: 'Returned products and refunds appear here.',
            );
          }
          return ListView.builder(
            itemCount: rows.length,
            itemBuilder: (_, i) {
              final r = rows[i];
              return Card(
                child: ListTile(
                  leading: const Icon(
                      Icons.assignment_return_outlined),
                  title: Text(r.reason.isEmpty
                      ? 'Return'
                      : r.reason),
                  subtitle: Text(
                      '${PkTime.formatDate(r.date)} · ${r.restock == 1 ? 'Restocked' : 'Not restocked'}'),
                  trailing: MoneyText(r.refundAmount),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
