import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../widgets/common.dart';

class CustomersScreen extends ConsumerStatefulWidget {
  const CustomersScreen({super.key});

  @override
  ConsumerState<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends ConsumerState<CustomersScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final svc = ref.watch(customerServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      floatingActionButton: ref.canSell
          ? FloatingActionButton(
              onPressed: () => context.push('/customer/new'),
              child: const Icon(Icons.add),
            )
          : null,
      body: Column(
        children: [
          SearchField(
              onChanged: (v) => setState(() => _query = v),
              hint: 'Search name or phone...'),
          Expanded(
            child: StreamBuilder(
              stream: svc.watchCustomers(_query),
              builder: (ctx, snap) {
                if (!snap.hasData) return const LoadingView();
                final rows = snap.data!;
                if (rows.isEmpty) {
                  return const EmptyState(
                    icon: Icons.people_outlined,
                    title: 'No customers',
                    subtitle: 'Add customers to track udhaar and history.',
                  );
                }
                return ListView.builder(
                  itemCount: rows.length,
                  itemBuilder: (_, i) {
                    final c = rows[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(c.name.characters.first.toUpperCase()),
                        ),
                        title: Text(c.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        subtitle: c.phone.isEmpty
                            ? null
                            : Text(c.phone),
                        trailing: FutureBuilder(
                          future: svc.outstandingBalance(c.id),
                          builder: (ctx2, b) {
                            if (!b.hasData) {
                              return const SizedBox.shrink();
                            }
                            final bal = b.data!;
                            if (bal <= 0) {
                              return const Icon(Icons.check_circle_outline,
                                  color: Colors.green);
                            }
                            return Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              crossAxisAlignment:
                                  CrossAxisAlignment.end,
                              children: [
                                const Text('Due',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey)),
                                MoneyText(bal,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red)),
                              ],
                            );
                          },
                        ),
                        onTap: () =>
                            context.push('/customer/${c.id}'),
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
}
