import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/pdf/invoice_pdf.dart';
import '../../core/providers.dart';
import '../../core/services/customer_service.dart';
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
  @override
  Widget build(BuildContext context) {
    final svc = ref.watch(customerServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer ledger'),
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
      body: FutureBuilder(
        future: Future.wait([
          svc.getCustomer(widget.customerId),
          svc.ledger(widget.customerId),
        ]),
        builder: (ctx, snap) {
          if (!snap.hasData) return const LoadingView();
          final customer = snap.data![0] as Customer?;
          final entries = snap.data![1] as List<LedgerEntry>;
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
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Reference')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('Debit'), numeric: true),
                  DataColumn(label: Text('Credit'), numeric: true),
                  DataColumn(label: Text('Balance'), numeric: true),
                ],
                rows: [
                  for (final e in entries)
                    DataRow(cells: [
                      DataCell(Text(PkTime.formatDate(e.date))),
                      DataCell(Text(e.reference)),
                      DataCell(SizedBox(
                          width: 160,
                          child: Text(e.description,
                              overflow: TextOverflow.ellipsis))),
                      DataCell(Text(e.debit == 0
                          ? '-'
                          : Money.format(e.debit, withSymbol: false))),
                      DataCell(Text(e.credit == 0
                          ? '-'
                          : Money.format(e.credit, withSymbol: false))),
                      DataCell(Text(
                        Money.format(e.runningBalance,
                            withSymbol: false),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: e.runningBalance > 0
                                ? Colors.red
                                : Colors.green),
                      )),
                    ]),
                ],
              ),
            ),
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
