import '../sync/noop_sync_service.dart';
import '../sync/sync_service.dart';

/// Seams for a FUTURE cloud integration. Everything here is inert:
/// [cloudEnabled] and [syncEnabled] are false and the sync service is a no-op.
///
/// To enable Firebase later (only after explicit approval):
///  1. Add firebase_core + cloud_firestore to pubspec.
///  2. Implement [SyncService] with a Firestore-backed class.
///  3. Return it from [CloudConfig.syncService] instead of [NoopSyncService].
///  4. Follow docs/future_firebase.md for record versioning, idempotent
///     uploads and conflict resolution.
class CloudConfig {
  static const bool cloudEnabled = false;
  static const bool syncEnabled = false;

  /// Always the no-op implementation in this build.
  static SyncService get syncService => const NoopSyncService();

  /// UI hint: never show an "online / synced" indicator while disabled.
  static const bool showSyncStatus = false;
}
