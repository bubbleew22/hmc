import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/time.dart';

/// Shop settings + first-launch setup.
class ShopService {
  final AppDatabase db;
  ShopService(this.db);

  Future<ShopSetting?> getSettings() => db.readSettings();

  Stream<ShopSetting?> watchSettings() => db.watchSettings();

  Future<void> completeSetup({
    required String shopName,
    required String subtitle,
    required String contactNumber,
    required String address,
    required String invoiceFooter,
    required String themeMode,
    required String invoiceFormat,
  }) async {
    final existing = await db.readSettings();
    final companion = ShopSettingsCompanion(
      shopName: Value(shopName.trim()),
      subtitle: Value(subtitle.trim()),
      contactNumber: Value(contactNumber.trim()),
      address: Value(address.trim()),
      invoiceFooter: Value(invoiceFooter.trim()),
      themeMode: Value(themeMode),
      invoiceFormat: Value(invoiceFormat),
      setupDone: const Value(1),
    );
    if (existing == null) {
      await db.into(db.shopSettings).insert(companion);
    } else {
      await (db.update(db.shopSettings)..where((t) => t.id.equals(existing.id)))
          .write(companion);
    }
  }

  Future<void> updateSettings(ShopSettingsCompanion companion) async {
    final existing = await db.readSettings();
    if (existing == null) {
      await db.into(db.shopSettings).insert(companion);
    } else {
      await (db.update(db.shopSettings)..where((t) => t.id.equals(existing.id)))
          .write(companion);
    }
  }

  Future<void> setThemeMode(String mode) =>
      updateSettings(ShopSettingsCompanion(themeMode: Value(mode)));

  Future<void> setWhatsappTemplate(String template) =>
      updateSettings(ShopSettingsCompanion(whatsappTemplate: Value(template)));

  Future<void> touchMeta(String key, String value) async {
    await db.into(db.appMetadata).insertOnConflictUpdate(
        AppMetadataCompanion(key: Value(key), value: Value(value)));
  }

  Future<String?> readMeta(String key) async {
    final row = await (db.select(db.appMetadata)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    return row?.value;
  }

  Future<int> nextInvoiceNumber() async {
    final last = await readMeta('last_invoice_no');
    final next = (int.tryParse(last ?? '0') ?? 0) + 1;
    await touchMeta('last_invoice_no', next.toString());
    return next;
  }

  String formatInvoiceNo(int n) =>
      'HMC-${n.toString().padLeft(5, '0')}';

  Future<int> nextRefNumber(String key, String prefix) async {
    final last = await readMeta(key);
    final next = (int.tryParse(last ?? '0') ?? 0) + 1;
    await touchMeta(key, next.toString());
    return next;
  }
}
