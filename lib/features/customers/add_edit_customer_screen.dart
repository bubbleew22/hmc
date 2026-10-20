import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/validators.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

class AddEditCustomerScreen extends ConsumerStatefulWidget {
  final String? customerId;
  const AddEditCustomerScreen({super.key, this.customerId});

  @override
  ConsumerState<AddEditCustomerScreen> createState() =>
      _AddEditCustomerScreenState();
}

class _AddEditCustomerScreenState
    extends ConsumerState<AddEditCustomerScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _notes = TextEditingController();
  final _opening = TextEditingController(text: '0');
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    if (widget.customerId != null) _load();
    else {
      setState(() => _loading = false);
    }
  }

  Future<void> _load() async {
    final c = await ref
        .read(customerServiceProvider)
        .getCustomer(widget.customerId!);
    if (!mounted) return;
    if (c != null) {
      _name.text = c.name;
      _phone.text = c.phone;
      _address.text = c.address;
      _notes.text = c.notes;
      _opening.text = Money.toEditable(c.openingBalance);
    }
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    _notes.dispose();
    _opening.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final svc = ref.read(customerServiceProvider);
      final opening = Money.tryParseMajor(_opening.text) ?? 0;
      if (widget.customerId == null) {
        await svc.addCustomer(
          name: _name.text,
          phone: _phone.text,
          address: _address.text,
          notes: _notes.text,
          openingBalance: opening,
        );
      } else {
        await svc.updateCustomer(
          widget.customerId!,
          CustomersCompanion(
            name: Value(_name.text.trim()),
            phone: Value(_phone.text.trim()),
            address: Value(_address.text.trim()),
            notes: Value(_notes.text.trim()),
          ),
        );
      }
      if (!mounted) return;
      showOkSnack(context, 'Customer saved');
      context.pop();
    } catch (e) {
      if (mounted) {
        showErrorSnack(context, e);
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.customerId != null;
    return Scaffold(
      appBar:
          AppBar(title: Text(isEdit ? 'Edit customer' : 'New customer')),
      body: _loading
          ? const LoadingView()
          : Form(
              key: _form,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TextFormField(
                    controller: _name,
                    decoration:
                        const InputDecoration(labelText: 'Name *'),
                    validator: (v) =>
                        Validators.required(v, 'Name'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _phone,
                    decoration: const InputDecoration(
                        labelText: 'Phone number'),
                    keyboardType: TextInputType.phone,
                    validator: (v) => Validators.phone(v),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _address,
                    decoration: const InputDecoration(
                        labelText: 'Address (optional)'),
                  ),
                  const SizedBox(height: 12),
                  if (!isEdit)
                    MoneyField(
                      controller: _opening,
                      label: 'Opening balance (customer owes)',
                    ),
                  if (!isEdit)
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        'Recorded as an explicit opening-balance ledger entry.',
                        style:
                            TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _notes,
                    decoration:
                        const InputDecoration(labelText: 'Notes'),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: _saving ? null : _save,
                    icon: const Icon(Icons.save_outlined),
                    label: Text(
                        isEdit ? 'Save changes' : 'Add customer'),
                  ),
                ],
              ),
            ),
    );
  }
}
