import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers.dart';
import '../../core/services/sales_service.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/ids.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';
import '../../widgets/pickers.dart';

class _SaleLine {
  String? unitId;
  String? batchId;
  String variantId;
  String label;
  int quantity;
  int unitPrice;
  _SaleLine({
    this.unitId,
    this.batchId,
    required this.variantId,
    required this.label,
    required this.quantity,
    required this.unitPrice,
  });
}

class NewSaleScreen extends ConsumerStatefulWidget {
  const NewSaleScreen({super.key});

  @override
  ConsumerState<NewSaleScreen> createState() => _NewSaleScreenState();
}

class _NewSaleScreenState extends ConsumerState<NewSaleScreen> {
  final _form = GlobalKey<FormState>();
  /// Generated once per screen — rotation / double-tap safe.
  late final String _idempotencyKey = newIdempotencyKey();

  Customer? _customer;
  int _date = PkTime.nowEpochMs();
  final List<_SaleLine> _lines = [];
  final _discount = TextEditingController(text: '0');
  final _tax = TextEditingController(text: '0');
  final _paid = TextEditingController(text: '0');
  final _notes = TextEditingController();
  final _warranty = TextEditingController();
  String _method = 'Cash';
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    for (final c in [_discount, _tax, _paid]) {
      c.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _discount.dispose();
    _tax.dispose();
    _paid.dispose();
    _notes.dispose();
    _warranty.dispose();
    super.dispose();
  }

  int get _subtotal =>
      _lines.fold<int>(0, (s, l) => s + l.quantity * l.unitPrice);

  Future<void> _addItem() async {
    final picked = await pickVariant(context, ref);
    if (picked == null || !mounted) return;
    // Ask: serialized unit or batch?
    final mode = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pick stock'),
        content: Text(picked.label),
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
      final unit =
          await pickAvailableUnit(context, ref, picked.variantId, picked.label);
      if (unit == null || !mounted) return;
      final price = await _askPrice(picked.label, unit.cost);
      if (price == null || !mounted) return;
      setState(() => _lines.add(_SaleLine(
            unitId: unit.unitId,
            variantId: picked.variantId,
            label: '${picked.label} · ${unit.label}',
            quantity: 1,
            unitPrice: price,
          )));
    } else {
      final batch =
          await pickBatch(context, ref, picked.variantId);
      if (batch == null || !mounted) return;
      final qtyPrice = await _askQtyPrice(
          picked.label, batch.availableQty, batch.unitCost);
      if (qtyPrice == null || !mounted) return;
      setState(() => _lines.add(_SaleLine(
            batchId: batch.batchId,
            variantId: picked.variantId,
            label: picked.label,
            quantity: qtyPrice.$1,
            unitPrice: qtyPrice.$2,
          )));
    }
  }

  Future<int?> _askPrice(String label, int cost) async {
    final c = TextEditingController(text: Money.toEditable(cost));
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(label, style: const TextStyle(fontSize: 15)),
        content: MoneyField(controller: c, label: 'Sale price *'),
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

  Future<(int, int)?> _askQtyPrice(
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
            MoneyField(controller: p, label: 'Sale price *'),
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
    if (quantity <= 0 || quantity > maxQty || price == null || price < 0) {
      if (mounted) showErrorSnack(context, 'Invalid quantity or price');
      return null;
    }
    return (quantity, price);
  }

  Future<void> _pickOrAddCustomer() async {
    final c = await pickCustomer(context, ref);
    if (c != null) {
      setState(() => _customer = c);
      return;
    }
    if (!mounted) return;
    // Quick-add inline.
    final name = TextEditingController();
    final phone = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New customer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: name,
                decoration:
                    const InputDecoration(labelText: 'Name *')),
            TextField(
                controller: phone,
                decoration:
                    const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone),
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
    if (ok == true && name.text.trim().isNotEmpty && mounted) {
      final created = await ref
          .read(customerServiceProvider)
          .addCustomer(name: name.text, phone: phone.text);
      setState(() => _customer = created);
    }
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    if (_customer == null) {
      showErrorSnack(context, 'Select a customer');
      return;
    }
    if (_lines.isEmpty) {
      showErrorSnack(context, 'Add at least one item');
      return;
    }
    // Unsaved-changes guard is handled by PopScope below; now save.
    setState(() => _saving = true);
    try {
      final discount = Money.tryParseMajor(_discount.text) ?? 0;
      final tax = Money.tryParseMajor(_tax.text) ?? 0;
      final paid = Money.tryParseMajor(_paid.text) ?? 0;
      final invoice =
          await ref.read(salesServiceProvider).finalizeSale(
                idempotencyKey: _idempotencyKey,
                saleDate: _date,
                customerId: _customer!.id,
                items: [
                  for (final l in _lines)
                    SaleItemInput(
                      unitId: l.unitId,
                      batchId: l.batchId,
                      variantId: l.variantId,
                      quantity: l.quantity,
                      unitPrice: l.unitPrice,
                    ),
                ],
                discount: discount,
                tax: tax,
                paid: paid,
                paymentMethod: _method,
                notes: _notes.text,
                warranty: _warranty.text,
                userId: ref.read(sessionProvider)?.userId,
              );
      if (!mounted) return;
      showOkSnack(context, 'Sale saved — ${invoice.invoiceNo}');
      context.pushReplacement('/sale/${invoice.id}/receipt');
    } catch (e) {
      if (mounted) {
        showErrorSnack(context, e);
        setState(() => _saving = false);
      }
    }
  }

  /// Small grey section label above each input, per the mockup.
  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: HmcColors.slate,
          ),
        ),
      );

  Widget _customerCard() {
    final customer = _customer;
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: _pickOrAddCustomer,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              const Icon(Icons.person_outlined, color: HmcColors.slate),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customer?.name ?? 'Search or Add Customer',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: customer == null ? HmcColors.slate : null,
                      ),
                    ),
                    if (customer != null)
                      Text(
                        customer.phone,
                        style: const TextStyle(
                            color: HmcColors.slate, fontSize: 12),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Material(
                color: HmcColors.blue600,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: _pickOrAddCustomer,
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        Icon(Icons.add, color: Colors.white, size: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _payTypeChip(
      String label, Color color, bool selected, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? color : color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: color.withOpacity(selected ? 1.0 : 0.35)),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : color,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final discount = Money.tryParseMajor(_discount.text) ?? 0;
    final tax = Money.tryParseMajor(_tax.text) ?? 0;
    final total = _subtotal - discount + tax;
    final paid = Money.tryParseMajor(_paid.text) ?? 0;
    final balance = total - paid;
    // Payment-type selection is derived from the paid field: no new state.
    final isFull = total > 0 && paid >= total;
    final isLoan = paid == 0;
    final isPartial = !isFull && !isLoan;
    return PopScope(
      canPop: _lines.isEmpty && !_saving,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop || _saving) return;
        final discard = await confirmDialog(context,
            title: 'Discard sale?',
            message: 'You have unsaved items. Discard this sale?',
            confirmLabel: 'Discard',
            danger: true);
        if (discard && context.mounted) Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('New Sale')),
        body: Form(
          key: _form,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _label('Date'),
              DateField(
                value: _date,
                onChanged: (v) => setState(() => _date = v),
                label: 'Date',
              ),
              const SizedBox(height: 12),
              _label('Customer'),
              _customerCard(),
              const SizedBox(height: 16),
              _label('Items'),
              for (var i = 0; i < _lines.length; i++)
                Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Text(_lines[i].label,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        'Qty ${_lines[i].quantity} × ${Money.format(_lines[i].unitPrice)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MoneyText(_lines[i].quantity *
                            _lines[i].unitPrice),
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
                onPressed: _addItem,
                icon: const Icon(Icons.add),
                label: const Text('Add item'),
              ),
              const SizedBox(height: 16),
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      const SizedBox(height: 12),
                      MoneyField(
                          controller: _discount, label: 'Discount'),
                      const SizedBox(height: 12),
                      MoneyField(controller: _tax, label: 'Tax'),
                      const SizedBox(height: 12),
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
                      const SizedBox(height: 12),
                      _label('Payment Type'),
                      Row(
                        children: [
                          _payTypeChip(
                            'Full Payment',
                            HmcColors.success,
                            isFull,
                            () => setState(() =>
                                _paid.text = Money.toEditable(total)),
                          ),
                          const SizedBox(width: 8),
                          // Partial: leave the field for manual entry.
                          _payTypeChip(
                              'Partial', HmcColors.blue600, isPartial, () {}),
                          const SizedBox(width: 8),
                          _payTypeChip(
                            'On Loan',
                            HmcColors.danger,
                            isLoan,
                            () => setState(() => _paid.text = '0'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      MoneyField(
                          controller: _paid,
                          label: 'Payment received'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: HmcColors.blue600)),
                          MoneyText(total,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: HmcColors.blue600)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Balance due'),
                          MoneyText(balance,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700),
                              negativeColor: Colors.red),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _warranty,
                        decoration: const InputDecoration(
                            labelText:
                                'Warranty terms (optional)'),
                      ),
                      const SizedBox(height: 12),
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
                            strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.check),
                label: const Text('Save Sale'),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
