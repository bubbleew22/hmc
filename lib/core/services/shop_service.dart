import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import '../../data/db/app_database.dart';
import '../utils/time.dart';
import 'sync_service.dart';

/// Shop settings + first-launch setup.
/// Settings are synced to Firestore when online (Phase 2).
class ShopService {
  final AppDatabase db;
  final SyncService _sync = SyncService();
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
    // Push to Firestore for multi-device sync (best-effort, offline-safe).
    _pushSettingsToCloud();
  }

  /// Pushes current settings to Firestore (fire-and-forget).
  Future<void> _pushSettingsToCloud() async {
    try {
      final s = await db.readSettings();
      if (s == null) return;
      await _sync.pushSettings({
        'shopName': s.shopName,
        'subtitle': s.subtitle,
        'contactNumber': s.contactNumber,
        'address': s.address,
        'invoiceFooter': s.invoiceFooter,
        'themeMode': s.themeMode,
        'whatsappTemplate': s.whatsappTemplate,
      }, PkTime.nowEpochMs());
    } catch (e) {
      debugPrint('Settings sync push failed (offline?): $e');
    }
  }

  /// Pulls settings from Firestore and applies locally if newer.
  /// Called on app startup when online.
  Future<void> pullSettingsFromCloud() async {
    try {
      final remote = await _sync.pullSettings();
      if (remote == null) return;
      final remoteUpdatedAt = remote['updatedAt'] as int?;
      // For now, always apply remote if it exists (simple strategy).
      // TODO: Compare timestamps for proper last-write-wins.
      if (remoteUpdatedAt != null) {
        final existing = await db.readSettings();
        if (existing == null) {
          await db.into(db.shopSettings).insert(ShopSettingsCompanion(
            shopName: Value(remote['shopName'] as String? ?? ''),
            subtitle: Value(remote['subtitle'] as String? ?? ''),
            contactNumber: Value(remote['contactNumber'] as String? ?? ''),
            address: Value(remote['address'] as String? ?? ''),
            invoiceFooter: Value(remote['invoiceFooter'] as String? ?? ''),
            themeMode: Value(remote['themeMode'] as String? ?? 'system'),
            whatsappTemplate:
                Value(remote['whatsappTemplate'] as String? ?? ''),
          ));
        } else {
          await (db.update(db.shopSettings)
                ..where((t) => t.id.equals(existing.id)))
              .write(ShopSettingsCompanion(
            shopName: Value(remote['shopName'] as String? ?? existing.shopName),
            subtitle: Value(remote['subtitle'] as String? ?? existing.subtitle),
            contactNumber: Value(
                remote['contactNumber'] as String? ?? existing.contactNumber),
            address:
                Value(remote['address'] as String? ?? existing.address),
            invoiceFooter: Value(
                remote['invoiceFooter'] as String? ?? existing.invoiceFooter),
            themeMode: Value(
                remote['themeMode'] as String? ?? existing.themeMode),
            whatsappTemplate: Value(remote['whatsappTemplate'] as String? ??
                existing.whatsappTemplate),
          ));
        }
        debugPrint('Settings synced from cloud');
      }
    } catch (e) {
      debugPrint('Settings sync pull failed (offline?): $e');
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
