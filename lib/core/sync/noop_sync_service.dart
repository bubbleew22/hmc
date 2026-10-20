import 'sync_service.dart';

/// Safe no-op synchronization for the offline-first v1 build.
/// Cloud sync stays disabled until explicitly approved.
class NoopSyncService implements SyncService {
  const NoopSyncService();

  @override
  Future<bool> get isAvailable async => false;

  @override
  Future<SyncResult> synchronize() async => const SyncResult(
        success: true,
        message: 'Cloud sync is disabled in this build.',
      );
}
