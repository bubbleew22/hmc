import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/pdf/invoice_pdf.dart';
import '../../core/providers.dart';
import '../../core/services/customer_service.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/money.dart';
import '../../core/utils/time.dart';
import '../../data/db/app_database.dart';
import '../../widgets/common.dart';

class CustomerLedgerScreen extends ConsumerStatefulWidget {
  final String customerId;
  const CustomerLedgerScreen({super.key, required this.customerId});

  @override
  ConsumerState<CustomerLedgerScreen> createState() =>
      _CustomerLedgerScreenState();
}

class _CustomerLedgerScreenState
    extends ConsumerState<CustomerLedgerScreen> {
  int _tab = 0; // 0 = Transactions, 1 = Receipts
  late Future<List<dynamic>> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<List<dynamic>> _load() {
    final svc = ref.read(customerServiceProvider);
    final db = ref.read(databaseProvider);
    return Future.wait([
      svc.getCustomer(widget.customerId),
      svc.ledger(widget.customerId),
      svc.outstandingBalance(widget.customerId),
      (db.select(db.salesInvoices)
            ..where((t) => t.customerId.equals(widget.customerId)))
          .get(),
    ]);
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  Widget _pill(String label, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: fg),
        ),
      );

  /// Paid-state badge for a sale entry, resolved from the invoice row.
  Widget _saleBadge(LedgerEntry e, SalesInvoice? inv) {
    if (inv == null) return const SizedBox.shrink();
    if (e.status == 'cancelled') {
      return _pill('Cancelled', HmcColors.slateBg, HmcColors.slate);
    }
    if (inv.paid >= inv.total) {
      return _pill('Paid', HmcColors.successBg, HmcColors.success);
    }
    if (inv.paid > 0) {
      return _pill('Partial', HmcColors.warningBg, HmcColors.warning);
    }
    return _pill('Due', HmcColors.dangerBg, HmcColors.danger);
  }

  Widget _headerCard(
      Customer customer, int totalPurchases, int totalPaid, int remaining) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: HmcColors.royal,
                  child: Text(
                    _initials(customer.name),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(customer.name,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 2),
                      Text(customer.phone,
                          style: const TextStyle(
                              color: HmcColors.slate, fontSize: 13)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Remaining',
                        style: TextStyle(
                            color: HmcColors.slate, fontSize: 12)),
                    const SizedBox(height: 2),
                    MoneyText(remaining,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: HmcColors.danger)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: _stat('Total Purchases', totalPurchases)),
                Expanded(child: _stat('Total Paid', totalPaid)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String label, int minor) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(color: HmcColors.slate, fontSize: 12)),
          const SizedBox(height: 2),
          MoneyText(minor,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w800)),
        ],
      );

  Widget _tabBar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(child: _tabButton('Transactions', 0)),
          Expanded(child: _tabButton('Receipts', 1)),
        ],
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final selected = _tab == index;
    return InkWell(
      onTap: () => setState(() => _tab = index),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? HmcColors.blue600 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: selected ? Colors.white : HmcColors.slate,
          ),
        ),
      ),
    );
  }

  Widget _saleRow(LedgerEntry e, SalesInvoice? inv) {
    final saleId = inv?.id;
    final isPartial = inv != null &&
        e.status != 'cancelled' &&
        inv.paid > 0 &&
        inv.paid < inv.total;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: saleId == null ? null : () => context.push('/sale/$saleId'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: HmcColors.blue600.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.receipt_outlined,
                    color: HmcColors.blue600, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(PkTime.formatDate(e.date),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13)),
                    const SizedBox(height: 2),
                    Text(e.description,
                        style: const TextStyle(
                            color: HmcColors.slate, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MoneyText(e.debit,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  _saleBadge(e, inv),
                  if (isPartial)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'Paid ${Money.format(inv.paid, withSymbol: false)}',
                        style: const TextStyle(
                            fontSize: 11, color: HmcColors.slate),
                      ),
                    ),
                ],
              ),
              if (saleId != null)
                const Icon(Icons.chevron_right, color: HmcColors.slate),
            ],
          ),
        ),
      ),
    );
  }

  Widget _receiptRow(LedgerEntry e) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: HmcColors.success.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.payments_outlined,
                  color: HmcColors.success, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(PkTime.formatDate(e.date),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(e.description,
                      style: const TextStyle(
                          color: HmcColors.slate, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MoneyText(e.credit,
                    style:
                        const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                _pill('Paid', HmcColors.successBg, HmcColors.success),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Ledger'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf_outlined),
            tooltip: 'Export PDF',
            onPressed: () => _exportPdf(),
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Share statement',
            onPressed: () => _shareStatement(),
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _future,
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final customer = snap.data![0] as Customer?;
          final entries = snap.data![1] as List<LedgerEntry>;
          final remaining = snap.data![2] as int;
          final invoices = snap.data![3] as List<SalesInvoice>;
          if (customer == null) {
            return const Center(child: Text('Customer not found'));
          }
          if (entries.isEmpty) {
            return const EmptyState(
              icon: Icons.receipt_long_outlined,
              title: 'No transactions',
              subtitle: 'Ledger entries will appear here.',
            );
          }
          final invoiceByNo = {
            for (final i in invoices) i.invoiceNo: i
          };
          final totalPurchases =
              entries.fold<int>(0, (s, e) => s + e.debit);
          final totalPaid =
              entries.fold<int>(0, (s, e) => s + e.credit);
          final sales = entries
              .where((e) => e.debit > 0)
              .toList()
              .reversed
              .toList();
          final receipts = entries
              .where((e) => e.credit > 0)
              .toList()
              .reversed
              .toList();
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _headerCard(
                  customer, totalPurchases, totalPaid, remaining),
              const SizedBox(height: 12),
              _tabBar(),
              const SizedBox(height: 8),
              if (_tab == 0)
                if (sales.isEmpty)
                  const EmptyState(
                    icon: Icons.receipt_long_outlined,
                    title: 'No sales',
                    subtitle: 'Sales will appear here.',
                  )
                else
                  for (final e in sales)
                    _saleRow(e, invoiceByNo[e.reference]),
              if (_tab == 1)
                if (receipts.isEmpty)
                  const EmptyState(
                    icon: Icons.payments_outlined,
                    title: 'No receipts',
                    subtitle: 'Payments received will appear here.',
                  )
                else
                  for (final e in receipts) _receiptRow(e),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }

  Future<void> _exportPdf() async {
    try {
      final svc = ref.read(customerServiceProvider);
      final customer = await svc.getCustomer(widget.customerId);
      final entries = await svc.ledger(widget.customerId);
      if (customer == null) return;
      final pdf = await _ledgerPdf(customer, entries);
      await Printing.layoutPdf(onLayout: (_) => pdf);
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }

  Future<void> _shareStatement() async {
    try {
      final svc = ref.read(customerServiceProvider);
      final customer = await svc.getCustomer(widget.customerId);
      final entries = await svc.ledger(widget.customerId);
      if (customer == null) return;
      final buf = StringBuffer()
        ..writeln('Statement — ${customer.name}')
        ..writeln('Date | Ref | Debit | Credit | Balance');
      for (final e in entries) {
        buf.writeln(
            '${PkTime.formatDate(e.date)} | ${e.reference} | ${Money.format(e.debit, withSymbol: false)} | ${Money.format(e.credit, withSymbol: false)} | ${Money.format(e.runningBalance, withSymbol: false)}');
      }
      await Share.share(buf.toString(),
          subject: 'Statement — ${customer.name}');
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    }
  }

  // Reuse the invoice pdf helpers via a small local builder.
  Future<Uint8List> _ledgerPdf(
      Customer customer, List<LedgerEntry> entries) async {
    // Built with the shared pdf package directly for a clean table.
    final doc = await buildLedgerPdf(customer, entries);
    return doc;
  }
}
