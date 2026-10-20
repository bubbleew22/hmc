import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../startup_error_app.dart';

/// Decides the first route: setup → login → home.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Let the first frame paint before touching the database, so the splash
    // is always visible even if boot throws.
    WidgetsBinding.instance.addPostFrameCallback((_) => _boot());
  }

  Future<void> _boot() async {
    try {
      final shop = ref.read(shopServiceProvider);
      final auth = ref.read(authServiceProvider);
      final catalog = ref.read(catalogServiceProvider);
      final expenses = ref.read(expenseServiceProvider);
      final settings = await shop.getSettings();
      final done = settings?.setupDone == 1;
      final hasUsers = await auth.anyUsers();
      if (done) {
        await catalog.seedDefaultBrands();
        await expenses.seedCategories();
      }
      if (!mounted) return;
      syncThemeFromSettings(ref, settings?.themeMode);
      ref.read(setupDoneProvider.notifier).state = done;
      ref.read(usersExistProvider.notifier).state = hasUsers;
    } catch (_) {
      if (!mounted) return;
      ref.read(setupDoneProvider.notifier).state = false;
      ref.read(usersExistProvider.notifier).state = false;
    } finally {
      hmcStartupPhase = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [HmcColors.navy800, HmcColors.navy900],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo/hmc_logo_1024.png',
                  width: 120, height: 120,
                  errorBuilder: (_, __, ___) => const Icon(
                      Icons.storefront,
                      size: 72,
                      color: HmcColors.gold300)),
              const SizedBox(height: 20),
              const Text('HASSAN MOBILE CENTER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2)),
              const SizedBox(height: 6),
              const Text('SHEWA ADDA',
                  style: TextStyle(
                      color: HmcColors.gold300,
                      fontSize: 15,
                      letterSpacing: 6,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 32),
              const CircularProgressIndicator(color: HmcColors.gold300),
            ],
          ),
        ),
      ),
    );
  }
}
