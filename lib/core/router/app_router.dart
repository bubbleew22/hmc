import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers.dart';
import '../../features/about/about_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/users_screen.dart';
import '../../features/backup/backup_screen.dart';
import '../../features/brands/brand_detail_screen.dart';
import '../../features/brands/brands_screen.dart';
import '../../features/consignment/dispatch_detail_screen.dart';
import '../../features/consignment/dispatch_list_screen.dart';
import '../../features/consignment/new_dispatch_screen.dart';
import '../../features/credit/credit_recovery_screen.dart';
import '../../features/customers/add_edit_customer_screen.dart';
import '../../features/customers/customer_detail_screen.dart';
import '../../features/customers/customer_ledger_screen.dart';
import '../../features/customers/customers_screen.dart';
import '../../features/customers/receive_payment_screen.dart';
import '../../features/dashboard/home_screen.dart';
import '../../features/expenses/expenses_screen.dart';
import '../../features/products/model_detail_screen.dart';
import '../../features/products/variant_detail_screen.dart';
import '../../features/purchases/new_purchase_screen.dart';
import '../../features/purchases/purchase_detail_screen.dart';
import '../../features/purchases/purchases_screen.dart';
import '../../features/purchases/suppliers_screen.dart';
import '../../features/reports/report_detail_screen.dart';
import '../../features/reports/reports_screen.dart';
import '../../features/returns/returns_screen.dart';
import '../../features/sales/new_sale_screen.dart';
import '../../features/sales/receipt_preview_screen.dart';
import '../../features/sales/sale_detail_screen.dart';
import '../../features/sales/sales_history_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/setup/setup_wizard_screen.dart';
import '../../features/setup/splash_screen.dart';
import '../../features/stock/add_stock_screen.dart';
import '../../features/stock/stock_movements_screen.dart';
import '../../features/stock/stock_screen.dart';

import '../widgets/scaffold_with_nav_bar.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final setupDone = ref.watch(setupDoneProvider);
  final usersExist = ref.watch(usersExistProvider);
  final session = ref.watch(sessionProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final loc = state.uri.path;
      if (setupDone == null || usersExist == null) {
        return loc == '/splash' ? null : '/splash';
      }
      if (!setupDone) return loc == '/setup' ? null : '/setup';
      if (usersExist && session == null) {
        return loc == '/login' ? null : '/login';
      }
      if (loc == '/splash' || loc == '/setup' || loc == '/login') {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/setup', builder: (_, __) => const SetupWizardScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      // ── Main tabs: each keeps its own navigation stack so the system
      // back button returns to the previous screen instead of closing the app.
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/stock', builder: (_, __) => const StockScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/sales', builder: (_, __) => const SalesHistoryScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/customers',
                builder: (_, __) => const CustomersScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/settings', builder: (_, __) => const SettingsScreen()),
          ]),
        ],
      ),
      // Catalogue
      GoRoute(path: '/brands', builder: (_, __) => const BrandsScreen()),
      GoRoute(
        path: '/brand/:id',
        builder: (_, s) => BrandDetailScreen(brandId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/model/:id',
        builder: (_, s) => ModelDetailScreen(modelId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/variant/:id',
        builder: (_, s) =>
            VariantDetailScreen(variantId: s.pathParameters['id']!),
      ),
      // Stock
      GoRoute(path: '/stock/add', builder: (_, __) => const AddStockScreen()),
      GoRoute(
          path: '/stock/movements',
          builder: (_, __) => const StockMovementsScreen()),
      // Purchases
      GoRoute(
          path: '/purchases', builder: (_, __) => const PurchasesScreen()),
      GoRoute(
          path: '/purchase/new',
          builder: (_, __) => const NewPurchaseScreen()),
      GoRoute(
        path: '/purchase/:id',
        builder: (_, s) =>
            PurchaseDetailScreen(purchaseId: s.pathParameters['id']!),
      ),
      GoRoute(
          path: '/suppliers', builder: (_, __) => const SuppliersScreen()),
      // Sales
      GoRoute(path: '/sale/new', builder: (_, __) => const NewSaleScreen()),
      GoRoute(
        path: '/sale/:id',
        builder: (_, s) => SaleDetailScreen(saleId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/sale/:id/receipt',
        builder: (_, s) =>
            ReceiptPreviewScreen(saleId: s.pathParameters['id']!),
      ),
      // Customers
      GoRoute(
          path: '/customer/new',
          builder: (_, __) => const AddEditCustomerScreen()),
      GoRoute(
        path: '/customer/:id',
        builder: (_, s) =>
            CustomerDetailScreen(customerId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/customer/:id/edit',
        builder: (_, s) => AddEditCustomerScreen(
            customerId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/customer/:id/ledger',
        builder: (_, s) =>
            CustomerLedgerScreen(customerId: s.pathParameters['id']!),
      ),
      GoRoute(
        path: '/customer/:id/payment',
        builder: (_, s) =>
            ReceivePaymentScreen(customerId: s.pathParameters['id']!),
      ),
      GoRoute(path: '/credit', builder: (_, __) => const CreditRecoveryScreen()),
      // Consignment
      GoRoute(
          path: '/dispatch', builder: (_, __) => const DispatchListScreen()),
      GoRoute(
          path: '/dispatch/new',
          builder: (_, __) => const NewDispatchScreen()),
      GoRoute(
        path: '/dispatch/:id',
        builder: (_, s) =>
            DispatchDetailScreen(dispatchId: s.pathParameters['id']!),
      ),
      // Operations
      GoRoute(path: '/returns', builder: (_, __) => const ReturnsScreen()),
      GoRoute(path: '/expenses', builder: (_, __) => const ExpensesScreen()),
      GoRoute(path: '/reports', builder: (_, __) => const ReportsScreen()),
      GoRoute(
        path: '/reports/detail',
        builder: (_, s) => ReportDetailScreen(
          report: s.uri.queryParameters['report'] ?? 'sales',
          title: s.uri.queryParameters['title'] ?? 'Report',
        ),
      ),
      // Settings
      GoRoute(
          path: '/settings/users', builder: (_, __) => const UsersScreen()),
      GoRoute(
          path: '/settings/backup', builder: (_, __) => const BackupScreen()),
      GoRoute(path: '/settings/about', builder: (_, __) => const AboutScreen()),
    ],
    errorBuilder: (_, s) => Scaffold(
      appBar: AppBar(title: const Text('Not found')),
      body: Center(child: Text('Route not found: ${s.uri}')),
    ),
  );
});
