import 'dart:typed_data';
import 'package:drift/drift.dart' hide Column;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/pdf/invoice_pdf.dart';
import '../../core/providers.dart';
import '../../core/services/catalog_service.dart';
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
        final title = variant == null
            ? 'Item'
            : CatalogService.variantLabel(
                variant, '${brand?.name ?? ''} ${model?.name ?? ''}'.trim());
        labels.add(ItemLabel(title: title, imei: imei));
      }

      final pdf = await InvoicePdf.build(
        settings: settings ??
            ShopSetting(
              id: 0,
              shopName: 'Hasan Mobile Center',
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
      if (mounted) setState(() => _pdf = pdf);
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
          : _pdf == null
              ? const LoadingView()
              : PdfPreview(
                  build: (_) => _pdf!,
                  canChangePageFormat: false,
                  canChangeOrientation: false,
                  canDebug: false,
                ),
    );
  }
}
