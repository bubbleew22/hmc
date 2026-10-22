import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Firebase Authentication service for multi-device sync.
/// Each operator gets an email+password. The Firebase UID links to the
/// local user record, so offline PIN login still works when there's no network.
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Current Firebase user, null if not signed in.
  User? get currentUser => _auth.currentUser;

  /// Stream of auth state changes.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Signs in with email and password.
  /// Returns the Firebase user on success, throws on failure.
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return cred.user!;
    } on FirebaseAuthException catch (e) {
      throw _friendlyError(e);
    }
  }

  /// Creates a new Firebase user (admin creates operators).
  /// Returns the new user's UID.
  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return cred.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw _friendlyError(e);
    }
  }

  /// Signs out the current user.
  Future<void> signOut() => _auth.signOut();

  /// Sends a password reset email.
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw _friendlyError(e);
    }
  }

  /// Updates the current user's password.
  Future<void> updatePassword(String newPassword) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw _friendlyError(e);
    }
  }

  String _friendlyError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No account found for this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'weak-password':
        return 'Password is too weak (minimum 6 characters).';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'network-request-failed':
        return 'No internet connection. Try offline PIN login.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      default:
        debugPrint('FirebaseAuth error: ${e.code} - ${e.message}');
        return e.message ?? 'Authentication failed.';
    }
  }
}
