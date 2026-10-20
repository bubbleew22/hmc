import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/common.dart';

/// Local PIN login / lock screen.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _name = TextEditingController();
  final _pin = TextEditingController();
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _pin.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final session =
          await ref.read(authServiceProvider).login(_name.text, _pin.text);
      if (session == null) {
        setState(() => _error = 'Wrong name or PIN. Try again.');
      } else {
        ref.read(sessionProvider.notifier).state = session;
        if (mounted) context.go('/home');
      }
    } catch (e) {
      setState(() => _error = 'Login failed. Try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [HmcColors.navy800, HmcColors.navy900],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('assets/logo/hmc_logo_1024.png',
                          width: 72,
                          height: 72,
                          errorBuilder: (_, __, ___) => const Icon(
                              Icons.storefront,
                              size: 56,
                              color: HmcColors.navy800)),
                      const SizedBox(height: 12),
                      const Text('HASAN MOBILE CENTER',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                      const Text('SHEWA ADDA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 4,
                              color: HmcColors.gold600,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _name,
                        decoration:
                            const InputDecoration(labelText: 'User name'),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _pin,
                        decoration:
                            const InputDecoration(labelText: 'PIN'),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _login(),
                      ),
                      if (_error != null) ...[
                        const SizedBox(height: 12),
                        Text(_error!,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.error),
                            textAlign: TextAlign.center),
                      ],
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: _busy ? null : _login,
                        child: _busy
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2))
                            : const Text('Unlock'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
