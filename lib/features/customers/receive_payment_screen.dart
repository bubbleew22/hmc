import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

class ReceivePaymentScreen extends ConsumerStatefulWidget {
  final String customerId;
  const ReceivePaymentScreen({super.key, required this.customerId});

  @override
  ConsumerState<ReceivePaymentScreen> createState() =>
      _ReceivePaymentScreenState();
}

class _ReceivePaymentScreenState
    extends ConsumerState<ReceivePaymentScreen> {
  final _form = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _notes = TextEditingController();
  int _date = PkTime.nowEpochMs();
  String _method = 'Cash';
  bool _saving = false;

  @override
  void dispose() {
    _amount.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    final minor = Money.tryParseMajor(_amount.text);
    if (minor == null || minor <= 0) {
      showErrorSnack(context, 'Enter a valid amount');
      return;
    }
    setState(() => _saving = true);
    try {
      final remainder =
          await ref.read(customerServiceProvider).receivePayment(
                customerId: widget.customerId,
                amount: minor,
                date: _date,
                method: _method,
                notes: _notes.text,
              );
      if (!mounted) return;
      showOkSnack(
          context,
          remainder > 0
              ? 'Payment recorded (${Money.format(remainder)} kept as advance)'
              : 'Payment recorded and allocated');
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
    return Scaffold(
      appBar: AppBar(title: const Text('Receive payment')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FutureBuilder(
              future: ref
                  .read(customerServiceProvider)
                  .outstandingBalance(widget.customerId),
              builder: (ctx, snap) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Outstanding balance',
                          style:
                              TextStyle(fontWeight: FontWeight.w600)),
                      MoneyText(snap.data ?? 0,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                          negativeColor: Colors.red),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            MoneyField(
                controller: _amount,
                label: 'Amount received *',
                allowZero: false),
            const SizedBox(height: 12),
            DateField(
                value: _date,
                onChanged: (v) => setState(() => _date = v),
                label: 'Payment date'),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _method,
              decoration:
                  const InputDecoration(labelText: 'Payment method'),
              items: const [
                'Cash',
                'Bank Transfer',
                'Easypaisa',
                'JazzCash',
                'Card',
                'Other'
              ]
                  .map((m) =>
                      DropdownMenuItem(value: m, child: Text(m)))
                  .toList(),
              onChanged: (v) => setState(() => _method = v ?? 'Cash'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notes,
              decoration:
                  const InputDecoration(labelText: 'Notes'),
              maxLines: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'The payment is allocated to the oldest unpaid invoices first.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: const Icon(Icons.payments_outlined),
              label: const Text('Record payment'),
            ),
          ],
        ),
      ),
    );
  }
}
