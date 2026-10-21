import 'dart:typed_data';
import 'package:drift/drift.dart' hide Column;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/pdf/invoice_pdf.dart';
import '../../core/providers.dart';
import '../../core/services/catalog_service.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

/// Receipt preview: view, print, save/share PDF.
class ReceiptPreviewScreen extends ConsumerStatefulWidget {
  final String saleId;
  const ReceiptPreviewScreen({super.key, required this.saleId});

  @override
  ConsumerState<ReceiptPreviewScreen> createState() =>
      _ReceiptPreviewScreenState();
}

class _ReceiptPreviewScreenState
    extends ConsumerState<ReceiptPreviewScreen> {
  Uint8List? _pdf;
  String? _error;

  // Screen-render data loaded alongside the PDF bytes.
  ShopSetting? _settings;
  SalesInvoice? _invoice;
  List<SalesItem> _items = const [];
  List<ItemLabel> _labels = const [];
  Customer? _customer;

  @override
  void initState() {
    super.initState();
    _build();
  }

  Future<void> _build() async {
    try {
      final db = ref.read(databaseProvider);
      final settings = await db.readSettings();
      final inv = await (db.select(db.salesInvoices)
            ..where((t) => t.id.equals(widget.saleId)))
          .getSingle();
      final items = await (db.select(db.salesItems)
            ..where((t) => t.saleId.equals(widget.saleId)))
          .get();
      final customer = await (db.select(db.customers)
            ..where((t) => t.id.equals(inv.customerId)))
          .getSingle();

      // Resolve human labels for each line.
      final labels = <ItemLabel>[];
      for (final it in items) {
        final variant = await (db.select(db.productVariants)
              ..where((t) => t.id.equals(it.variantId)))
            .getSingleOrNull();
        final model = variant == null
            ? null
            : await (db.select(db.productModels)
                  ..where((t) => t.id.equals(variant.modelId)))
                .getSingleOrNull();
        final brand = model == null
            ? null
            : await (db.select(db.brands)
                  ..where((t) => t.id.equals(model.brandId)))
                .getSingleOrNull();
        String imei = '';
        if (it.unitId != null) {
          final unit = await (db.select(db.inventoryUnits)
                ..where((t) => t.id.equals(it.unitId!)))
              .getSingleOrNull();
          imei = unit?.imei1 ?? '';
        }
        final brandName = brand?.name ?? '';
        final modelName = model?.name ?? '';
        // Avoid duplication like "Google Pixel Pixel 7 Pro":
        // if model already starts with brand, use model alone.
        final fullName = modelName.toLowerCase().startsWith(brandName.toLowerCase())
            ? modelName
            : '$brandName $modelName'.trim();
        final title = variant == null
            ? 'Item'
            : CatalogService.variantLabel(variant, fullName);
        labels.add(ItemLabel(title: title, imei: imei));
      }

      final pdf = await InvoicePdf.build(
        settings: settings ??
            ShopSetting(
              id: 0,
              shopName: 'Hassan Mobile Center',
              subtitle: 'Shewa Adda',
              contactNumber: '',
              address: '',
              invoiceFooter: '',
              currency: 'PKR',
              themeMode: 'system',
              invoiceFormat: 'a4',
              lowStockThreshold: 5,
              dateFormat: 'dd/MM/yyyy',
              setupDone: 1,
              whatsappTemplate: '',
            ),
        invoice: inv,
        items: items,
        labels: labels,
        customer: customer,
      );
      if (mounted) {
        setState(() {
          _pdf = pdf;
          _settings = settings;
          _invoice = inv;
          _items = items;
          _labels = labels;
          _customer = customer;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
        actions: [
          if (_pdf != null)
            IconButton(
              icon: const Icon(Icons.print_outlined),
              tooltip: 'Print',
              onPressed: () async =>
                  Printing.layoutPdf(onLayout: (_) => _pdf!),
            ),
          if (_pdf != null)
            IconButton(
              icon: const Icon(Icons.share_outlined),
              tooltip: 'Share PDF',
              onPressed: () async {
                final inv = await (ref
                            .read(databaseProvider)
                            .select(ref
                                .read(databaseProvider)
                                .salesInvoices)
                      ..where((t) => t.id.equals(widget.saleId)))
                    .getSingle();
                await Share.shareXFiles(
                  [XFile.fromData(_pdf!, name: '${inv.invoiceNo}.pdf', mimeType: 'application/pdf')],
                  text: 'Invoice ${inv.invoiceNo}',
                );
              },
            ),
        ],
      ),
      body: _error != null
          ? Center(child: Text('Could not build receipt:\n$_error'))
          : _invoice == null
              ? const LoadingView()
              : _receiptBody(),
    );
  }

  Widget _receiptBody() {
    final settings = _settings;
    final inv = _invoice!;
    final customer = _customer!;
    final shopName = (settings?.shopName ?? '').isEmpty
        ? 'Hassan Mobile Center'
        : settings!.shopName;
    final subtitle = (settings?.subtitle ?? '').isEmpty
        ? 'Shewa Adda'
        : settings!.subtitle;
    final contactLine = [
      if ((settings?.address ?? '').isNotEmpty) settings!.address,
      if ((settings?.contactNumber ?? '').isNotEmpty)
        settings!.contactNumber,
    ].join(' | ');
    final remaining = inv.total - inv.paid;

    return Container(
      color: HmcColors.slateBg,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Shop header.
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: HmcColors.royal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.store,
                          color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(shopName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800)),
                          Text(subtitle,
                              style: const TextStyle(
                                  color: HmcColors.gold600,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
                if (contactLine.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(contactLine,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 12)),
                ],
                const Divider(height: 28),
                _infoRow('Invoice No', inv.invoiceNo),
                _infoRow('Date', PkTime.formatDateTime(inv.saleDate)),
                _infoRow(
                    'Customer',
                    customer.phone.isEmpty
                        ? customer.name
                        : '${customer.name}\n${customer.phone}'),
                const Divider(height: 28),
                // Items table.
                _tableHeader(),
                const Divider(height: 16),
                for (var i = 0; i < _items.length; i++)
                  _itemRow(i),
                const Divider(height: 16),
                // Totals.
                _totalRow('Subtotal', Money.format(inv.total), null),
                _totalRow('Received', Money.format(inv.paid), null),
                _totalRow(
                  'Remaining',
                  Money.format(remaining),
                  remaining > 0 ? HmcColors.danger : HmcColors.success,
                ),
                const Divider(height: 28),
                const Text(
                  'Thank you for shopping with us!',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  shopName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                if ((settings?.invoiceFooter ?? '').isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    settings!.invoiceFooter,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 92,
            child: Text(label,
                style:
                    const TextStyle(color: Colors.grey, fontSize: 13)),
          ),
          Expanded(
            child: Text(value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader() {
    const style = TextStyle(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w700);
    return const Row(
      children: [
        SizedBox(width: 24, child: Text('#', style: style)),
        Expanded(child: Text('Item', style: style)),
        SizedBox(
            width: 40,
            child: Text('Qty', style: style, textAlign: TextAlign.right)),
        SizedBox(
            width: 70,
            child: Text('Price', style: style, textAlign: TextAlign.right)),
        SizedBox(
            width: 78,
            child: Text('Total', style: style, textAlign: TextAlign.right)),
      ],
    );
  }

  Widget _itemRow(int index) {
    final it = _items[index];
    final label = _labels[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Text('${index + 1}',
                style:
                    const TextStyle(color: Colors.grey, fontSize: 13)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label.title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                if (label.imei.isNotEmpty)
                  Text(label.imei,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          SizedBox(
            width: 40,
            child: Text('${it.quantity}',
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 13)),
          ),
          SizedBox(
            width: 70,
            child: Text(Money.format(it.unitPrice),
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 13)),
          ),
          SizedBox(
            width: 78,
            child: Text(Money.format(it.unitPrice * it.quantity),
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  Widget _totalRow(String label, String value, Color? color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(label,
              style:
                  const TextStyle(color: Colors.grey, fontSize: 13)),
          SizedBox(
            width: 110,
            child: Text(value,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: color)),
          ),
        ],
      ),
    );
  }
}
