import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/services/purchase_service.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../core/utils/validators.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';
import '../../widgets/pickers.dart';

class _Line {
  String variantId;
  String variantLabel;
  int quantity;
  int unitCost;
  List<String> imeis;
  bool serialized;
  _Line({
    required this.variantId,
    required this.variantLabel,
    this.quantity = 1,
    this.unitCost = 0,
    this.imeis = const [],
    this.serialized = false,
  });
}

class NewPurchaseScreen extends ConsumerStatefulWidget {
  const NewPurchaseScreen({super.key});

  @override
  ConsumerState<NewPurchaseScreen> createState() => _NewPurchaseScreenState();
}

class _NewPurchaseScreenState extends ConsumerState<NewPurchaseScreen> {
  final _form = GlobalKey<FormState>();
  Supplier? _supplier;
  int _date = PkTime.nowEpochMs();
  final List<_Line> _lines = [];
  final _discount = TextEditingController(text: '0');
  final _expenses = TextEditingController(text: '0');
  final _paid = TextEditingController(text: '0');
  final _notes = TextEditingController();
  String _method = 'Cash';
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final preset = GoRouterState.of(context).uri.queryParameters['supplier'];
    if (preset != null) {
      _loadSupplier(preset);
    }
  }

  Future<void> _loadSupplier(String id) async {
    final db = ref.read(databaseProvider);
    final s = await (db.select(db.suppliers)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (mounted) setState(() => _supplier = s);
  }

  @override
  void dispose() {
    _discount.dispose();
    _expenses.dispose();
    _paid.dispose();
    _notes.dispose();
    super.dispose();
  }

  int get _subtotal =>
      _lines.fold<int>(0, (s, l) => s + l.quantity * l.unitCost);

  Future<void> _addLine() async {
    final picked = await pickVariant(context, ref);
    if (picked == null || !mounted) return;
    final serialized = await _askSerialized();
    if (!mounted) return;
    final qty = TextEditingController(text: '1');
    final cost = TextEditingController();
    final imeiC = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(picked.label,
            style: const TextStyle(fontSize: 15)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!serialized)
                TextFormField(
                  controller: qty,
                  decoration:
                      const InputDecoration(labelText: 'Quantity *'),
                  keyboardType: TextInputType.number,
                ),
              if (serialized)
                TextFormField(
                  controller: imeiC,
                  decoration: InputDecoration(
                    labelText: 'IMEIs (one per line) *',
                    hintText: '356938035643809\n356938035643817',
                  ),
                  maxLines: 4,
                  keyboardType: TextInputType.number,
                ),
              MoneyField(controller: cost, label: 'Unit cost *'),
            ],
          ),
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
    if (ok != true) return;
    final unitCost = Money.tryParseMajor(cost.text);
    if (unitCost == null || unitCost < 0) {
      if (mounted) showErrorSnack(context, 'Enter a valid unit cost');
      return;
    }
    List<String> imeis = [];
    var quantity = 1;
    if (serialized) {
      imeis = imeiC.text
          .split(RegExp(r'[\s,;]+'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      if (imeis.isEmpty) {
        if (mounted) showErrorSnack(context, 'Enter at least one IMEI');
        return;
      }
      for (final im in imeis) {
        if (Validators.imei(im, required: true) != null) {
          if (mounted) showErrorSnack(context, 'Invalid IMEI: $im');
          return;
        }
      }
      quantity = imeis.length;
    } else {
      quantity = int.tryParse(qty.text) ?? 0;
      if (quantity <= 0) {
        if (mounted) showErrorSnack(context, 'Enter a valid quantity');
        return;
      }
    }
    setState(() => _lines.add(_Line(
          variantId: picked.variantId,
          variantLabel: picked.label,
          quantity: quantity,
          unitCost: unitCost,
          imeis: imeis,
          serialized: serialized,
        )));
  }

  Future<bool> _askSerialized() async {
    final r = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Stock type'),
        content: const Text(
            'Are these serialized phones with IMEI numbers, or a quantity batch (accessories etc.)?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Quantity batch')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Serialized (IMEI)')),
        ],
      ),
    );
    return r ?? false;
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    if (_supplier == null) {
      showErrorSnack(context, 'Select a supplier');
      return;
    }
    if (_lines.isEmpty) {
      showErrorSnack(context, 'Add at least one item');
      return;
    }
    setState(() => _saving = true);
    try {
      final discount = Money.tryParseMajor(_discount.text) ?? 0;
      final expenses = Money.tryParseMajor(_expenses.text) ?? 0;
      final paid = Money.tryParseMajor(_paid.text) ?? 0;
      await ref.read(purchaseServiceProvider).recordPurchase(
            supplierId: _supplier!.id,
            purchaseDate: _date,
            lines: [
              for (final l in _lines)
                PurchaseLineInput(
                  variantId: l.variantId,
                  quantity: l.quantity,
                  unitCost: l.unitCost,
                  imeis: l.imeis,
                ),
            ],
            discount: discount,
            expenses: expenses,
            paid: paid,
            paymentMethod: _method,
            notes: _notes.text,
            userId: ref.read(sessionProvider)?.userId,
          );
      if (!mounted) return;
      showOkSnack(context, 'Purchase recorded');
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
      appBar: AppBar(title: const Text('New purchase')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.local_shipping_outlined),
                title: Text(_supplier?.name ?? 'Select supplier *',
                    style:
                        const TextStyle(fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final s = await pickSupplier(context, ref);
                  if (s != null) setState(() => _supplier = s);
                },
              ),
            ),
            const SizedBox(height: 8),
            DateField(
                value: _date,
                onChanged: (v) => setState(() => _date = v),
                label: 'Purchase date'),
            const SectionHeader(title: 'Items'),
            for (var i = 0; i < _lines.length; i++)
              Card(
                child: ListTile(
                  title: Text(_lines[i].variantLabel,
                      style:
                          const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(
                      'Qty ${_lines[i].quantity} × ${Money.format(_lines[i].unitCost)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MoneyText(
                          _lines[i].quantity * _lines[i].unitCost),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () =>
                            setState(() => _lines.removeAt(i)),
                      ),
                    ],
                  ),
                ),
              ),
            OutlinedButton.icon(
              onPressed: _addLine,
              icon: const Icon(Icons.add),
              label: const Text('Add item'),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal',
                            style: TextStyle(
                                fontWeight: FontWeight.w600)),
                        MoneyText(_subtotal,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    MoneyField(
                        controller: _discount, label: 'Discount'),
                    const SizedBox(height: 8),
                    MoneyField(
                        controller: _expenses,
                        label: 'Additional expenses (transport etc.)'),
                    const SizedBox(height: 8),
                    MoneyField(
                        controller: _paid, label: 'Amount paid now'),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _method,
                      decoration: const InputDecoration(
                          labelText: 'Payment method'),
                      items: const [
                        'Cash',
                        'Bank Transfer',
                        'Easypaisa',
                        'JazzCash',
                        'Card',
                        'Other'
                      ]
                          .map((m) => DropdownMenuItem(
                              value: m, child: Text(m)))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _method = v ?? 'Cash'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _notes,
                      decoration: const InputDecoration(
                          labelText: 'Notes'),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          strokeWidth: 2))
                  : const Icon(Icons.save_outlined),
              label: const Text('Save purchase'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
