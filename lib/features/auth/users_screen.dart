import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/services/firebase_auth_service.dart';
import '../../core/utils/validators.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

/// Admin: staff accounts, roles, PIN resets.
class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Users & roles')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addUser(context, ref),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: auth.listUsers(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final users = snap.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, i) {
              final u = users[i];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                      child: Text(u.name.characters.first
                          .toUpperCase())),
                  title: Text(u.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600)),
                  subtitle: Text(
                      '${u.role.toUpperCase()}${u.isActive == 1 ? '' : ' · disabled'}'),
                  trailing: PopupMenuButton<String>(
                    onSelected: (v) =>
                        _onMenu(context, ref, u, v),
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                          value: 'pin',
                          child: Text('Reset PIN')),
                      PopupMenuItem(
                          value: 'toggle',
                          child: Text('Enable / disable')),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _addUser(BuildContext context, WidgetRef ref) async {
    final name = TextEditingController();
    final pin = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    String role = 'operator';
    bool createOnline = false;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx2, setS) => AlertDialog(
          title: const Text('Add user'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: name,
                    decoration: const InputDecoration(
                        labelText: 'Name *')),
                const SizedBox(height: 12),
                TextField(
                  controller: pin,
                  decoration: const InputDecoration(
                      labelText: 'PIN (4-8 digits) *'),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: role,
                  decoration:
                      const InputDecoration(labelText: 'Role'),
                  items: const [
                    DropdownMenuItem(
                        value: 'admin',
                        child: Text('Administrator')),
                    DropdownMenuItem(
                        value: 'operator',
                        child: Text('Sales Operator')),
                    DropdownMenuItem(
                        value: 'viewer',
                        child: Text('View Only')),
                  ],
                  onChanged: (v) =>
                      setS(() => role = v ?? 'operator'),
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  title: const Text('Create online account',
                      style: TextStyle(fontSize: 14)),
                  subtitle: const Text(
                      'For login on other devices via Firebase',
                      style: TextStyle(fontSize: 12)),
                  value: createOnline,
                  onChanged: (v) =>
                      setS(() => createOnline = v ?? false),
                  controlAffinity:
                      ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                if (createOnline) ...[
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                        labelText: 'Email *',
                        hintText: 'operator@shop.com'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: password,
                    decoration: const InputDecoration(
                        labelText: 'Password * (min 6 chars)'),
                    obscureText: true,
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx2, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx2, true),
                child: const Text('Add')),
          ],
        ),
      ),
    );
    if (ok != true || !context.mounted) return;
    if (name.text.trim().isEmpty ||
        Validators.pin(pin.text) != null) {
      showErrorSnack(context, 'Enter a name and valid PIN');
      return;
    }
    if (createOnline &&
        (email.text.trim().isEmpty || password.text.length < 6)) {
      showErrorSnack(
          context, 'Enter a valid email and password (min 6 chars)');
      return;
    }
    try {
      final auth = ref.read(authServiceProvider);
      final user = await auth.createUser(
        name: name.text,
        pin: pin.text,
        role: role,
        actorId: ref.read(sessionProvider)!.userId,
      );
      // Create Firebase account and link it.
      if (createOnline) {
        try {
          final fbAuth = FirebaseAuthService();
          final uid = await fbAuth.createUser(
            email: email.text,
            password: password.text,
          );
          await auth.linkFirebaseUid(user.id, uid, email.text.trim());
          // Sign back in as admin (creating user signs in as them).
          await fbAuth.signOut();
        } catch (e) {
          if (context.mounted) {
            showErrorSnack(
                context, 'Local user created, but online account failed: $e');
          }
          return;
        }
      }
      if (context.mounted) showOkSnack(context, 'User added');
    } catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }

  Future<void> _onMenu(BuildContext context, WidgetRef ref,
      LocalUser u, String action) async {
    final auth = ref.read(authServiceProvider);
    final actorId = ref.read(sessionProvider)!.userId;
    try {
      if (action == 'pin') {
        final pin = TextEditingController();
        final ok = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Reset PIN — ${u.name}'),
            content: TextField(
              controller: pin,
              decoration: const InputDecoration(
                  labelText: 'New PIN (4-8 digits)'),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancel')),
              FilledButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text('Reset')),
            ],
          ),
        );
        if (ok != true || !context.mounted) return;
        if (Validators.pin(pin.text) != null) {
          showErrorSnack(context, 'PIN must be 4-8 digits');
          return;
        }
        await auth.resetPin(
            userId: u.id, newPin: pin.text, actorId: actorId);
        if (context.mounted) showOkSnack(context, 'PIN reset');
      } else {
        await auth.setActive(
            userId: u.id,
            active: u.isActive != 1,
            actorId: actorId);
        if (context.mounted) showOkSnack(context, 'Updated');
      }
    } catch (e) {
      if (context.mounted) showErrorSnack(context, e);
    }
  }
}
