import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/services/dispatch_service.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../core/utils/validators.dart';
import '../../widgets/common.dart';
import '../../widgets/pickers.dart';

class _DLine {
  String? unitId;
  String? batchId;
  String variantId;
  String label;
  int quantity;
  int unitCost;
  int agreedPrice;
  _DLine({
    this.unitId,
    this.batchId,
    required this.variantId,
    required this.label,
    required this.quantity,
    required this.unitCost,
    required this.agreedPrice,
  });
}

class NewDispatchScreen extends ConsumerStatefulWidget {
  const NewDispatchScreen({super.key});

  @override
  ConsumerState<NewDispatchScreen> createState() =>
      _NewDispatchScreenState();
}

class _NewDispatchScreenState
    extends ConsumerState<NewDispatchScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _notes = TextEditingController();
  int _date = PkTime.nowEpochMs();
  final List<_DLine> _lines = [];
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _addLine() async {
    final picked = await pickVariant(context, ref);
    if (picked == null || !mounted) return;
    final mode = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pick stock'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, 'unit'),
              child: const Text('Serialized unit')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, 'batch'),
              child: const Text('Quantity batch')),
        ],
      ),
    );
    if (mode == null || !mounted) return;
    if (mode == 'unit') {
      final unit = await pickAvailableUnit(
          context, ref, picked.variantId, picked.label);
      if (unit == null || !mounted) return;
      final agreed = await _askAgreed(
          '${picked.label} · ${unit.label}', unit.cost);
      if (agreed == null || !mounted) return;
      setState(() => _lines.add(_DLine(
            unitId: unit.unitId,
            variantId: picked.variantId,
            label: '${picked.label} · ${unit.label}',
            quantity: 1,
            unitCost: unit.cost,
            agreedPrice: agreed,
          )));
    } else {
      final batch =
          await pickBatch(context, ref, picked.variantId);
      if (batch == null || !mounted) return;
      final res =
          await _askQtyAgreed(picked.label, batch.availableQty, batch.unitCost);
      if (res == null || !mounted) return;
      setState(() => _lines.add(_DLine(
            batchId: batch.batchId,
            variantId: picked.variantId,
            label: picked.label,
            quantity: res.$1,
            unitCost: batch.unitCost,
            agreedPrice: res.$2,
          )));
    }
  }

  Future<int?> _askAgreed(String label, int cost) async {
    final c = TextEditingController(text: Money.toEditable(cost));
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(label, style: const TextStyle(fontSize: 15)),
        content: MoneyField(
            controller: c, label: 'Agreed sale price *'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Add')),
        ],
      ),
    );
    if (ok != true) return null;
    return Money.tryParseMajor(c.text);
  }

  Future<(int, int)?> _askQtyAgreed(
      String label, int maxQty, int cost) async {
    final q = TextEditingController(text: '1');
    final p = TextEditingController(text: Money.toEditable(cost));
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(label, style: const TextStyle(fontSize: 15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: q,
              decoration: InputDecoration(
                  labelText: 'Quantity * (max $maxQty)'),
              keyboardType: TextInputType.number,
            ),
            MoneyField(controller: p, label: 'Agreed price *'),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Add')),
        ],
      ),
    );
    if (ok != true) return null;
    final quantity = int.tryParse(q.text) ?? 0;
    final price = Money.tryParseMajor(p.text);
    if (quantity <= 0 || quantity > maxQty || price == null) {
      if (mounted) showErrorSnack(context, 'Invalid quantity or price');
      return null;
    }
    return (quantity, price);
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    if (_lines.isEmpty) {
      showErrorSnack(context, 'Add at least one item');
      return;
    }
    setState(() => _saving = true);
    try {
      final d = await ref.read(dispatchServiceProvider).createDispatch(
            recipientName: _name.text,
            recipientPhone: _phone.text,
            recipientAddress: _address.text,
            dispatchDate: _date,
            items: [
              for (final l in _lines)
                DispatchLineInput(
                  unitId: l.unitId,
                  batchId: l.batchId,
                  variantId: l.variantId,
                  quantity: l.quantity,
                  unitCost: l.unitCost,
                  agreedPrice: l.agreedPrice,
                ),
            ],
            notes: _notes.text,
            userId: ref.read(sessionProvider)?.userId,
          );
      if (!mounted) return;
      showOkSnack(context, 'Dispatch ${d.refNo} recorded');
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
      appBar: AppBar(title: const Text('New dispatch')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                  labelText: 'Recipient name *'),
              validator: (v) =>
                  Validators.required(v, 'Recipient name'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phone,
              decoration: const InputDecoration(
                  labelText: 'Contact number'),
              keyboardType: TextInputType.phone,
              validator: (v) => Validators.phone(v),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _address,
              decoration:
                  const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 12),
            DateField(
                value: _date,
                onChanged: (v) => setState(() => _date = v),
                label: 'Dispatch date'),
            const SectionHeader(title: 'Items'),
            for (var i = 0; i < _lines.length; i++)
              Card(
                child: ListTile(
                  title: Text(_lines[i].label,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                      'Qty ${_lines[i].quantity} · agreed ${Money.format(_lines[i].agreedPrice)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: Colors.red),
                    onPressed: () =>
                        setState(() => _lines.removeAt(i)),
                  ),
                ),
              ),
            OutlinedButton.icon(
              onPressed: _addLine,
              icon: const Icon(Icons.add),
              label: const Text('Add item'),
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
                'Dispatched stock is not a sale. It stays as "dispatched" until the recipient confirms a sale or returns it.',
                style:
                    TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: const Icon(Icons.send_outlined),
              label: const Text('Save dispatch'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
