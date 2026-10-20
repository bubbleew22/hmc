import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/theme/app_theme.dart';
import '../data/db/app_database.dart';
import 'services/auth_service.dart';
import 'services/backup_service.dart';
import 'services/catalog_service.dart';
import 'services/customer_service.dart';
import 'services/dispatch_service.dart';
import 'services/expense_service.dart';
import 'services/purchase_service.dart';
import 'services/report_service.dart';
import 'services/sales_service.dart';
import 'services/shop_service.dart';
import 'services/stock_service.dart';

/// ── Database ────────────────────────────────────────────────

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// ── Services ────────────────────────────────────────────────

final shopServiceProvider = Provider((ref) => ShopService(ref.watch(databaseProvider)));
final authServiceProvider = Provider((ref) => AuthService(ref.watch(databaseProvider)));
final catalogServiceProvider = Provider((ref) => CatalogService(ref.watch(databaseProvider)));
final stockServiceProvider = Provider((ref) => StockService(ref.watch(databaseProvider)));
final purchaseServiceProvider = Provider((ref) => PurchaseService(ref.watch(databaseProvider)));
final salesServiceProvider = Provider((ref) => SalesService(ref.watch(databaseProvider)));
final customerServiceProvider = Provider((ref) => CustomerService(ref.watch(databaseProvider)));
final dispatchServiceProvider = Provider((ref) => DispatchService(ref.watch(databaseProvider)));
final expenseServiceProvider = Provider((ref) => ExpenseService(ref.watch(databaseProvider)));
final reportServiceProvider = Provider((ref) => ReportService(ref.watch(databaseProvider)));
final backupServiceProvider = Provider((ref) => BackupService(ref.watch(databaseProvider)));

/// ── App state ───────────────────────────────────────────────

/// Null = not loaded yet. Set by the splash screen.
final setupDoneProvider = StateProvider<bool?>((ref) => null);
final usersExistProvider = StateProvider<bool?>((ref) => null);

/// Current signed-in local user (null = locked / not signed in).
final sessionProvider = StateProvider<Session?>((ref) => null);

final settingsStreamProvider =
    StreamProvider.autoDispose((ref) => ref.watch(databaseProvider).watchSettings());

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Applies the saved theme preference once settings load.
void syncThemeFromSettings(WidgetRef ref, String? mode) {
  ref.read(themeModeProvider.notifier).state = AppTheme.parseMode(mode ?? 'system');
}

/// Simple role helpers for the current session.
extension SessionRole on WidgetRef {
  bool get isAdmin => read(sessionProvider)?.role == 'admin';
  bool get canSell =>
      const {'admin', 'operator'}.contains(read(sessionProvider)?.role);
  bool get canEditStock => read(sessionProvider)?.role == 'admin';
}
