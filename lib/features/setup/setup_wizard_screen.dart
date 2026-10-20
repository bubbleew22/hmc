import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/validators.dart';
import '../../widgets/common.dart';

/// First-launch setup wizard: shop info + administrator account.
class SetupWizardScreen extends ConsumerStatefulWidget {
  const SetupWizardScreen({super.key});

  @override
  ConsumerState<SetupWizardScreen> createState() => _SetupWizardScreenState();
}

class _SetupWizardScreenState extends ConsumerState<SetupWizardScreen> {
  final _form = GlobalKey<FormState>();
  int _step = 0;
  bool _saving = false;

  final _shopName = TextEditingController(text: 'Hassan Mobile Center');
  final _subtitle = TextEditingController(text: 'Shewa Adda');
  final _contact = TextEditingController();
  final _address = TextEditingController();
  final _footer = TextEditingController();
  final _adminName = TextEditingController();
  final _pin = TextEditingController();
  final _pin2 = TextEditingController();
  String _theme = 'system';
  String _invoiceFormat = 'a4';

  @override
  void dispose() {
    for (final c in [
      _shopName,
      _subtitle,
      _contact,
      _address,
      _footer,
      _adminName,
      _pin,
      _pin2
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _finish() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final shop = ref.read(shopServiceProvider);
      final auth = ref.read(authServiceProvider);
      await shop.completeSetup(
        shopName: _shopName.text,
        subtitle: _subtitle.text,
        contactNumber: _contact.text,
        address: _address.text,
        invoiceFooter: _footer.text,
        themeMode: _theme,
        invoiceFormat: _invoiceFormat,
      );
      await auth.createAdmin(name: _adminName.text, pin: _pin.text);
      await ref.read(catalogServiceProvider).seedDefaultBrands();
      await ref.read(expenseServiceProvider).seedCategories();
      syncThemeFromSettings(ref, _theme);
      ref.read(setupDoneProvider.notifier).state = true;
      ref.read(usersExistProvider.notifier).state = true;
      if (mounted) context.go('/login');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop Setup')),
      body: Form(
        key: _form,
        child: Stepper(
          currentStep: _step,
          onStepContinue: () {
            if (_step < 2) {
              setState(() => _step++);
            } else {
              _finish();
            }
          },
          onStepCancel:
              _step > 0 ? () => setState(() => _step--) : null,
          controlsBuilder: (ctx, details) => Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                FilledButton(
                  onPressed: _saving ? null : details.onStepContinue,
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : Text(_step == 2 ? 'Finish Setup' : 'Continue'),
                ),
                const SizedBox(width: 8),
                if (_step > 0)
                  TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back')),
              ],
            ),
          ),
          steps: [
            Step(
              title: const Text('Shop information'),
              isActive: _step >= 0,
              content: Column(children: [
                TextFormField(
                    controller: _shopName,
                    decoration:
                        const InputDecoration(labelText: 'Shop name *'),
                    validator: (v) => Validators.required(v, 'Shop name')),
                const SizedBox(height: 12),
                TextFormField(
                    controller: _subtitle,
                    decoration: const InputDecoration(
                        labelText: 'Subtitle / Location *'),
                    validator: (v) => Validators.required(v, 'Location')),
                const SizedBox(height: 12),
                TextFormField(
                    controller: _contact,
                    decoration: const InputDecoration(
                        labelText: 'Contact number',
                        hintText: 'e.g. 0301 2345678'),
                    keyboardType: TextInputType.phone,
                    validator: (v) => Validators.phone(v)),
                const SizedBox(height: 12),
                TextFormField(
                    controller: _address,
                    decoration:
                        const InputDecoration(labelText: 'Address (optional)')),
                const SizedBox(height: 12),
                TextFormField(
                    controller: _footer,
                    decoration: const InputDecoration(
                        labelText: 'Invoice footer (optional)'),
                    maxLines: 2),
              ]),
            ),
            Step(
              title: const Text('Administrator account'),
              isActive: _step >= 1,
              content: Column(children: [
                TextFormField(
                    controller: _adminName,
                    decoration:
                        const InputDecoration(labelText: 'Admin name *'),
                    validator: (v) => Validators.required(v, 'Admin name')),
                const SizedBox(height: 12),
                TextFormField(
                    controller: _pin,
                    decoration:
                        const InputDecoration(labelText: 'PIN (4-8 digits) *'),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: Validators.pin),
                const SizedBox(height: 12),
                TextFormField(
                    controller: _pin2,
                    decoration: const InputDecoration(
                        labelText: 'Confirm PIN *'),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (v) =>
                        v == _pin.text ? null : 'PINs do not match'),
              ]),
            ),
            Step(
              title: const Text('Preferences'),
              isActive: _step >= 2,
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Theme',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(
                            value: 'light', label: Text('Light')),
                        ButtonSegment(value: 'dark', label: Text('Dark')),
                        ButtonSegment(
                            value: 'system', label: Text('System')),
                      ],
                      selected: {_theme},
                      onSelectionChanged: (s) =>
                          setState(() => _theme = s.first),
                    ),
                    const SizedBox(height: 16),
                    const Text('Invoice format',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(value: 'a4', label: Text('A4')),
                        ButtonSegment(
                            value: 'compact', label: Text('Compact')),
                        ButtonSegment(
                            value: 'thermal', label: Text('Thermal')),
                      ],
                      selected: {_invoiceFormat},
                      onSelectionChanged: (s) =>
                          setState(() => _invoiceFormat = s.first),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Your data stays on this device. No internet or account needed.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
