import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/config/app_config.dart';
import '../../core/providers.dart';
import '../../core/services/report_service.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../widgets/brand_logo.dart';
import '../../widgets/common.dart';
import '../../widgets/premium.dart';

/// Home dashboard — premium fintech-style redesign.
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
    final shopName = settings.valueOrNull?.shopName ?? 'Hassan Mobile Center';
    final subtitle = settings.valueOrNull?.subtitle ?? 'Shewa Adda';
    final today = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

    return Scaffold(
      body: FutureBuilder(
        key: ValueKey(_refreshKey),
        future: report.dashboard(),
        builder: (ctx, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return Column(
              children: [
                GradientHero(title: shopName, subtitle: subtitle),
                const SizedBox(height: 16),
                const ShimmerCard(),
                const ShimmerCard(),
              ],
            );
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }
          final m = snap.data!;
          return RefreshIndicator(
            onRefresh: () async => setState(() => _refreshKey++),
            color: HmcColors.royal,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: GradientHero(
                    title: shopName,
                    subtitle: subtitle,
                    dateLine: today,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.lock_outline,
                            color: Colors.white),
                        tooltip: 'Lock',
                        onPressed: () {
                          ref.read(sessionProvider.notifier).state = null;
                          context.go('/login');
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings_outlined,
                            color: Colors.white),
                        onPressed: () => context.push('/settings'),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Transform.translate(
                    offset: const Offset(0, -24),
                    child: _StatGrid(m: m),
                  ),
                ),
                const SliverToBoxAdapter(child: _SalesOverviewCard()),
                const SliverToBoxAdapter(child: _TopBrandsCard()),
                if (m.dispatchedQty > 0)
                  SliverToBoxAdapter(
                    child: FadeSlideIn(
                      delayMs: 350,
                      child: PremiumCard(
                        onTap: () => context.push('/dispatch'),
                        child: Row(
                          children: [
                            const GradientIcon(
                              icon: Icons.send_outlined,
                              gradient: [
                                HmcColors.gold500,
                                HmcColors.gold600
                              ],
                              size: 44,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${m.dispatchedQty} units with others',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Text(
                                    'Dispatched / consignment stock',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      color: HmcColors.slate,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right,
                                color: Color(0xFFB6BECB)),
                          ],
                        ),
                      ),
                    ),
                  ),
                const SliverToBoxAdapter(
                  child: PremiumSectionHeader(title: 'Recent sales'),
                ),
                if (m.recentSales.isEmpty)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: EmptyState(
                        icon: Icons.receipt_long_outlined,
                        title: 'No sales yet',
                        subtitle:
                            'Tap Sales → New Sale to record your first sale.',
                      ),
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final s = m.recentSales[i];
                        return FadeSlideIn(
                          delayMs: 400 + i * 60,
                          child: PremiumListRow(
                            leading: Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: HmcColors.royal
                                    .withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.receipt_long_outlined,
                                color: HmcColors.royal,
                                size: 22,
                              ),
                            ),
                            title: s.invoiceNo,
                            subtitle:
                                PkTime.formatDateTime(s.saleDate),
                            trailing: MoneyText(
                              s.total,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                            onTap: () =>
                                context.push('/sale/${s.id}'),
                          ),
                        );
                      },
                      childCount: m.recentSales.length,
                    ),
                  ),
                const SliverToBoxAdapter(
                    child: SizedBox(height: 28)),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// 2×2 grid of premium stat cards with gradient icons and entrance animation.
class _StatGrid extends ConsumerWidget {
  final dynamic m;
  const _StatGrid({required this.m});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = [
      _StatData(
        'Today Sales',
        Money.format(m.salesRevenue),
        Icons.trending_up_rounded,
        const [Color(0xFF22C55E), Color(0xFF16A34A)],
        null,
      ),
      _StatData(
        'Today Purchases',
        Money.format(m.purchases),
        Icons.shopping_bag_outlined,
        const [Color(0xFFF87171), Color(0xFFDC2626)],
        null,
      ),
      _StatData(
        'Total Stock',
        '${m.availableQty} units',
        Icons.inventory_2_outlined,
        const [Color(0xFF60A5FA), Color(0xFF2563EB)],
        () => context.push('/stock'),
      ),
      _StatData(
        'Pending Payments',
        Money.format(m.pendingReceivables),
        Icons.account_balance_wallet_outlined,
        const [Color(0xFFFBBF24), Color(0xFFD97706)],
        () => context.push('/credit'),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.42,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: cards.length,
        itemBuilder: (_, i) {
          final c = cards[i];
          return FadeSlideIn(
            delayMs: i * 80,
            child: PremiumCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(14),
              onTap: c.onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientIcon(
                    icon: c.icon,
                    gradient: c.gradient,
                    size: 42,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.value,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.4,
                          fontFeatures: [
                            FontFeature.tabularFigures()
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        c.label,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: HmcColors.slate,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StatData {
  final String label;
  final String value;
  final IconData icon;
  final List<Color> gradient;
  final VoidCallback? onTap;
  const _StatData(
      this.label, this.value, this.icon, this.gradient, this.onTap);
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
  ConsumerState<_SalesOverviewCard> createState() =>
      _SalesOverviewCardState();
}

class _SalesOverviewCardState
    extends ConsumerState<_SalesOverviewCard> {
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
        final monday =
            today.subtract(Duration(days: today.weekday - 1));
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
        _ChartRange.monthly =>
          l.year == b.year && l.month == b.month,
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
      final idx =
          _bucketIndex(buckets, PkTime.fromEpochMs(p.day));
      if (idx >= 0) totals[idx] += p.total;
    }
    final labels = [for (final b in buckets) b.label];
    if (!totals.any((t) => t > 0)) {
      return const SizedBox(
        height: 190,
        child: Center(
          child: Text('No sales data yet for this range.',
              style: TextStyle(color: Colors.grey)),
        ),
      );
    }
    final maxY = totals.reduce((a, b) => a > b ? a : b) * 1.15;
    return SizedBox(
      height: 190,
      child: BarChart(
        BarChartData(
          maxY: maxY,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, _, rod, __) => BarTooltipItem(
                Money.format(rod.toY.round()),
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) => const FlLine(
              color: Color(0xFFF1F4F9),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
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
                            fontSize: 9.5,
                            color: HmcColors.slate,
                            fontWeight: FontWeight.w600)),
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
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [HmcColors.blue600, HmcColors.blue400],
                    ),
                    width: 16,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2),
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
    return FadeSlideIn(
      delayMs: 200,
      child: PremiumCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('Sales Overview',
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w800)),
                Spacer(),
                Icon(Icons.insights_outlined,
                    color: HmcColors.slate, size: 20),
              ],
            ),
            const SizedBox(height: 14),
            PremiumSegmented<_ChartRange>(
              options: _ChartRange.values,
              selected: _range,
              label: _rangeLabel,
              onChanged: (r) => setState(() => _range = r),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<DailyPoint>>(
              future: _future,
              builder: (ctx, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return const SizedBox(
                    height: 190,
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
    return FadeSlideIn(
      delayMs: 280,
      child: PremiumCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('Top Brands',
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w800)),
                SizedBox(width: 8),
                StatusPill(label: 'This month', color: HmcColors.blue600),
              ],
            ),
            const SizedBox(height: 16),
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
                final maxTotal = brands
                    .map((b) => b.total)
                    .reduce((a, b) => a > b ? a : b);
                final monthSum =
                    brands.fold<int>(0, (s, b) => s + b.total);
                return Column(
                  children: [
                    for (var i = 0; i < brands.length; i++)
                      _AnimatedBrandRow(
                        b: brands[i],
                        maxTotal: maxTotal,
                        monthSum: monthSum,
                        delayMs: i * 90,
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedBrandRow extends StatefulWidget {
  final BrandPoint b;
  final int maxTotal;
  final int monthSum;
  final int delayMs;

  const _AnimatedBrandRow({
    required this.b,
    required this.maxTotal,
    required this.monthSum,
    required this.delayMs,
  });

  @override
  State<_AnimatedBrandRow> createState() => _AnimatedBrandRowState();
}

class _AnimatedBrandRowState extends State<_AnimatedBrandRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _progress = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final share = widget.monthSum == 0
        ? 0
        : (100 * widget.b.total / widget.monthSum).round();
    final brandColor = HmcColors.brandColor(widget.b.brand);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: brandColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: BrandLogo(
                    brandName: widget.b.brand, height: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.b.brand,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.5)),
                    Text('$share% of this month',
                        style: const TextStyle(
                            fontSize: 11.5, color: HmcColors.slate)),
                  ],
                ),
              ),
              MoneyText(widget.b.total,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 14.5)),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 64),
            child: AnimatedBuilder(
              animation: _progress,
              builder: (_, __) => ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: widget.maxTotal == 0
                      ? 0
                      : (widget.b.total / widget.maxTotal) *
                          _progress.value,
                  color: brandColor,
                  backgroundColor: const Color(0xFFF1F4F9),
                  minHeight: 7,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
