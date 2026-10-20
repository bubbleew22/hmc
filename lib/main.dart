import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// Hasan Mobile Center — Shewa Adda
/// Fully offline-first. No Firebase, no network calls on startup.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: HmcApp()));
}
