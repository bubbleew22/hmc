import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../widgets/common.dart';
import '../../widgets/pickers.dart';

class SuppliersScreen extends ConsumerStatefulWidget {
  const SuppliersScreen({super.key});

  @override
  ConsumerState<SuppliersScreen> createState() => _SuppliersScreenState();
}

class _SuppliersScreenState extends ConsumerState<SuppliersScreen> {
  Future<void> _add() async {
    final name = TextEditingController();
    final phone = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add supplier'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: name,
                decoration:
                    const InputDecoration(labelText: 'Name *')),
            TextField(
                controller: phone,
                decoration:
                    const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Add')),
        ],
      ),
    );
    if (ok != true || name.text.trim().isEmpty) return;
    try {
      await ref
          .read(purchaseServiceProvider)
          .addSupplier(name: name.text, phone: phone.text);
      if (mounted) showOkSnack(context, 'Supplier added');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final svc = ref.watch(purchaseServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Suppliers')),
      floatingActionButton: ref.isAdmin
          ? FloatingActionButton(
              onPressed: _add, child: const Icon(Icons.add))
          : null,
      body: StreamBuilder(
        stream: svc.watchSuppliers(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final suppliers = snap.data!;
          if (suppliers.isEmpty) {
            return const EmptyState(
              icon: Icons.local_shipping_outlined,
              title: 'No suppliers',
              subtitle: 'Add the people you buy stock from.',
            );
          }
          return ListView.builder(
            itemCount: suppliers.length,
            itemBuilder: (_, i) {
              final s = suppliers[i];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.local_shipping_outlined),
                  title: Text(s.name,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: s.phone.isEmpty
                      ? null
                      : Text(s.phone),
                  trailing: FutureBuilder(
                    future: svc.supplierBalance(s.id),
                    builder: (ctx2, b) {
                      if (!b.hasData) return const SizedBox.shrink();
                      final bal = b.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Payable',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey)),
                          MoneyText(bal,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700),
                              negativeColor: Colors.red),
                        ],
                      );
                    },
                  ),
                  onTap: () => _supplierSheet(s.id, s.name),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _supplierSheet(String id, String name) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                title: Text(name,
                    style:
                        const TextStyle(fontWeight: FontWeight.w700))),
            ListTile(
              leading: const Icon(Icons.payments_outlined),
              title: const Text('Pay supplier'),
              onTap: () {
                Navigator.pop(ctx);
                _paySupplier(id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('New purchase'),
              onTap: () {
                Navigator.pop(ctx);
                context.push('/purchase/new?supplier=$id');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _paySupplier(String supplierId) async {
    final amount = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pay supplier'),
        content: MoneyField(controller: amount, label: 'Amount *'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Pay')),
        ],
      ),
    );
    if (ok != true) return;
    final minor = Money.tryParseMajor(amount.text);
    if (minor == null || minor <= 0) {
      if (mounted) showErrorSnack(context, 'Enter a valid amount');
      return;
    }
    try {
      await ref.read(purchaseServiceProvider).paySupplier(
            supplierId: supplierId,
            amount: minor,
            date: DateTime.now().millisecondsSinceEpoch,
          );
      if (mounted) showOkSnack(context, 'Payment recorded');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }
}
