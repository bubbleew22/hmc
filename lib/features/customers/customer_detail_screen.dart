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

class CustomerDetailScreen extends ConsumerWidget {
  final String customerId;
  const CustomerDetailScreen({super.key, required this.customerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final svc = ref.watch(customerServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () =>
                context.push('/customer/$customerId/edit'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Future.wait([
          svc.getCustomer(customerId),
          svc.outstandingBalance(customerId),
          (ref.read(databaseProvider).select(
                      ref.read(databaseProvider).salesInvoices)
                ..where((t) =>
                    t.customerId.equals(customerId) &
                    t.status.equals('final'))
                ..orderBy(
                    [(t) => OrderingTerm.desc(t.saleDate)])
                ..limit(5))
              .get(),
          (ref.read(databaseProvider).select(
                      ref.read(databaseProvider).customerPayments)
                ..where((t) => t.customerId.equals(customerId))
                ..orderBy([(t) => OrderingTerm.desc(t.date)])
                ..limit(5))
              .get(),
        ]),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final customer = snap.data![0] as Customer?;
          if (customer == null) {
            return const Center(child: Text('Customer not found'));
          }
          final balance = snap.data![1] as int;
          final sales = snap.data![2] as List<SalesInvoice>;
          final payments = snap.data![3] as List<CustomerPayment>;
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
                        children: [
                          CircleAvatar(
                            radius: 26,
                            child: Text(customer.name.characters.first
                                .toUpperCase()),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(customer.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800)),
                                if (customer.phone.isNotEmpty)
                                  Text(customer.phone,
                                      style: const TextStyle(
                                          color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Outstanding balance',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600)),
                          MoneyText(balance,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                              negativeColor: Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => context.push(
                          '/customer/$customerId/payment'),
                      icon: const Icon(Icons.payments_outlined),
                      label: const Text('Receive payment'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => context.push(
                          '/customer/$customerId/ledger'),
                      icon: const Icon(Icons.receipt_long_outlined),
                      label: const Text('Ledger'),
                    ),
                  ),
                ],
              ),
              if (balance > 0 && customer.phone.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: OutlinedButton.icon(
                    onPressed: () =>
                        _whatsappReminder(context, ref, customer, balance),
                    icon: const Icon(Icons.chat_outlined,
                        color: Colors.green),
                    label: const Text('WhatsApp reminder',
                        style: TextStyle(color: Colors.green)),
                  ),
                ),
              const SectionHeader(title: 'Recent sales'),
              if (sales.isEmpty)
                const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('No sales yet.',
                        style: TextStyle(color: Colors.grey)))
              else
                for (final s in sales)
                  ListTile(
                    title: Text(s.invoiceNo),
                    subtitle:
                        Text(PkTime.formatDate(s.saleDate)),
                    trailing: MoneyText(s.total),
                    onTap: () => context.push('/sale/${s.id}'),
                  ),
              const SectionHeader(title: 'Recent payments'),
              if (payments.isEmpty)
                const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('No payments yet.',
                        style: TextStyle(color: Colors.grey)))
              else
                for (final p in payments)
                  ListTile(
                    leading: const Icon(Icons.payments_outlined,
                        color: Colors.green),
                    title: MoneyText(p.amount,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        '${PkTime.formatDate(p.date)} · ${p.method}'),
                  ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _whatsappReminder(BuildContext context, WidgetRef ref,
      Customer customer, int balance) async {
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
    final ok = await WhatsApp.sendReminder(customer.phone, msg);
    if (!ok && context.mounted) {
      showErrorSnack(context, 'Could not open WhatsApp');
    }
  }
}
