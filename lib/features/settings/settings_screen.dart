import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/share/whatsapp.dart';
import '../../core/theme/app_theme.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';
import '../../widgets/hmc_bottom_nav.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      bottomNavigationBar: const HmcBottomNav(currentIndex: 4),
      body: FutureBuilder(
        future: db.readSettings(),
        builder: (ctx, snap) {
          final s = snap.data;
          return ListView(
            children: [
              const SectionHeader(title: 'Shop'),
              _tile(context, Icons.store_outlined, 'Shop information',
                  'Name, contact, address, invoice footer', () async {
                final updated = await _shopInfoDialog(context, ref, s);
                if (updated == true && context.mounted) {
                  showOkSnack(context, 'Shop info saved');
                }
              }),
              _tile(context, Icons.palette_outlined, 'Theme',
                  'Light, dark or follow system', () async {
                final mode = await _themeDialog(context, ref, s);
                if (mode != null) {
                  ref.read(themeModeProvider.notifier).state =
                      AppTheme.parseMode(mode);
                  await ref
                      .read(shopServiceProvider)
                      .setThemeMode(mode);
                }
              }),
              _tile(context, Icons.receipt_outlined, 'Invoice format',
                  'A4, compact or thermal receipt', () async {
                final fmt = await _invoiceFormatDialog(
                    context, s?.invoiceFormat ?? 'a4');
                if (fmt != null) {
                  await ref.read(shopServiceProvider).updateSettings(
                      ShopSettingsCompanion(
                          invoiceFormat: Value(fmt)));
                }
              }),
              _tile(context, Icons.chat_outlined, 'WhatsApp reminder template',
                  'Edit the udhaar reminder message', () async {
                final tpl = await _templateDialog(
                    context, s?.whatsappTemplate ?? '');
                if (tpl != null) {
                  await ref
                      .read(shopServiceProvider)
                      .setWhatsappTemplate(tpl);
                  if (context.mounted) {
                    showOkSnack(context, 'Template saved');
                  }
                }
              }),
              _tile(context, Icons.warning_amber_outlined,
                  'Low-stock threshold',
                  'Alert below this quantity', () async {
                final v = await _thresholdDialog(
                    context, s?.lowStockThreshold ?? 5);
                if (v != null) {
                  await ref.read(shopServiceProvider).updateSettings(
                      ShopSettingsCompanion(
                          lowStockThreshold: Value(v)));
                }
              }),
              const SectionHeader(title: 'Operations'),
              _tile(context, Icons.shopping_bag_outlined, 'Purchases',
                  'Purchase history and new purchases',
                  () => context.push('/purchases')),
              _tile(context, Icons.local_shipping_outlined, 'Suppliers',
                  'Supplier list and outstanding', () => context.push('/suppliers')),
              _tile(context, Icons.send_outlined, 'Dispatch & consignment',
                  'Units sent to sub-dealers',
                  () => context.push('/dispatch')),
              _tile(context, Icons.assignment_return_outlined,
                  'Returns & refunds', 'Sales and purchase returns',
                  () => context.push('/returns')),
              _tile(context, Icons.money_off_outlined, 'Expenses',
                  'Shop expense entries', () => context.push('/expenses')),
              _tile(context, Icons.payments_outlined, 'Credit recovery',
                  'Collect pending customer dues',
                  () => context.push('/credit')),
              _tile(context, Icons.category_outlined, 'Brands & models',
                  'Manage catalogue brands and models',
                  () => context.push('/brands')),
              const SectionHeader(title: 'Data & security'),
              if (ref.isAdmin)
                _tile(context, Icons.manage_accounts_outlined,
                    'Users & roles', 'Staff accounts, PIN resets',
                    () => context.push('/settings/users')),
              _tile(context, Icons.backup_outlined, 'Backup & restore',
                  'Manual backups, export, restore',
                  () => context.push('/settings/backup')),
              const SectionHeader(title: 'Cloud sync'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.cloud_off_outlined,
                        color: Colors.grey),
                    title: Text('Cloud sync — not configured',
                        style: TextStyle(
                            fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        'This app works fully offline. Cloud sync can be enabled later after approval.'),
                  ),
                ),
              ),
              const SectionHeader(title: 'About'),
              _tile(context, Icons.info_outlined, 'About HMC',
                  'Version and app info',
                  () => context.push('/settings/about')),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }

  Widget _tile(BuildContext context, IconData icon, String title,
      String subtitle, VoidCallback onTap) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Future<bool?> _shopInfoDialog(
      BuildContext context, WidgetRef ref, ShopSetting? s) {
    final name = TextEditingController(text: s?.shopName ?? '');
    final subtitle =
        TextEditingController(text: s?.subtitle ?? '');
    final contact =
        TextEditingController(text: s?.contactNumber ?? '');
    final address = TextEditingController(text: s?.address ?? '');
    final footer =
        TextEditingController(text: s?.invoiceFooter ?? '');
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Shop information'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: name,
                  decoration: const InputDecoration(
                      labelText: 'Shop name')),
              TextField(
                  controller: subtitle,
                  decoration: const InputDecoration(
                      labelText: 'Subtitle / location')),
              TextField(
                  controller: contact,
                  decoration: const InputDecoration(
                      labelText: 'Contact number'),
                  keyboardType: TextInputType.phone),
              TextField(
                  controller: address,
                  decoration: const InputDecoration(
                      labelText: 'Address')),
              TextField(
                  controller: footer,
                  decoration: const InputDecoration(
                      labelText: 'Invoice footer'),
                  maxLines: 2),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () async {
                await ref.read(shopServiceProvider).updateSettings(
                    ShopSettingsCompanion(
                        shopName: Value(name.text.trim()),
                        subtitle: Value(subtitle.text.trim()),
                        contactNumber: Value(contact.text.trim()),
                        address: Value(address.text.trim()),
                        invoiceFooter:
                            Value(footer.text.trim())));
                if (ctx.mounted) Navigator.pop(ctx, true);
              },
              child: const Text('Save')),
        ],
      ),
    );
  }

  Future<String?> _themeDialog(
      BuildContext context, WidgetRef ref, ShopSetting? s) {
    return showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Theme'),
        children: [
          for (final m in ['light', 'dark', 'system'])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, m),
              child: Text(
                  '${m[0].toUpperCase()}${m.substring(1)}${(s?.themeMode ?? 'system') == m ? ' ✓' : ''}'),
            ),
        ],
      ),
    );
  }

  Future<String?> _invoiceFormatDialog(
      BuildContext context, String current) {
    return showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Invoice format'),
        children: [
          for (final f in ['a4', 'compact', 'thermal'])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, f),
              child: Text(
                  '${f[0].toUpperCase()}${f.substring(1)}${current == f ? ' ✓' : ''}'),
            ),
        ],
      ),
    );
  }

  Future<String?> _templateDialog(
      BuildContext context, String current) {
    final c = TextEditingController(
        text: current.isEmpty ? WhatsApp.defaultTemplate : current);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('WhatsApp reminder template'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                controller: c,
                maxLines: 6,
                decoration: const InputDecoration(
                    labelText: 'Message template')),
            const SizedBox(height: 8),
            const Text(
              'Placeholders: {name} {amount} {shop}',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () =>
                  Navigator.pop(ctx, WhatsApp.defaultTemplate),
              child: const Text('Reset default')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, c.text),
              child: const Text('Save')),
        ],
      ),
    );
  }

  Future<int?> _thresholdDialog(
      BuildContext context, int current) {
    final c = TextEditingController(text: '$current');
    return showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Low-stock threshold'),
        content: TextField(
          controller: c,
          decoration:
              const InputDecoration(labelText: 'Quantity'),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(
                  ctx, int.tryParse(c.text) ?? current),
              child: const Text('Save')),
        ],
      ),
    );
  }
}
