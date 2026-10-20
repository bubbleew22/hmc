import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

/// Summary tab driving the period used for the dashboard stats and the
/// brand-wise chart. Custom leaves the segmented control unselected.
enum _ReportTab { daily, weekly, monthly, yearly, custom }

/// PKT midnight boundary as UTC epoch millis.
int _dayStartUtc(DateTime localPkt) =>
    DateTime(localPkt.year, localPkt.month, localPkt.day)
        .subtract(const Duration(hours: 5))
        .millisecondsSinceEpoch;

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  _ReportTab _tab = _ReportTab.monthly;
  late DateTime _cursor = PkTime.fromEpochMs(PkTime.nowEpochMs());
  int _customFrom = 0;
  int _customTo = 0;
  String _customLabel = '';

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

  /// (from, to) UTC epoch millis for the current tab/cursor.
  (int, int) get _range {
    switch (_tab) {
      case _ReportTab.daily:
        final from = _dayStartUtc(_cursor);
        return (from, from + 86400000);
      case _ReportTab.weekly:
        final monday = _cursor.subtract(Duration(days: _cursor.weekday - 1));
        final from = _dayStartUtc(monday);
        return (from, from + 7 * 86400000);
      case _ReportTab.monthly:
        final from = _dayStartUtc(DateTime(_cursor.year, _cursor.month, 1));
        final to =
            _dayStartUtc(DateTime(_cursor.year, _cursor.month + 1, 1));
        return (from, to);
      case _ReportTab.yearly:
        final from = _dayStartUtc(DateTime(_cursor.year, 1, 1));
        final to = _dayStartUtc(DateTime(_cursor.year + 1, 1, 1));
        return (from, to);
      case _ReportTab.custom:
        return (_customFrom, _customTo);
    }
  }

  String get _periodLabel {
    switch (_tab) {
      case _ReportTab.daily:
        return DateFormat('d MMM yyyy').format(_cursor);
      case _ReportTab.weekly:
        final monday = _cursor.subtract(Duration(days: _cursor.weekday - 1));
        final sunday = monday.add(const Duration(days: 6));
        return '${DateFormat('d MMM').format(monday)} – '
            '${DateFormat('d MMM yyyy').format(sunday)}';
      case _ReportTab.monthly:
        return DateFormat('MMMM yyyy').format(_cursor);
      case _ReportTab.yearly:
        return '${_cursor.year}';
      case _ReportTab.custom:
        return _customLabel;
    }
  }

  void _shiftCursor(int dir) {
    setState(() {
      switch (_tab) {
        case _ReportTab.daily:
          _cursor = _cursor.add(Duration(days: dir));
          break;
        case _ReportTab.weekly:
          _cursor = _cursor.add(Duration(days: 7 * dir));
          break;
        case _ReportTab.monthly:
          _cursor = DateTime(_cursor.year, _cursor.month + dir, 1);
          break;
        case _ReportTab.yearly:
          _cursor = DateTime(_cursor.year + dir, 1, 1);
          break;
        case _ReportTab.custom:
          break;
      }
    });
  }

  void _selectTab(_ReportTab tab) {
    setState(() {
      _tab = tab;
      if (tab != _ReportTab.custom) {
        _cursor = PkTime.fromEpochMs(PkTime.nowEpochMs());
      }
    });
  }

  Future<void> _customRange() async {
    final (curFrom, curTo) = _range;
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: DateTimeRange(
        start: PkTime.fromEpochMs(curFrom),
        end: PkTime.fromEpochMs(curTo).subtract(const Duration(days: 1)),
      ),
    );
    if (picked != null) {
      final from = _dayStartUtc(picked.start);
      final to = _dayStartUtc(picked.end.add(const Duration(days: 1)));
      setState(() {
        _tab = _ReportTab.custom;
        _customFrom = from;
        _customTo = to;
        _customLabel =
            '${PkTime.formatDate(from)} – ${PkTime.formatDate(to - 86400000)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final report = ref.watch(reportServiceProvider);
    final (from, to) = _range;
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Reports')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          _segmentedControl(),
          _periodNavigator(),
          FutureBuilder(
            future: report.dashboard(from: from, to: to),
            builder: (ctx, snap) {
              if (!snap.hasData) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: LoadingView(),
                );
              }
              final m = snap.data!;
              return GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                childAspectRatio: 1.55,
                children: [
                  StatCard(
                    label: 'Total Sales',
                    minor: m.salesRevenue,
                    icon: Icons.trending_up_outlined,
                    color: HmcColors.success,
                  ),
                  StatCard(
                    label: 'Total Purchase',
                    minor: m.purchases,
                    icon: Icons.shopping_bag_outlined,
                    color: HmcColors.blue600,
                  ),
                  StatCard(
                    label: 'Total Profit',
                    minor: m.grossProfit,
                    icon: Icons.savings_outlined,
                    color: HmcColors.warning,
                  ),
                  StatCard(
                    label: 'Pending Receivable',
                    minor: m.pendingReceivables,
                    icon: Icons.account_balance_wallet_outlined,
                    color: const Color(0xFF7C3AED),
                  ),
                ],
              );
            },
          ),
          const SectionHeader(title: 'Sales by Brand'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FutureBuilder(
                  future: report.brandSales(from, to),
                  builder: (ctx, snap) {
                    if (!snap.hasData) return const LoadingView();
                    final points = snap.data!;
                    if (points.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          'No sales in this period.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }
                    final total =
                        points.fold<int>(0, (s, p) => s + p.total);
                    final sections = [
                      for (final p in points)
                        PieChartSectionData(
                          color: HmcColors.brandColor(p.brand),
                          value: p.total.toDouble(),
                          title: '',
                          radius: 60,
                        ),
                    ];
                    return Column(
                      children: [
                        SizedBox(
                          height: 190,
                          child: PieChart(
                            PieChartData(
                              sections: sections,
                              sectionsSpace: 0,
                              centerSpaceRadius: 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        for (final p in points)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: HmcColors.brandColor(p.brand),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(p.brand,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  total == 0
                                      ? '0.0%'
                                      : '${(p.total / total * 100).toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          SectionHeader(
            title: 'All reports',
            trailing: TextButton.icon(
              onPressed: _customRange,
              icon: const Icon(Icons.date_range_outlined, size: 18),
              label: const Text('Custom'),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _reports.length,
            itemBuilder: (_, i) {
              final (key, title, icon) = _reports[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Card(
                  child: ListTile(
                    leading: Icon(icon),
                    title: Text(title,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(_periodLabel,
                        style: const TextStyle(fontSize: 12)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push(
                        '/reports/detail?report=$key&title=${Uri.encodeComponent(title)}&from=$from&to=$to'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _segmentedControl() {
    final tabs = [
      (_ReportTab.daily, 'Daily'),
      (_ReportTab.weekly, 'Weekly'),
      (_ReportTab.monthly, 'Monthly'),
      (_ReportTab.yearly, 'Yearly'),
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: HmcColors.slateBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          for (final (tab, label) in tabs)
            Expanded(
              child: GestureDetector(
                onTap: () => _selectTab(tab),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: _tab == tab ? HmcColors.blue600 : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: _tab == tab
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _periodNavigator() {
    final isCustom = _tab == _ReportTab.custom;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: isCustom ? null : () => _shiftCursor(-1),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 170),
            child: Text(
              _periodLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: isCustom ? null : () => _shiftCursor(1),
          ),
        ],
      ),
    );
  }
}
