import 'package:csv/csv.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

/// Generic report detail: chart + table + CSV export.
class ReportDetailScreen extends ConsumerStatefulWidget {
  final String report;
  final String title;
  const ReportDetailScreen(
      {super.key, required this.report, required this.title});

  @override
  ConsumerState<ReportDetailScreen> createState() =>
      _ReportDetailScreenState();
}

class _ReportDetailScreenState
    extends ConsumerState<ReportDetailScreen> {
  late int _from;
  late int _to;

  @override
  void initState() {
    super.initState();
  }

  bool _initDone = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initDone) {
      _initDone = true;
      final q = GoRouterState.of(context).uri.queryParameters;
      _from = int.tryParse(q['from'] ?? '') ?? 0;
      _to = int.tryParse(q['to'] ?? '') ??
          DateTime.now().millisecondsSinceEpoch;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Export CSV',
            onPressed: _exportCsv,
          ),
        ],
      ),
      body: FutureBuilder(
        future: _load(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }
          return snap.data!;
        },
      ),
    );
  }

  Future<Widget> _load() async {
    final report = ref.read(reportServiceProvider);
    final db = ref.read(databaseProvider);
    switch (widget.report) {
      case 'sales':
        final points = await report.dailySales(_from, _to);
        final total = points.fold<int>(0, (s, p) => s + p.total);
        return _chartTable(
          chart: _barChart(points.map((p) => p.total.toDouble()).toList(),
              points.map((p) => PkTime.formatDate(p.day, pattern: 'dd/MM')).toList()),
          summary: 'Total sales: ${Money.format(total)}',
          rows: [
            for (final p in points)
              [PkTime.formatDate(p.day), Money.format(p.total)]
          ],
          headers: const ['Date', 'Sales'],
        );
      case 'profit':
        final st = await report.profitStatement(_from, _to);
        return _kvReport('Profit statement', {
          'Sales revenue': st.salesRevenue,
          'Sales returns': -st.salesReturns,
          'Discounts': -st.discounts,
          'Net sales': st.netSales,
          'Cost of goods sold': -st.cogs,
          'Gross profit': st.grossProfit,
          'Operating expenses': -st.expenses,
          'Net profit': st.netProfit,
        });
      case 'brand_sales':
        final points = await report.brandSales(_from, _to);
        return _chartTable(
          chart: _barChart(points.map((p) => p.total.toDouble()).toList(),
              points.map((p) => p.brand).toList()),
          summary:
              'Total: ${Money.format(points.fold<int>(0, (s, p) => s + p.total))}',
          rows: [
            for (final p in points) [p.brand, Money.format(p.total)]
          ],
          headers: const ['Brand', 'Sales'],
        );
      case 'top_models':
        final points = await report.topModels(_from, _to);
        return _chartTable(
          chart: _barChart(points.map((p) => p.total.toDouble()).toList(),
              points.map((p) => p.brand).toList()),
          summary: '${points.length} models sold',
          rows: [
            for (final p in points) [p.brand, '${p.total} units']
          ],
          headers: const ['Model', 'Qty sold'],
        );
      case 'stock_value':
        return _stockValuation(db);
      case 'purchases':
        final rows = await (db.select(db.purchaseInvoices)
              ..where((t) =>
                  t.purchaseDate.isBiggerOrEqualValue(_from) &
                  t.purchaseDate.isSmallerThanValue(_to))
              ..orderBy([(t) => OrderingTerm.desc(t.purchaseDate)]))
            .get();
        return _chartTable(
          summary:
              'Total: ${Money.format(rows.fold<int>(0, (s, r) => s + r.total))}',
          rows: [
            for (final r in rows)
              [
                r.refNo,
                PkTime.formatDate(r.purchaseDate),
                Money.format(r.total),
                Money.format(r.total - r.paid),
              ]
          ],
          headers: const ['Ref', 'Date', 'Total', 'Due'],
        );
      case 'expenses':
        final cats = await db.select(db.expenseCategories).get();
        final catById = {for (final c in cats) c.id: c.name};
        final rows = await (db.select(db.expenses)
              ..where((t) =>
                  t.date.isBiggerOrEqualValue(_from) &
                  t.date.isSmallerThanValue(_to))
              ..orderBy([(t) => OrderingTerm.desc(t.date)]))
            .get();
        return _chartTable(
          summary:
              'Total: ${Money.format(rows.fold<int>(0, (s, r) => s + r.amount))}',
          rows: [
            for (final r in rows)
              [
                PkTime.formatDate(r.date),
                catById[r.categoryId] ?? '',
                r.description,
                Money.format(r.amount),
              ]
          ],
          headers: const ['Date', 'Category', 'Description', 'Amount'],
        );
      case 'receivables':
        return _duesReport(kind: 'customer');
      case 'payables':
        return _duesReport(kind: 'supplier');
      case 'collections':
        final rows = await (db.select(db.customerPayments)
              ..where((t) =>
                  t.date.isBiggerOrEqualValue(_from) &
                  t.date.isSmallerThanValue(_to))
              ..orderBy([(t) => OrderingTerm.desc(t.date)]))
            .get();
        return _chartTable(
          summary:
              'Collected: ${Money.format(rows.fold<int>(0, (s, r) => s + r.amount))}',
          rows: [
            for (final r in rows)
              [
                PkTime.formatDate(r.date),
                r.method,
                Money.format(r.amount),
              ]
          ],
          headers: const ['Date', 'Method', 'Amount'],
        );
      case 'pay_methods':
        final points = await report.paymentsByMethod(_from, _to);
        return _chartTable(
          chart: _pieChart(points),
          summary:
              'Total: ${Money.format(points.fold<int>(0, (s, p) => s + p.total))}',
          rows: [
            for (final p in points) [p.brand, Money.format(p.total)]
          ],
          headers: const ['Method', 'Amount'],
        );
      case 'dispatch':
        final dispatches = await (db.select(db.dispatches)
              ..where((t) =>
                  t.dispatchDate.isBiggerOrEqualValue(_from) &
                  t.dispatchDate.isSmallerThanValue(_to))
              ..orderBy([(t) => OrderingTerm.desc(t.dispatchDate)]))
            .get();
        return _chartTable(
          summary: '${dispatches.length} dispatches',
          rows: [
            for (final d in dispatches)
              [
                d.refNo,
                d.recipientName,
                PkTime.formatDate(d.dispatchDate),
                d.status.replaceAll('_', ' ').toUpperCase(),
              ]
          ],
          headers: const ['Ref', 'Recipient', 'Date', 'Status'],
        );
      case 'returns':
        final rows = await (db.select(db.productReturns)
              ..where((t) =>
                  t.date.isBiggerOrEqualValue(_from) &
                  t.date.isSmallerThanValue(_to))
              ..orderBy([(t) => OrderingTerm.desc(t.date)]))
            .get();
        return _chartTable(
          summary:
              'Refunded: ${Money.format(rows.fold<int>(0, (s, r) => s + r.refundAmount))}',
          rows: [
            for (final r in rows)
              [
                PkTime.formatDate(r.date),
                r.reason.isEmpty ? '-' : r.reason,
                Money.format(r.refundAmount),
              ]
          ],
          headers: const ['Date', 'Reason', 'Refund'],
        );
      case 'low_stock':
        return _lowStock(db);
      case 'movements':
        final rows = await ref
            .read(stockServiceProvider)
            .movementHistory(limit: 300);
        final filtered = rows
            .where((m) =>
                m.createdAt >= _from && m.createdAt < _to)
            .toList();
        return _chartTable(
          summary: '${filtered.length} movements',
          rows: [
            for (final m in filtered)
              [
                PkTime.formatDateTime(m.createdAt),
                m.reason,
                '${m.fromStatus ?? '-'} → ${m.toStatus}',
              ]
          ],
          headers: const ['When', 'Reason', 'Change'],
        );
      default:
        return const Center(child: Text('Unknown report'));
    }
  }

  Future<Widget> _stockValuation(AppDatabase db) async {
    final units = await db.select(db.inventoryUnits).get();
    final batches = await db.select(db.stockBatches).get();
    var qty = 0, cost = 0, retail = 0;
    for (final u in units) {
      if (u.status == 'available') {
        qty++;
        cost += u.purchasePrice;
        retail += u.salePrice;
      }
    }
    for (final b in batches) {
      qty += b.quantity;
      cost += b.quantity * b.purchasePrice;
    }
    return _kvReport('Stock valuation (available)', {
      'Units in stock': qty,
      'Purchase value': cost,
      'Potential retail value': retail,
      'Potential margin': retail - cost,
    }, moneyFor: {'Units in stock'});
  }

  Future<Widget> _lowStock(AppDatabase db) async {
    final settings = await db.readSettings();
    final threshold = settings?.lowStockThreshold ?? 5;
    final variants = await db.select(db.productVariants).get();
    final models = await db.select(db.productModels).get();
    final modelById = {for (final m in models) m.id: m};
    final stock = ref.read(stockServiceProvider);
    final rows = <List<String>>[];
    for (final v in variants) {
      final counts = await stock.unitCountsByStatus(v.id);
      final bQty = await stock.batchAvailableQty(v.id);
      final avail = (counts['available'] ?? 0) + bQty;
      if (avail <= threshold) {
        final m = modelById[v.modelId];
        rows.add(['${m?.name ?? ''} ${v.storage} ${v.color}'.trim(), '$avail']);
      }
    }
    return _chartTable(
      summary:
          '${rows.length} variants at or below threshold ($threshold)',
      rows: rows,
      headers: const ['Variant', 'Available'],
    );
  }

  Future<Widget> _duesReport({required String kind}) async {
    if (kind == 'customer') {
      final svc = ref.read(customerServiceProvider);
      final customers = await svc.customersWithDues();
      final rows = <List<String>>[];
      var total = 0;
      for (final c in customers) {
        final b = await svc.outstandingBalance(c.id);
        if (b > 0) {
          rows.add([c.name, c.phone, Money.format(b)]);
          total += b;
        }
      }
      return _chartTable(
        summary: 'Total receivable: ${Money.format(total)}',
        rows: rows,
        headers: const ['Customer', 'Phone', 'Due'],
      );
    } else {
      final db = ref.read(databaseProvider);
      final svc = ref.read(purchaseServiceProvider);
      final suppliers = await db.select(db.suppliers).get();
      final rows = <List<String>>[];
      var total = 0;
      for (final s in suppliers) {
        final b = await svc.supplierBalance(s.id);
        if (b > 0) {
          rows.add([s.name, Money.format(b)]);
          total += b;
        }
      }
      return _chartTable(
        summary: 'Total payable: ${Money.format(total)}',
        rows: rows,
        headers: const ['Supplier', 'Due'],
      );
    }
  }

  Widget _kvReport(String title, Map<String, int> kv,
      {Set<String>? moneyFor}) {
    final moneyKeys = moneyFor ?? kv.keys.toSet();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                for (final e in kv.entries)
                  ListTile(
                    title: Text(e.key),
                    trailing: moneyKeys.contains(e.key)
                        ? Text('${e.value}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700))
                        : MoneyText(e.value,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700)),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _chartTable({
    Widget? chart,
    required String summary,
    required List<List<String>> rows,
    required List<String> headers,
  }) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (chart != null)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(height: 220, child: chart),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(summary,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700)),
        ),
        if (rows.isEmpty)
          const Text('No data in this period.',
              style: TextStyle(color: Colors.grey))
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                for (final h in headers) DataColumn(label: Text(h))
              ],
              rows: [
                for (final r in rows)
                  DataRow(
                      cells: [for (final c in r) DataCell(Text(c))]),
              ],
            ),
          ),
      ],
    );
  }

  Widget _barChart(List<double> values, List<String> labels) {
    if (values.isEmpty) {
      return const Center(child: Text('No data'));
    }
    final maxV = values.reduce((a, b) => a > b ? a : b);
    return BarChart(
      BarChartData(
        maxY: maxV * 1.2 == 0 ? 1 : maxV * 1.2,
        barGroups: [
          for (var i = 0; i < values.length; i++)
            BarChartGroupData(x: i, barRods: [
              BarChartRodData(
                  toY: values[i],
                  color: Theme.of(context).colorScheme.primary,
                  width: 14,
                  borderRadius: BorderRadius.circular(4)),
            ]),
        ],
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (v, _) {
                final i = v.toInt();
                if (i < 0 || i >= labels.length) {
                  return const SizedBox.shrink();
                }
                final l = labels[i];
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                      l.length > 8 ? '${l.substring(0, 8)}…' : l,
                      style: const TextStyle(fontSize: 9)),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Widget _pieChart(List<dynamic> points) {
    if (points.isEmpty) return const Center(child: Text('No data'));
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.red
    ];
    return PieChart(
      PieChartData(
        sections: [
          for (var i = 0; i < points.length; i++)
            PieChartSectionData(
              value: (points[i].total as int).toDouble(),
              title: points[i].brand as String,
              color: colors[i % colors.length],
              radius: 80,
              titleStyle:
                  const TextStyle(fontSize: 10, color: Colors.white),
            ),
        ],
      ),
    );
  }

  Future<void> _exportCsv() async {
    try {
      final report = ref.read(reportServiceProvider);
      List<List<String>> rows;
      List<String> headers;
      switch (widget.report) {
        case 'profit':
          final st = await report.profitStatement(_from, _to);
          headers = const ['Line', 'Amount'];
          rows = [
            ['Sales revenue', Money.format(st.salesRevenue)],
            ['Sales returns', Money.format(st.salesReturns)],
            ['Discounts', Money.format(st.discounts)],
            ['Net sales', Money.format(st.netSales)],
            ['COGS', Money.format(st.cogs)],
            ['Gross profit', Money.format(st.grossProfit)],
            ['Expenses', Money.format(st.expenses)],
            ['Net profit', Money.format(st.netProfit)],
          ];
          break;
        case 'brand_sales':
          final points = await report.brandSales(_from, _to);
          headers = const ['Brand', 'Sales'];
          rows = [
            for (final p in points) [p.brand, Money.format(p.total)]
          ];
          break;
        default:
          headers = const ['Report', 'Value'];
          rows = [
            [widget.title, PkTime.formatDate(_from)]
          ];
      }
      final csv = const ListToCsvConverter()
          .convert([headers, ...rows]);
      await Share.share(csv, subject: '${widget.title}.csv');
      if (mounted) showOkSnack(context, 'Report shared as CSV');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }
}
