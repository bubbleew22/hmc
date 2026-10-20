import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'startup_error_app.dart';

/// Hassan Mobile Center — Shewa Adda
/// Fully offline-first. No Firebase, no network calls on startup.
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

  runZonedGuarded(() {
    runApp(const ProviderScope(child: HmcApp()));
  }, (error, stack) {
    if (hmcStartupPhase) {
      showStartupError(error, stack);
    }
  });
}
