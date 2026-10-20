import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

class ExpensesScreen extends ConsumerStatefulWidget {
  const ExpensesScreen({super.key});

  @override
  ConsumerState<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends ConsumerState<ExpensesScreen> {
  Future<void> _add() async {
    final svc = ref.read(expenseServiceProvider);
    final categories = await svc.watchCategories().first;
    if (!mounted) return;
    String? categoryId =
        categories.isEmpty ? null : categories.first.id;
    final desc = TextEditingController();
    final amount = TextEditingController();
    int date = PkTime.nowEpochMs();
    String method = 'Cash';
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx2, setS) => AlertDialog(
          title: const Text('Add expense'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: categoryId,
                  decoration:
                      const InputDecoration(labelText: 'Category *'),
                  items: [
                    for (final c in categories)
                      DropdownMenuItem(
                          value: c.id, child: Text(c.name))
                  ],
                  onChanged: (v) =>
                      setS(() => categoryId = v),
                ),
                TextField(
                    controller: desc,
                    decoration: const InputDecoration(
                        labelText: 'Description *')),
                MoneyField(
                    controller: amount,
                    label: 'Amount *',
                    allowZero: false),
                const SizedBox(height: 8),
                DateField(
                    value: date,
                    onChanged: (v) => setS(() => date = v)),
                DropdownButtonFormField<String>(
                  value: method,
                  decoration: const InputDecoration(
                      labelText: 'Payment method'),
                  items: const [
                    'Cash',
                    'Bank Transfer',
                    'Easypaisa',
                    'JazzCash',
                    'Card',
                    'Other'
                  ]
                      .map((m) => DropdownMenuItem(
                          value: m, child: Text(m)))
                      .toList(),
                  onChanged: (v) =>
                      setS(() => method = v ?? 'Cash'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx2, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx2, true),
                child: const Text('Save')),
          ],
        ),
      ),
    );
    if (ok != true || !mounted) return;
    if (categoryId == null || desc.text.trim().isEmpty) {
      showErrorSnack(context, 'Category and description are required');
      return;
    }
    final minor = Money.tryParseMajor(amount.text);
    if (minor == null || minor <= 0) {
      showErrorSnack(context, 'Enter a valid amount');
      return;
    }
    try {
      await svc.addExpense(
        categoryId: categoryId!,
        description: desc.text,
        date: date,
        amount: minor,
        method: method,
      );
      if (mounted) showOkSnack(context, 'Expense saved');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final svc = ref.watch(expenseServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      floatingActionButton: ref.isAdmin
          ? FloatingActionButton(
              onPressed: _add, child: const Icon(Icons.add))
          : null,
      body: StreamBuilder(
        stream: svc.watchExpenses(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final rows = snap.data!;
          if (rows.isEmpty) {
            return const EmptyState(
              icon: Icons.money_off_outlined,
              title: 'No expenses',
              subtitle: 'Track rent, electricity, salaries and more.',
            );
          }
          return FutureBuilder(
            future: svc.watchCategories().first,
            builder: (ctx2, catSnap) {
              final cats = {
                for (final c in (catSnap.data ?? <ExpenseCategory>[]))
                  c.id: c.name
              };
              return ListView.builder(
                itemCount: rows.length,
                itemBuilder: (_, i) {
                  final e = rows[i];
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                          Icons.money_off_outlined),
                      title: Text(e.description,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600)),
                      subtitle: Text(
                          '${cats[e.categoryId] ?? ''} · ${PkTime.formatDate(e.date)}'),
                      trailing: MoneyText(e.amount),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
