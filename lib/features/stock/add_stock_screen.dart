import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/providers.dart';
import '../../core/services/catalog_service.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../core/utils/validators.dart';
import '../../widgets/common.dart';

/// Receive new stock: pick brand → model → variant, then enter units.
class AddStockScreen extends ConsumerStatefulWidget {
  const AddStockScreen({super.key});

  @override
  ConsumerState<AddStockScreen> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends ConsumerState<AddStockScreen> {
  final _form = GlobalKey<FormState>();
  String? _brandId;
  String? _modelId;
  String? _variantId;
  bool _serialized = true;

  final _imei = TextEditingController();
  final _imei2 = TextEditingController();
  final _serial = TextEditingController();
  final _qty = TextEditingController(text: '1');
  final _cost = TextEditingController();
  final _price = TextEditingController();
  String _pta = 'Approved';
  String _supplierId = '';
  int _date = PkTime.nowEpochMs();
  final _notes = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
  }

  bool _initDone = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initDone) {
      _initDone = true;
      final variant =
          GoRouterState.of(context).uri.queryParameters['variant'];
      if (variant != null) _variantId = variant;
    }
  }

  @override
  void dispose() {
    _imei.dispose();
    _imei2.dispose();
    _serial.dispose();
    _qty.dispose();
    _cost.dispose();
    _price.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _scanImei(TextEditingController target) async {
    final code = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const _ScannerScreen()),
    );
    if (code != null && code.isNotEmpty) {
      setState(() => target.text = code.trim());
    }
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    if (_variantId == null) {
      showErrorSnack(context, 'Select brand, model and variant first');
      return;
    }
    setState(() => _saving = true);
    try {
      final stock = ref.read(stockServiceProvider);
      final cost = Money.tryParseMajor(_cost.text) ?? 0;
      final price = Money.tryParseMajor(_price.text) ?? cost;
      final userId = ref.read(sessionProvider)?.userId;
      if (_serialized) {
        await stock.addUnit(
          variantId: _variantId!,
          imei1: _imei.text,
          imei2: _imei2.text,
          serial: _serial.text,
          ptaStatus: _pta,
          purchasePrice: cost,
          salePrice: price,
          supplierId: _supplierId.isEmpty ? null : _supplierId,
          purchaseDate: _date,
          notes: _notes.text,
          userId: userId,
        );
      } else {
        final qty = int.parse(_qty.text);
        await stock.addBatch(
          variantId: _variantId!,
          quantity: qty,
          purchasePrice: cost,
          supplierId: _supplierId.isEmpty ? null : _supplierId,
          purchaseDate: _date,
          userId: userId,
        );
      }
      if (!mounted) return;
      showOkSnack(context, 'Stock added');
      // Reset for the next unit, keep catalogue selection.
      _imei.clear();
      _imei2.clear();
      _serial.clear();
      setState(() => _saving = false);
    } catch (e) {
      if (mounted) {
        showErrorSnack(context, e);
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final catalog = ref.watch(catalogServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Add stock')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Product',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            const SizedBox(height: 8),
            StreamBuilder(
              stream: catalog.watchBrands(),
              builder: (ctx, snap) {
                final brands = snap.data ?? [];
                return DropdownButtonFormField<String>(
                  value: _brandId,
                  decoration:
                      const InputDecoration(labelText: 'Brand *'),
                  items: [
                    for (final b in brands)
                      DropdownMenuItem(value: b.id, child: Text(b.name))
                  ],
                  onChanged: (v) => setState(() {
                    _brandId = v;
                    _modelId = null;
                    _variantId = null;
                  }),
                  validator: (v) =>
                      v == null ? 'Select a brand' : null,
                );
              },
            ),
            const SizedBox(height: 12),
            if (_brandId != null)
              StreamBuilder(
                stream: catalog.watchModels(_brandId!),
                builder: (ctx, snap) {
                  final models = snap.data ?? [];
                  return DropdownButtonFormField<String>(
                    value: _modelId,
                    decoration:
                        const InputDecoration(labelText: 'Model *'),
                    items: [
                      for (final m in models)
                        DropdownMenuItem(value: m.id, child: Text(m.name))
                    ],
                    onChanged: (v) => setState(() {
                      _modelId = v;
                      _variantId = null;
                    }),
                    validator: (v) =>
                        v == null ? 'Select a model' : null,
                  );
                },
              ),
            const SizedBox(height: 12),
            if (_modelId != null)
              StreamBuilder(
                stream: catalog.watchVariants(_modelId!),
                builder: (ctx, snap) {
                  final variants = snap.data ?? [];
                  return DropdownButtonFormField<String>(
                    value: _variantId,
                    decoration:
                        const InputDecoration(labelText: 'Variant *'),
                    items: [
                      for (final v in variants)
                        DropdownMenuItem(
                            value: v.id,
                            child: Text(CatalogService.variantLabel(
                                v, ''))),
                    ],
                    onChanged: (v) => setState(() => _variantId = v),
                    validator: (v) =>
                        v == null ? 'Select a variant' : null,
                  );
                },
              ),
            const SizedBox(height: 16),
            const Text('Stock type',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(
                    value: true, label: Text('Serialized (IMEI)')),
                ButtonSegment(
                    value: false, label: Text('Quantity batch')),
              ],
              selected: {_serialized},
              onSelectionChanged: (s) =>
                  setState(() => _serialized = s.first),
            ),
            const SizedBox(height: 16),
            if (_serialized) ...[
              TextFormField(
                controller: _imei,
                decoration: InputDecoration(
                  labelText: 'IMEI 1 *',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () => _scanImei(_imei),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (v) => Validators.imei(v, required: true),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _imei2,
                decoration: const InputDecoration(labelText: 'IMEI 2'),
                keyboardType: TextInputType.number,
                validator: (v) => Validators.imei(v),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _serial,
                decoration:
                    const InputDecoration(labelText: 'Serial number'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _pta,
                decoration:
                    const InputDecoration(labelText: 'PTA status'),
                items: const ['Approved', 'Non-PTA', 'Other']
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (v) => setState(() => _pta = v ?? 'Approved'),
              ),
            ] else ...[
              TextFormField(
                controller: _qty,
                decoration:
                    const InputDecoration(labelText: 'Quantity *'),
                keyboardType: TextInputType.number,
                validator: Validators.quantity,
              ),
            ],
            const SizedBox(height: 12),
            MoneyField(
                controller: _cost, label: 'Purchase cost per unit *'),
            const SizedBox(height: 12),
            MoneyField(
                controller: _price,
                label: 'Selling price per unit',
                allowZero: true),
            const SizedBox(height: 12),
            DateField(
                value: _date, onChanged: (v) => setState(() => _date = v),
                label: 'Purchase date'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notes,
              decoration: const InputDecoration(labelText: 'Notes'),
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child:
                          CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.save_outlined),
              label: const Text('Save stock'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _ScannerScreen extends StatelessWidget {
  const _ScannerScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Scan barcode / IMEI')),
        body: MobileScanner(
          onDetect: (capture) {
            final barcodes = capture.barcodes;
            if (barcodes.isNotEmpty &&
                barcodes.first.rawValue != null) {
              Navigator.pop(context, barcodes.first.rawValue!);
            }
          },
        ),
      );
}
