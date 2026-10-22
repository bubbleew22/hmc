import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/config/app_config.dart';
import 'tables.dart';

part 'app_database.g.dart';

/// Offline-first SQLite database (Drift).
/// One database file per device; no network access.
@DriftDatabase(
  tables: [
    ShopSettings,
    AppMetadata,
    LocalUsers,
    AuditLogs,
    Brands,
    ProductModels,
    ProductVariants,
    Suppliers,
    InventoryUnits,
    StockBatches,
    StockMovements,
    PurchaseInvoices,
    PurchaseItems,
    SupplierPayments,
    Customers,
    SalesInvoices,
    SalesItems,
    CustomerPayments,
    PaymentAllocations,
    CreditAdjustments,
    Dispatches,
    DispatchItems,
    ConsignmentSales,
    ProductReturns,
    Refunds,
    ExpenseCategories,
    Expenses,
    BackupMetadata,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => AppConfig.dbVersion;

  static QueryExecutor _open() {
    return driftDatabase(
      name: 'hmc.db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async => m.createAll(),
        onUpgrade: (m, from, to) async {
          // v1 → v2: add userId (operator attribution) to purchase_invoices.
          if (from < 2) {
            await m.addColumn(purchaseInvoices, purchaseInvoices.userId);
          }
          // v2 → v3: add Firebase Auth linking to local_users.
          if (from < 3) {
            await m.addColumn(localUsers, localUsers.firebaseUid);
            await m.addColumn(localUsers, localUsers.email);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  // ── Convenience streams used across features ──

  Stream<ShopSetting?> watchSettings() =>
      (select(shopSettings)..limit(1)).watchSingleOrNull();

  Future<ShopSetting?> readSettings() =>
      (select(shopSettings)..limit(1)).getSingleOrNull();
}
