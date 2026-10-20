import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/config/app_config.dart';
import '../../core/providers.dart';
import '../../core/services/report_service.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';
import '../../widgets/hmc_bottom_nav.dart';

/// Home dashboard.
/// Back from Home asks to exit the app.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Future<bool> _onPop() => confirmDialog(
        context,
        title: 'Exit app?',
        message: 'Do you want to close Hassan Mobile Center?',
        confirmLabel: 'Exit',
      );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (await _onPop() && context.mounted) Navigator.of(context).pop();
      },
      child: const Scaffold(
        body: _Dashboard(),
        bottomNavigationBar: HmcBottomNav(currentIndex: 0),
      ),
    );
  }
}

class _Dashboard extends ConsumerStatefulWidget {
  const _Dashboard();

  @override
  ConsumerState<_Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<_Dashboard> {
  int _refreshKey = 0;

  @override
  Widget build(BuildContext context) {
    final report = ref.watch(reportServiceProvider);
    final settings = ref.watch(settingsStreamProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(settings.valueOrNull?.shopName ?? 'Hassan Mobile Center',
                style: const TextStyle(fontSize: 18, color: Colors.white)),
            Text(settings.valueOrNull?.subtitle ?? 'Shewa Adda',
                style: const TextStyle(
                    fontSize: 12,
                    color: HmcColors.gold600,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_outline, color: Colors.white),
            tooltip: 'Lock',
            onPressed: () {
              ref.read(sessionProvider.notifier).state = null;
              context.go('/login');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: FutureBuilder(
        key: ValueKey(_refreshKey),
        future: report.dashboard(),
        builder: (ctx, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const LoadingView();
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }
          final m = snap.data!;
          return RefreshIndicator(
            onRefresh: () async => setState(() => _refreshKey++),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                  children: [
                    StatCard(
                      label: 'Today Sales',
                      minor: m.salesRevenue,
                      icon: Icons.trending_up,
                      color: HmcColors.success,
                    ),
                    StatCard(
                      label: 'Today Purchases',
                      minor: m.purchases,
                      icon: Icons.shopping_bag_outlined,
                      color: HmcColors.danger,
                    ),
                    CountCard(
                      label: 'Total Stock',
                      value: '${m.availableQty} units',
                      icon: Icons.inventory_2_outlined,
                      color: HmcColors.blue600,
                      onTap: () => context.push('/stock'),
                    ),
                    StatCard(
                      label: 'Pending Payments',
                      minor: m.pendingReceivables,
                      icon: Icons.account_balance_wallet_outlined,
                      color: HmcColors.warning,
                      onTap: () => context.push('/credit'),
                    ),
                  ],
                ),
                const _SalesOverviewCard(),
                const _TopBrandsCard(),
                if (m.dispatchedQty > 0)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Card(
                      color: HmcColors.gold600.withValues(alpha: 0.12),
                      child: ListTile(
                        leading: const Icon(Icons.send_outlined,
                            color: HmcColors.gold600),
                        title:
                            Text('${m.dispatchedQty} units with other people'),
                        subtitle:
                            const Text('Dispatched / consignment stock'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => context.push('/dispatch'),
                      ),
                    ),
                  ),
                const SectionHeader(title: 'Recent sales'),
                if (m.recentSales.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No sales yet. Tap Sales → New Sale to start.',
                        style: TextStyle(color: Colors.grey)),
                  )
                else
                  for (final s in m.recentSales)
                    ListTile(
                      leading: const Icon(Icons.receipt_long_outlined),
                      title: Text(s.invoiceNo),
                      subtitle: Text(PkTime.formatDateTime(s.saleDate)),
                      trailing: MoneyText(s.total),
                      onTap: () => context.push('/sale/${s.id}'),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}

enum _ChartRange { daily, weekly, monthly, yearly }

class _Bucket {
  final DateTime start;
  final String label;
  const _Bucket(this.start, this.label);
}

class _SalesOverviewCard extends ConsumerStatefulWidget {
  const _SalesOverviewCard();

  @override
  ConsumerState<_SalesOverviewCard> createState() => _SalesOverviewCardState();
}

class _SalesOverviewCardState extends ConsumerState<_SalesOverviewCard> {
  _ChartRange _range = _ChartRange.daily;
  late final Future<List<DailyPoint>> _future;

  @override
  void initState() {
    super.initState();
    final report = ref.read(reportServiceProvider);
    final now = PkTime.nowEpochMs();
    _future = report.dailySales(
        now - const Duration(days: 1825).inMilliseconds, now);
  }

  static String _rangeLabel(_ChartRange r) {
    final n = r.name;
    return n[0].toUpperCase() + n.substring(1);
  }

  List<_Bucket> _buckets(DateTime today) {
    switch (_range) {
      case _ChartRange.daily:
        return List.generate(7, (i) {
          final d = today.subtract(Duration(days: 6 - i));
          return _Bucket(d, DateFormat('d MMM').format(d));
        });
      case _ChartRange.weekly:
        final monday = today.subtract(Duration(days: today.weekday - 1));
        return List.generate(8, (i) {
          final d = monday.subtract(Duration(days: 7 * (7 - i)));
          return _Bucket(d, DateFormat('d MMM').format(d));
        });
      case _ChartRange.monthly:
        return List.generate(12, (i) {
          final d = DateTime(today.year, today.month - 11 + i);
          return _Bucket(d, DateFormat('MMM').format(d));
        });
      case _ChartRange.yearly:
        return List.generate(5, (i) {
          final d = DateTime(today.year - 4 + i);
          return _Bucket(d, DateFormat('yyyy').format(d));
        });
    }
  }

  int _bucketIndex(List<_Bucket> buckets, DateTime point) {
    var l = point;
    if (_range == _ChartRange.weekly) {
      l = l.subtract(Duration(days: l.weekday - 1));
    }
    for (var i = 0; i < buckets.length; i++) {
      final b = buckets[i].start;
      final match = switch (_range) {
        _ChartRange.daily || _ChartRange.weekly =>
          l.year == b.year && l.month == b.month && l.day == b.day,
        _ChartRange.monthly => l.year == b.year && l.month == b.month,
        _ChartRange.yearly => l.year == b.year,
      };
      if (match) return i;
    }
    return -1;
  }

  Widget _buildChart(List<DailyPoint> points) {
    final nowLocal = PkTime.fromEpochMs(PkTime.nowEpochMs());
    final today =
        DateTime(nowLocal.year, nowLocal.month, nowLocal.day);
    final buckets = _buckets(today);
    final totals = List<double>.filled(buckets.length, 0);
    for (final p in points) {
      final idx = _bucketIndex(buckets, PkTime.fromEpochMs(p.day));
      if (idx >= 0) totals[idx] += p.total;
    }
    final labels = [for (final b in buckets) b.label];
    if (!totals.any((t) => t > 0)) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text('No sales data yet for this range.',
              style: TextStyle(color: Colors.grey)),
        ),
      );
    }
    final maxY = totals.reduce((a, b) => a > b ? a : b) * 1.15;
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          maxY: maxY,
          barTouchData: const BarTouchData(enabled: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 26,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final i = value.toInt();
                  if (i < 0 || i >= labels.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(labels[i],
                        style: const TextStyle(
                            fontSize: 9, color: Colors.grey)),
                  );
                },
              ),
            ),
          ),
          barGroups: [
            for (var i = 0; i < totals.length; i++)
              BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: totals[i],
                    color: HmcColors.blue600,
                    width: 14,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sales Overview',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Row(
                children: [
                  for (final r in _ChartRange.values)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: GestureDetector(
                          onTap: () => setState(() => _range = r),
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: _range == r
                                  ? HmcColors.blue600
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _rangeLabel(r),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _range == r
                                    ? Colors.white
                                    : HmcColors.slate,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              FutureBuilder<List<DailyPoint>>(
                future: _future,
                builder: (ctx, snap) {
                  if (snap.connectionState != ConnectionState.done) {
                    return const SizedBox(
                      height: 200,
                      child:
                          Center(child: CircularProgressIndicator()),
                    );
                  }
                  return _buildChart(snap.data ?? const []);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBrandsCard extends ConsumerWidget {
  const _TopBrandsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(reportServiceProvider);
    final now = PkTime.nowEpochMs();
    final nowLocal = PkTime.fromEpochMs(now);
    final monthStart = DateTime(nowLocal.year, nowLocal.month)
        .subtract(AppConfig.pakistanOffset)
        .millisecondsSinceEpoch;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Top Brands (This Month)',
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              FutureBuilder<List<BrandPoint>>(
                future: report.brandSales(monthStart, now),
                builder: (ctx, snap) {
                  if (snap.connectionState != ConnectionState.done) {
                    return const SizedBox(
                      height: 80,
                      child:
                          Center(child: CircularProgressIndicator()),
                    );
                  }
                  final brands = snap.data ?? const [];
                  if (brands.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('No brand sales this month yet.',
                          style: TextStyle(color: Colors.grey)),
                    );
                  }
                  final maxTotal =
                      brands.map((b) => b.total).reduce((a, b) => a > b ? a : b);
                  final monthSum =
                      brands.fold<int>(0, (s, b) => s + b.total);
                  return Column(
                    children: [
                      for (final b in brands)
                        _brandRow(b, maxTotal, monthSum),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _brandRow(BrandPoint b, int maxTotal, int monthSum) {
    final color = HmcColors.brandColor(b.brand);
    final share =
        monthSum == 0 ? 0 : (100 * b.total / monthSum).round();
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration:
                    BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(b.brand,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    Text('$share% of this month',
                        style: const TextStyle(
                            fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
              MoneyText(b.total,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: maxTotal == 0 ? 0 : b.total / maxTotal,
            color: HmcColors.blue600,
            backgroundColor: HmcColors.slateBg,
            borderRadius: BorderRadius.circular(4),
            minHeight: 6,
          ),
        ],
      ),
    );
  }
}
