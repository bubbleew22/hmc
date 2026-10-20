import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/share/whatsapp.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

/// Udhaar / credit recovery: dues, collections, WhatsApp reminders.
class CreditRecoveryScreen extends ConsumerStatefulWidget {
  const CreditRecoveryScreen({super.key});

  @override
  ConsumerState<CreditRecoveryScreen> createState() =>
      _CreditRecoveryScreenState();
}

class _CreditRecoveryScreenState
    extends ConsumerState<CreditRecoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Credit recovery')),
      body: FutureBuilder(
        future: _load(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final data = snap.data!;
          final dues = data.dues;
          final total = data.total;
          if (dues.isEmpty) {
            return const EmptyState(
              icon: Icons.check_circle_outline,
              title: 'All clear!',
              subtitle: 'No outstanding customer credit.',
            );
          }
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  color: Colors.red.withOpacity(0.06),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total outstanding',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                        MoneyText(total,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.red)),
                      ],
                    ),
                  ),
                ),
              ),
              for (final d in dues)
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(d.customer.name.characters.first
                            .toUpperCase())),
                    title: Text(d.customer.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    subtitle: Text(d.customer.phone.isEmpty
                        ? 'No phone'
                        : d.customer.phone),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MoneyText(d.balance,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.red)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (d.customer.phone.isNotEmpty)
                              IconButton(
                                icon: const Icon(Icons.chat_outlined,
                                    color: Colors.green, size: 20),
                                tooltip: 'WhatsApp reminder',
                                onPressed: () =>
                                    _remind(d.customer, d.balance),
                              ),
                            IconButton(
                              icon: const Icon(
                                  Icons.payments_outlined,
                                  size: 20),
                              tooltip: 'Collect payment',
                              onPressed: () => context.push(
                                  '/customer/${d.customer.id}/payment'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () =>
                        context.push('/customer/${d.customer.id}'),
                  ),
                ),
              const SectionHeader(title: 'Recent collections'),
              for (final p in data.recentPayments)
                ListTile(
                  leading: const Icon(Icons.payments_outlined,
                      color: Colors.green),
                  title: MoneyText(p.amount,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                      '${PkTime.formatDate(p.date)} · ${p.method}'),
                ),
            ],
          );
        },
      ),
    );
  }

  Future<_DueData> _load() async {
    final svc = ref.read(customerServiceProvider);
    final db = ref.read(databaseProvider);
    final customers = await svc.customersWithDues();
    final dues = <_Due>[];
    var total = 0;
    for (final c in customers) {
      final b = await svc.outstandingBalance(c.id);
      if (b > 0) {
        dues.add(_Due(c, b));
        total += b;
      }
    }
    dues.sort((a, b) => b.balance.compareTo(a.balance));
    final recentPayments = await (db.select(db.customerPayments)
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(10))
        .get();
    return _DueData(dues, total, recentPayments);
  }

  Future<void> _remind(Customer customer, int balance) async {
    if (!WhatsApp.canSendTo(customer.phone)) {
      showErrorSnack(context, 'Customer has no valid phone number');
      return;
    }
    final settings =
        await ref.read(shopServiceProvider).getSettings();
    final msg = WhatsApp.buildMessage(
      template: settings?.whatsappTemplate ?? '',
      customerName: customer.name,
      amountText: Money.format(balance),
      shopName: settings?.shopName ?? 'Hassan Mobile Center',
    );
    // Let the user review/edit before sending.
    final edited = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final c = TextEditingController(text: msg);
        return AlertDialog(
          title: const Text('WhatsApp reminder'),
          content: TextField(
              controller: c, maxLines: 5,
              decoration: const InputDecoration(
                  labelText: 'Message (edit if needed)')),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel')),
            FilledButton.icon(
              onPressed: () => Navigator.pop(ctx, c.text),
              icon: const Icon(Icons.send_outlined),
              label: const Text('Open WhatsApp'),
            ),
          ],
        );
      },
    );
    if (edited == null || edited.trim().isEmpty || !mounted) return;
    final ok = await WhatsApp.sendReminder(customer.phone, edited);
    if (!ok && mounted) showErrorSnack(context, 'Could not open WhatsApp');
  }
}

class _Due {
  final Customer customer;
  final int balance;
  _Due(this.customer, this.balance);
}

class _DueData {
  final List<_Due> dues;
  final int total;
  final List<CustomerPayment> recentPayments;
  _DueData(this.dues, this.total, this.recentPayments);
}
