import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'startup_error_app.dart';

/// Hassan Mobile Center — Shewa Adda
/// Firebase connected: Auth + Firestore for multi-device sync.
/// Local SQLite remains the offline-first store; Firebase syncs across devices.
///
/// Startup is wrapped in a last-resort error boundary: any uncaught error
/// while [hmcStartupPhase] is true replaces the app with [StartupErrorApp],
/// which shows the error instead of dying silently.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  void showStartupError(Object error, StackTrace? stack) {
    runApp(StartupErrorApp(error: error, stack: stack));
  }

  final defaultOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    if (hmcStartupPhase) {
      showStartupError(details.exception, details.stack);
    } else {
      defaultOnError?.call(details);
    }
  };

  runZonedGuarded(() async {
    // Initialize Firebase (Auth + Firestore). If it fails (e.g. no network
    // on first run), the app still works offline with local data.
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      debugPrint('Firebase init failed (offline mode): $e');
    }
    runApp(const ProviderScope(child: HmcApp()));
  }, (error, stack) {
    if (hmcStartupPhase) {
      showStartupError(error, stack);
    }
  });
}
