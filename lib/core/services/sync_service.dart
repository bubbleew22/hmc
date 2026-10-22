import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// Firestore sync service for multi-device data sharing.
/// 
/// Phase 2: Syncs shop settings and user accounts across devices.
/// Uses last-write-wins conflict resolution based on updatedAt timestamps.
/// 
/// Firestore structure:
///   shops/{shopId}/settings/config — shop settings (name, etc.)
///   shops/{shopId}/users/{userId} — user accounts (PIN hash, role, etc.)
/// 
/// The shopId is the Firebase Auth user's UID namespace, or a shared
/// shop identifier. For now, uses a single 'default' shop.
class SyncService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  /// Default shop ID — single shop for now.
  static const String defaultShopId = 'default';
  
  bool get isAvailable {
    try {
      // Check if Firestore is reachable (will throw if not initialized).
      _db.settings;
      return true;
    } catch (_) {
      return false;
    }
  }

  DocumentReference<Map<String, dynamic>> _settingsDoc([String shopId = defaultShopId]) {
    return _db.collection('shops').doc(shopId).collection('settings').doc('config');
  }

  CollectionReference<Map<String, dynamic>> _usersCollection([String shopId = defaultShopId]) {
    return _db.collection('shops').doc(shopId).collection('users');
  }

  /// Pushes shop settings to Firestore.
  /// [settings] is a map of setting key → value.
  /// [updatedAt] is milliseconds since epoch for conflict resolution.
  Future<void> pushSettings(Map<String, dynamic> settings, int updatedAt) async {
    try {
      await _settingsDoc().set({
        ...settings,
        'updatedAt': updatedAt,
        'syncedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      debugPrint('Sync: Settings pushed to Firestore');
    } catch (e) {
      debugPrint('Sync: Failed to push settings: $e');
      rethrow;
    }
  }

  /// Pulls shop settings from Firestore.
  /// Returns null if no remote settings exist.
  Future<Map<String, dynamic>?> pullSettings() async {
    try {
      final doc = await _settingsDoc().get();
      if (!doc.exists) return null;
      return doc.data();
    } catch (e) {
      debugPrint('Sync: Failed to pull settings: $e');
      return null;
    }
  }

  /// Watches shop settings for real-time updates.
  Stream<Map<String, dynamic>?> watchSettings() {
    return _settingsDoc().snapshots().map((doc) {
      if (!doc.exists) return null;
      return doc.data();
    });
  }

  /// Pushes a user account to Firestore (for PIN/role sync).
  /// [userId] is the local user ID.
  /// [data] contains name, pinHash, pinSalt, role, etc.
  Future<void> pushUser(String userId, Map<String, dynamic> data, int updatedAt) async {
    try {
      await _usersCollection().doc(userId).set({
        ...data,
        'updatedAt': updatedAt,
        'syncedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      debugPrint('Sync: User $userId pushed to Firestore');
    } catch (e) {
      debugPrint('Sync: Failed to push user: $e');
      rethrow;
    }
  }

  /// Pulls a user account from Firestore.
  Future<Map<String, dynamic>?> pullUser(String userId) async {
    try {
      final doc = await _usersCollection().doc(userId).get();
      if (!doc.exists) return null;
      return doc.data();
    } catch (e) {
      debugPrint('Sync: Failed to pull user: $e');
      return null;
    }
  }

  /// Watches all users for real-time updates.
  Stream<List<Map<String, dynamic>>> watchUsers() {
    return _usersCollection().snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return {'id': doc.id, ...doc.data()};
      }).toList();
    });
  }

  /// Resolves conflict using last-write-wins.
  /// Returns true if remote is newer and should overwrite local.
  bool shouldOverwriteLocal(int localUpdatedAt, int? remoteUpdatedAt) {
    if (remoteUpdatedAt == null) return false;
    return remoteUpdatedAt > localUpdatedAt;
  }
}
