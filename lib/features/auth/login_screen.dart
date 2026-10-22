import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/services/firebase_auth_service.dart';
import '../../core/theme/app_theme.dart';

/// Login screen with PIN (offline) and Online (Firebase) options.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _name = TextEditingController();
  final _pin = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _busy = false;
  String? _error;
  bool _onlineMode = false;

  @override
  void dispose() {
    _name.dispose();
    _pin.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      if (_onlineMode) {
        await _loginOnline();
      } else {
        await _loginPin();
      }
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _loginPin() async {
    final session =
        await ref.read(authServiceProvider).login(_name.text, _pin.text);
    if (session == null) {
      setState(() => _error = 'Wrong name or PIN. Try again.');
    } else {
      ref.read(sessionProvider.notifier).state = session;
      if (mounted) context.go('/home');
    }
  }

  Future<void> _loginOnline() async {
    final fbAuth = FirebaseAuthService();
    final user = await fbAuth.signIn(
      email: _email.text,
      password: _password.text,
    );
    // Link Firebase user to local user (or create local record).
    final auth = ref.read(authServiceProvider);
    final localUser = await auth.findByFirebaseUid(user.uid);
    if (localUser == null) {
      // First online login — create local user linked to Firebase.
      // Admin must have created this account; we just link it locally.
      await auth.linkFirebaseUser(
        firebaseUid: user.uid,
        email: user.email ?? _email.text,
        name: user.displayName ?? _email.text.split('@').first,
      );
    }
    final session = await auth.loginWithFirebaseUid(user.uid);
    if (session == null) {
      setState(() => _error = 'Account not set up on this device. Contact admin.');
    } else {
      ref.read(sessionProvider.notifier).state = session;
      if (mounted) context.go('/home');
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
                      const Text('HASSAN MOBILE CENTER',
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
                      // PIN / Online toggle
                      SegmentedButton<bool>(
                        segments: const [
                          ButtonSegment(
                              value: false,
                              label: Text('PIN'),
                              icon: Icon(Icons.pin_outlined)),
                          ButtonSegment(
                              value: true,
                              label: Text('Online'),
                              icon: Icon(Icons.cloud_outlined)),
                        ],
                        selected: {_onlineMode},
                        onSelectionChanged: (s) =>
                            setState(() => _onlineMode = s.first),
                      ),
                      const SizedBox(height: 16),
                      if (!_onlineMode) ...[
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
                      ] else ...[
                        TextField(
                          controller: _email,
                          decoration:
                              const InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _password,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => _login(),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Online login syncs your account across devices.',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
