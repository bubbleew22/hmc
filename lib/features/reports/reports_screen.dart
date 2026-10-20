import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/time.dart';

/// Common date-range presets for reports.
class DateRangePreset {
  final String label;
  final int from;
  final int to;
  const DateRangePreset(this.label, this.from, this.to);
}

List<DateRangePreset> reportPresets() {
  final nowUtc = DateTime.now().toUtc();
  final pktNow = nowUtc.add(const Duration(hours: 5));
  int dayStart(DateTime d) =>
      DateTime(d.year, d.month, d.day).subtract(const Duration(hours: 5)).millisecondsSinceEpoch;

  final today = DateTime(pktNow.year, pktNow.month, pktNow.day);
  final t0 = dayStart(today);
  final t1 = t0 + 86400000;
  final weekStart = today.subtract(Duration(days: today.weekday - 1));
  final w0 = dayStart(weekStart);
  final monthStart = DateTime(today.year, today.month, 1);
  final m0 = dayStart(monthStart);
  final nextMonth = DateTime(today.year, today.month + 1, 1);
  final m1 = dayStart(nextMonth);
  final yearStart = DateTime(today.year, 1, 1);
  final y0 = dayStart(yearStart);
  final nextYear = DateTime(today.year + 1, 1, 1);
  final y1 = dayStart(nextYear);

  return [
    DateRangePreset('Today', t0, t1),
    DateRangePreset('Yesterday', t0 - 86400000, t0),
    DateRangePreset('This week', w0, w0 + 7 * 86400000),
    DateRangePreset('Last week', w0 - 7 * 86400000, w0),
    DateRangePreset('This month', m0, m1),
    DateRangePreset('Last month', dayStart(DateTime(today.year, today.month - 1, 1)), m0),
    DateRangePreset('This year', y0, y1),
    DateRangePreset('Previous year', dayStart(DateTime(today.year - 1, 1, 1)), y0),
  ];
}

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  late DateRangePreset _preset = reportPresets()[4]; // this month

  static const _reports = [
    ('sales', 'Daily sales', Icons.today_outlined),
    ('profit', 'Profit statement', Icons.savings_outlined),
    ('brand_sales', 'Brand-wise sales', Icons.category_outlined),
    ('top_models', 'Top-selling models', Icons.star_outline),
    ('stock_value', 'Stock valuation', Icons.warehouse_outlined),
    ('purchases', 'Purchase history', Icons.shopping_bag_outlined),
    ('expenses', 'Expenses', Icons.money_off_outlined),
    ('receivables', 'Customer outstanding', Icons.account_balance_wallet_outlined),
    ('payables', 'Supplier outstanding', Icons.local_shipping_outlined),
    ('collections', 'Payment collections', Icons.payments_outlined),
    ('pay_methods', 'Payment method breakdown', Icons.credit_card_outlined),
    ('dispatch', 'Dispatch & consignment', Icons.send_outlined),
    ('returns', 'Returns & refunds', Icons.assignment_return_outlined),
    ('low_stock', 'Low-stock report', Icons.warning_amber_outlined),
    ('movements', 'Inventory movement audit', Icons.history),
  ];

  Future<void> _customRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: DateTimeRange(
        start: PkTime.fromEpochMs(_preset.from),
        end: PkTime.fromEpochMs(_preset.to).subtract(const Duration(days: 1)),
      ),
    );
    if (picked != null) {
      final from = DateTime(picked.start.year, picked.start.month, picked.start.day)
          .subtract(const Duration(hours: 5))
          .millisecondsSinceEpoch;
      final to = DateTime(picked.end.year, picked.end.month, picked.end.day)
          .add(const Duration(days: 1))
          .subtract(const Duration(hours: 5))
          .millisecondsSinceEpoch;
      setState(() => _preset = DateRangePreset(
          '${PkTime.formatDate(from)} – ${PkTime.formatDate(to)}', from, to));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              children: [
                for (final p in reportPresets())
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(p.label),
                      selected: _preset.label == p.label,
                      onSelected: (_) => setState(() => _preset = p),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: const Text('Custom range'),
                    selected: !reportPresets()
                        .any((p) => p.label == _preset.label),
                    onSelected: (_) => _customRange(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _reports.length,
              itemBuilder: (_, i) {
                final (key, title, icon) = _reports[i];
                return Card(
                  child: ListTile(
                    leading: Icon(icon),
                    title: Text(title,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(_preset.label,
                        style: const TextStyle(fontSize: 12)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push(
                        '/reports/detail?report=$key&title=${Uri.encodeComponent(title)}&from=${_preset.from}&to=${_preset.to}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
