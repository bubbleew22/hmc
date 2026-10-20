/// Contract for future cloud synchronization. Not used in v1.
abstract class SyncService {
  /// Returns true when a sync backend is configured and reachable.
  Future<bool> get isAvailable;

  /// Push local changes / pull remote changes. No-op in v1.
  Future<SyncResult> synchronize();
}

class SyncResult {
  final bool success;
  final int pushed;
  final int pulled;
  final String? message;

  const SyncResult({
    required this.success,
    this.pushed = 0,
    this.pulled = 0,
    this.message,
  });
}
