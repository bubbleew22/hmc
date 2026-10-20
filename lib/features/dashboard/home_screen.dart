import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

/// Home dashboard + bottom navigation.
/// Back from a secondary tab returns to Home; back from Home asks to exit.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _tab = 0;

  Future<bool> _onPop() async {
    if (_tab != 0) {
      setState(() => _tab = 0);
      return false;
    }
    return confirmDialog(context,
        title: 'Exit app?',
        message: 'Do you want to close Hasan Mobile Center?',
        confirmLabel: 'Exit');
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (await _onPop() && context.mounted) Navigator.of(context).pop();
      },
      child: Scaffold(
        body: IndexedStack(
          index: _tab,
          children: const [
            _DashboardTab(),
            _StockTab(),
            _SalesTab(),
            _CustomersTab(),
            _MoreTab(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _tab,
          onDestinationSelected: (i) => setState(() => _tab = i),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.inventory_2_outlined),
                selectedIcon: Icon(Icons.inventory_2),
                label: 'Stock'),
            NavigationDestination(
                icon: Icon(Icons.point_of_sale_outlined),
                selectedIcon: Icon(Icons.point_of_sale),
                label: 'Sales'),
            NavigationDestination(
                icon: Icon(Icons.people_outlined),
                selectedIcon: Icon(Icons.people),
                label: 'Customers'),
            NavigationDestination(
                icon: Icon(Icons.menu),
                selectedIcon: Icon(Icons.menu),
                label: 'More'),
          ],
        ),
        floatingActionButton: _tab == 2 && ref.canSell
            ? FloatingActionButton.extended(
                onPressed: () => context.push('/sale/new'),
                icon: const Icon(Icons.add),
                label: const Text('New Sale'),
              )
            : null,
      ),
    );
  }
}

class _DashboardTab extends ConsumerStatefulWidget {
  const _DashboardTab();

  @override
  ConsumerState<_DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends ConsumerState<_DashboardTab> {
  int _refreshKey = 0;

  @override
  Widget build(BuildContext context) {
    final report = ref.watch(reportServiceProvider);
    final settings = ref.watch(settingsStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(settings.valueOrNull?.shopName ?? 'Hasan Mobile Center',
                style: const TextStyle(fontSize: 18)),
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
            icon: const Icon(Icons.lock_outline),
            tooltip: 'Lock',
            onPressed: () {
              ref.read(sessionProvider.notifier).state = null;
              context.go('/login');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
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
                SectionHeader(
                  title: "Today's business",
                  trailing: TextButton(
                    onPressed: () => context.push('/reports'),
                    child: const Text('Reports'),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.35,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  children: [
                    StatCard(
                        label: 'Sales today',
                        minor: m.salesRevenue,
                        icon: Icons.trending_up,
                        color: HmcColors.blue600),
                    StatCard(
                        label: 'Payments received',
                        minor: m.paymentsReceived,
                        icon: Icons.payments_outlined,
                        color: HmcColors.success),
                    StatCard(
                        label: 'Purchases today',
                        minor: m.purchases,
                        icon: Icons.shopping_bag_outlined,
                        color: HmcColors.warning),
                    StatCard(
                        label: 'Gross profit',
                        minor: m.grossProfit,
                        icon: Icons.savings_outlined,
                        color: HmcColors.gold600),
                  ],
                ),
                SectionHeader(title: 'Stock & dues'),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.35,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  children: [
                    CountCard(
                      label: 'Available stock',
                      value: '${m.availableQty} units',
                      icon: Icons.inventory_2_outlined,
                      color: HmcColors.navy700,
                      onTap: () => context.push('/stock'),
                    ),
                    StatCard(
                      label: 'Stock purchase value',
                      minor: m.stockPurchaseValue,
                      icon: Icons.warehouse_outlined,
                      color: HmcColors.navy700,
                    ),
                    StatCard(
                      label: 'Customer dues',
                      minor: m.pendingReceivables,
                      icon: Icons.account_balance_wallet_outlined,
                      color: HmcColors.danger,
                      onTap: () => context.push('/credit'),
                    ),
                    StatCard(
                      label: 'Supplier payables',
                      minor: m.supplierPayables,
                      icon: Icons.local_shipping_outlined,
                      color: HmcColors.warning,
                      onTap: () => context.push('/suppliers'),
                    ),
                  ],
                ),
                if (m.dispatchedQty > 0)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Card(
                      color: HmcColors.gold600.withOpacity(0.12),
                      child: ListTile(
                        leading: const Icon(Icons.send_outlined,
                            color: HmcColors.gold600),
                        title: Text(
                            '${m.dispatchedQty} units with other people'),
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
class _StockTab extends StatelessWidget {
  const _StockTab();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Stock')),
        body: ListView(
          children: [
            _NavTile(
                icon: Icons.inventory_2_outlined,
                title: 'Inventory',
                subtitle: 'Available, reserved, dispatched stock',
                route: '/stock'),
            _NavTile(
                icon: Icons.add_box_outlined,
                title: 'Add stock',
                subtitle: 'Receive new units or batches',
                route: '/stock/add'),
            _NavTile(
                icon: Icons.history,
                title: 'Stock movements',
                subtitle: 'Full audit trail of every movement',
                route: '/stock/movements'),
            _NavTile(
                icon: Icons.shopping_bag_outlined,
                title: 'Purchases',
                subtitle: 'Purchase invoices & supplier payments',
                route: '/purchases'),
            _NavTile(
                icon: Icons.local_shipping_outlined,
                title: 'Suppliers',
                subtitle: 'Supplier list & payables',
                route: '/suppliers'),
            _NavTile(
                icon: Icons.send_outlined,
                title: 'Dispatch & consignment',
                subtitle: 'Stock sent to other people',
                route: '/dispatch'),
            _NavTile(
                icon: Icons.assignment_return_outlined,
                title: 'Returns & refunds',
                subtitle: 'Product returns with restocking rules',
                route: '/returns'),
          ],
        ),
      );
}

class _SalesTab extends StatelessWidget {
  const _SalesTab();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Sales')),
        body: ListView(
          children: [
            _NavTile(
                icon: Icons.point_of_sale,
                title: 'New sale',
                subtitle: 'Create invoice, take payment',
                route: '/sale/new'),
            _NavTile(
                icon: Icons.receipt_long_outlined,
                title: 'Sales history',
                subtitle: 'All invoices, cancellations, receipts',
                route: '/sales'),
            _NavTile(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Credit recovery',
                subtitle: 'Udhaar collection & WhatsApp reminders',
                route: '/credit'),
            _NavTile(
                icon: Icons.bar_chart_outlined,
                title: 'Reports',
                subtitle: 'Sales, profit, stock & more',
                route: '/reports'),
          ],
        ),
      );
}

class _CustomersTab extends StatelessWidget {
  const _CustomersTab();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Customers')),
        body: ListView(
          children: [
            _NavTile(
                icon: Icons.people_outlined,
                title: 'All customers',
                subtitle: 'Search by name or phone',
                route: '/customers'),
            _NavTile(
                icon: Icons.person_add_outlined,
                title: 'Add customer',
                subtitle: 'New customer with opening balance',
                route: '/customer/new'),
            _NavTile(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Credit recovery',
                subtitle: 'Outstanding dues & collections',
                route: '/credit'),
          ],
        ),
      );
}

class _MoreTab extends ConsumerWidget {
  const _MoreTab();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.isAdmin;
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          _NavTile(
              icon: Icons.category_outlined,
              title: 'Brands & models',
              subtitle: 'Manage the product catalogue',
              route: '/brands'),
          _NavTile(
              icon: Icons.money_off_outlined,
              title: 'Expenses',
              subtitle: 'Shop running costs',
              route: '/expenses'),
          _NavTile(
              icon: Icons.bar_chart_outlined,
              title: 'Reports',
              subtitle: '20+ business reports with export',
              route: '/reports'),
          const Divider(),
          _NavTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              subtitle: 'Shop, theme, invoice, WhatsApp templates',
              route: '/settings'),
          if (isAdmin)
            _NavTile(
                icon: Icons.manage_accounts_outlined,
                title: 'Users & roles',
                subtitle: 'Staff accounts and permissions',
                route: '/settings/users'),
          _NavTile(
              icon: Icons.backup_outlined,
              title: 'Backup & restore',
              subtitle: 'Protect your data',
              route: '/settings/backup'),
          _NavTile(
              icon: Icons.info_outlined,
              title: 'About',
              subtitle: 'Hasan Mobile Center — Shewa Adda',
              route: '/settings/about'),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
  const _NavTile(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.route});

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: HmcColors.navy800.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: HmcColors.navy800),
          ),
          title: Text(title,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push(route),
        ),
      );
}
