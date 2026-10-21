import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/common.dart';

class CustomersScreen extends ConsumerStatefulWidget {
  const CustomersScreen({super.key});

  @override
  ConsumerState<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends ConsumerState<CustomersScreen> {
  String _query = '';

  static const _avatarColors = [
    HmcColors.royal,
    HmcColors.blue600,
    HmcColors.success,
    HmcColors.warning,
    HmcColors.gold600,
  ];

  static String _initials(String name) {
    final words = name.trim().split(RegExp(r'\s+'));
    final first = words.isNotEmpty && words[0].isNotEmpty ? words[0][0] : '';
    final second = words.length > 1 && words[1].isNotEmpty ? words[1][0] : '';
    return '$first$second'.toUpperCase();
  }

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
          Row(
            children: [
              Expanded(
                child: SearchField(
                    onChanged: (v) => setState(() => _query = v),
                    hint: 'Search customer...'),
              ),
              if (ref.canSell)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: IconButton.filledTonal(
                    icon: const Icon(Icons.person_add),
                    tooltip: 'Add customer',
                    onPressed: () => context.push('/customer/new'),
                  ),
                ),
            ],
          ),
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
                    final avatarColor =
                        _avatarColors[c.name.hashCode.abs() % _avatarColors.length];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: avatarColor,
                          child: Text(
                            _initials(c.name),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        title: Text(c.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        subtitle: c.phone.isEmpty
                            ? null
                            : Text(c.phone),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FutureBuilder(
                              future: svc.outstandingBalance(c.id),
                              builder: (ctx2, b) {
                                if (!b.hasData) {
                                  return const SizedBox.shrink();
                                }
                                final bal = b.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    bal > 0
                                        ? MoneyText(bal,
                                            style: const TextStyle(
                                                fontWeight:
                                                    FontWeight.w700,
                                                color:
                                                    HmcColors.danger))
                                        : const Text('Rs 0',
                                            style: TextStyle(
                                                fontWeight:
                                                    FontWeight.w700,
                                                color:
                                                    HmcColors.success)),
                                    Text(
                                      bal > 0 ? '(Due)' : '(Clear)',
                                      style: const TextStyle(
                                          fontSize: 11,
                                          color: HmcColors.slate),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const Icon(Icons.chevron_right,
                                color: HmcColors.slate),
                          ],
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
