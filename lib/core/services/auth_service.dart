import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';

/// Local offline authentication. PINs are salted SHA-256 hashes —
/// never stored in plaintext, never hardcoded.
class Session {
  final String userId;
  final String name;
  final String role;
  const Session({required this.userId, required this.name, required this.role});
}

class AuthService {
  final AppDatabase db;
  AuthService(this.db);

  static String _salt() {
    final r = Random.secure();
    final bytes = List<int>.generate(16, (_) => r.nextInt(256));
    return base64Url.encode(bytes);
  }

  static String hashPin(String pin, String salt) {
    final h = sha256.convert(utf8.encode('$salt::$pin')).toString();
    // Key-stretch the hash to slow brute force on-device.
    var out = h;
    for (var i = 0; i < 5000; i++) {
      out = sha256.convert(utf8.encode('$salt::$out')).toString();
    }
    return out;
  }

  Future<bool> anyUsers() async {
    final query = db.selectOnly(db.localUsers)
      ..addColumns([db.localUsers.id.count()]);
    final row = await query.getSingle();
    return (row.read(db.localUsers.id.count()) ?? 0) > 0;
  }

  /// Creates the first administrator during setup. Throws if users exist.
  Future<LocalUser> createAdmin({required String name, required String pin}) async {
    if (await anyUsers()) {
      throw StateError('An administrator already exists');
    }
    final salt = _salt();
    final user = LocalUsersCompanion(
      id: Value(newId()),
      name: Value(name.trim()),
      pinHash: Value(hashPin(pin, salt)),
      pinSalt: Value(salt),
      role: const Value('admin'),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.localUsers).insert(user);
    final row = await (db.select(db.localUsers)
          ..where((t) => t.id.equals(user.id.value)))
        .getSingle();
    await _audit(row.id, 'user.create', 'LocalUsers', row.id, 'Admin created');
    return row;
  }

  Future<LocalUser> createUser({
    required String name,
    required String pin,
    required String role,
    required String actorId,
  }) async {
    final salt = _salt();
    final user = LocalUsersCompanion(
      id: Value(newId()),
      name: Value(name.trim()),
      pinHash: Value(hashPin(pin, salt)),
      pinSalt: Value(salt),
      role: Value(role),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.localUsers).insert(user);
    final row = await (db.select(db.localUsers)
          ..where((t) => t.id.equals(user.id.value)))
        .getSingle();
    await _audit(actorId, 'user.create', 'LocalUsers', row.id, 'Role: $role');
    return row;
  }

  /// Returns the session on success, null on bad PIN / disabled user.
  Future<Session?> login(String name, String pin) async {
    final user = await (db.select(db.localUsers)
          ..where((t) => t.name.equals(name.trim())))
        .getSingleOrNull();
    if (user == null || user.isActive != 1) return null;
    if (hashPin(pin, user.pinSalt) != user.pinHash) return null;
    await _audit(user.id, 'auth.login', 'LocalUsers', user.id, 'Local login');
    return Session(userId: user.id, name: user.name, role: user.role);
  }

  /// Finds a local user by Firebase UID.
  Future<LocalUser?> findByFirebaseUid(String firebaseUid) async {
    return (db.select(db.localUsers)
          ..where((t) => t.firebaseUid.equals(firebaseUid)))
        .getSingleOrNull();
  }

  /// Links a Firebase account to a local user (creates local record if needed).
  /// Used on first online login from a new device.
  Future<LocalUser> linkFirebaseUser({
    required String firebaseUid,
    required String email,
    required String name,
  }) async {
    final existing = await findByFirebaseUid(firebaseUid);
    if (existing != null) return existing;
    // Create a local user linked to Firebase. PIN is random (not used for
    // online login); admin can set it later for offline access.
    final salt = _salt();
    final user = LocalUsersCompanion(
      id: Value(newId()),
      name: Value(name.trim()),
      pinHash: Value(hashPin(newId(), salt)),
      pinSalt: Value(salt),
      role: const Value('operator'),
      firebaseUid: Value(firebaseUid),
      email: Value(email.trim()),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.localUsers).insert(user);
    return (db.select(db.localUsers)
          ..where((t) => t.firebaseUid.equals(firebaseUid)))
        .getSingle();
  }

  /// Links a Firebase account to an existing local user.
  Future<void> linkFirebaseUid(
      String userId, String firebaseUid, String email) async {
    await (db.update(db.localUsers)..where((t) => t.id.equals(userId))).write(
      LocalUsersCompanion(
        firebaseUid: Value(firebaseUid),
        email: Value(email.trim()),
      ),
    );
  }

  /// Logs in via Firebase UID (after Firebase Auth sign-in).
  Future<Session?> loginWithFirebaseUid(String firebaseUid) async {
    final user = await findByFirebaseUid(firebaseUid);
    if (user == null || user.isActive != 1) return null;
    await _audit(
        user.id, 'auth.login', 'LocalUsers', user.id, 'Firebase login');
    return Session(userId: user.id, name: user.name, role: user.role);
  }

  Future<void> resetPin({
    required String userId,
    required String newPin,
    required String actorId,
  }) async {
    final salt = _salt();
    await (db.update(db.localUsers)..where((t) => t.id.equals(userId))).write(
      LocalUsersCompanion(
        pinHash: Value(hashPin(newPin, salt)),
        pinSalt: Value(salt),
      ),
    );
    await _audit(actorId, 'user.pin_reset', 'LocalUsers', userId, 'PIN reset by admin');
  }

  Future<void> setActive({
    required String userId,
    required bool active,
    required String actorId,
  }) async {
    await (db.update(db.localUsers)..where((t) => t.id.equals(userId))).write(
      LocalUsersCompanion(isActive: Value(active ? 1 : 0)),
    );
    await _audit(actorId, active ? 'user.enable' : 'user.disable', 'LocalUsers',
        userId, '');
  }

  Future<List<LocalUser>> listUsers() =>
      (db.select(db.localUsers)..orderBy([(t) => OrderingTerm.asc(t.name)])).get();

  Future<void> _audit(String? userId, String action, String? entityType,
      String? entityId, String details) async {
    await db.into(db.auditLogs).insert(AuditLogsCompanion(
      userId: Value(userId),
      action: Value(action),
      entityType: Value(entityType),
      entityId: Value(entityId),
      details: Value(details),
      createdAt: Value(PkTime.nowEpochMs()),
    ));
  }

  Future<List<AuditLog>> recentAudit({int limit = 100}) =>
      (db.select(db.auditLogs)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
            ..limit(limit))
          .get();
}
