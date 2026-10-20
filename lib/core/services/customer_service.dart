import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';
import 'accounting.dart' hide PaymentAllocation;

/// Customers, ledgers, payments, credit adjustments.
class CustomerService {
  final AppDatabase db;
  CustomerService(this.db);

  Future<Customer> addCustomer({
    required String name,
    String phone = '',
    String address = '',
    String notes = '',
    int openingBalance = 0,
  }) async {
    final row = CustomersCompanion(
      id: Value(newId()),
      name: Value(name.trim()),
      phone: Value(phone.trim()),
      address: Value(address.trim()),
      notes: Value(notes.trim()),
      openingBalance: Value(openingBalance),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.customers).insert(row);
    return (db.select(db.customers)..where((t) => t.id.equals(row.id.value)))
        .getSingle();
  }

  Stream<List<Customer>> watchCustomers(String query) {
    final q = db.select(db.customers)
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);
    if (query.trim().isNotEmpty) {
      final like = '%${query.trim()}%';
      q.where((t) => t.name.like(like) | t.phone.like(like));
    }
    return q.watch();
  }

  Future<Customer?> getCustomer(String id) =>
      (db.select(db.customers)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> updateCustomer(String id, CustomersCompanion c) =>
      (db.update(db.customers)..where((t) => t.id.equals(id))).write(c);

  /// Records a payment and allocates it FIFO across open invoices.
  /// Returns the unallocated remainder (advance) if any.
  Future<int> receivePayment({
    required String customerId,
    required int amount,
    required int date,
    String method = 'Cash',
    int? dueDate,
    String notes = '',
    String? saleId, // force-allocate to one invoice
  }) =>
      db.transaction(() async {
        if (amount <= 0) throw ArgumentError('Amount must be positive');
        final paymentId = newId();
        final now = PkTime.nowEpochMs();
        await db.into(db.customerPayments).insert(CustomerPaymentsCompanion(
          id: Value(paymentId),
          customerId: Value(customerId),
          saleId: Value(saleId),
          amount: Value(amount),
          date: Value(date),
          method: Value(method),
          dueDate: Value(dueDate),
          notes: Value(notes),
          createdAt: Value(now),
        ));

        final invoices = await (db.select(db.salesInvoices)
              ..where((t) =>
                  t.customerId.equals(customerId) & t.status.equals('final')))
            .get();
        final allocs = invoices.isEmpty
            ? <PaymentAllocation>[]
            : await (db.select(db.paymentAllocations)
                  ..where(
                      (t) => t.saleId.isIn(invoices.map((i) => i.id))))
                .get();
        final allocatedBySale = <String, int>{};
        for (final a in allocs) {
          allocatedBySale[a.saleId] = (allocatedBySale[a.saleId] ?? 0) + a.amount;
        }
        final open = invoices
            .map((i) => OpenInvoice(
                  saleId: i.id,
                  balance: i.total - (allocatedBySale[i.id] ?? 0),
                  saleDate: i.saleDate,
                ))
            .where((o) => o.balance > 0)
            .toList();

        List<OpenInvoice> targets = open;
        if (saleId != null) {
          targets = open.where((o) => o.saleId == saleId).toList();
          if (targets.isEmpty) {
            throw StateError('That invoice has no outstanding balance');
          }
        }
        final result = allocatePayment(amount: amount, openInvoices: targets);
        for (final a in result.allocations) {
          await db.into(db.paymentAllocations).insert(PaymentAllocationsCompanion(
            id: Value(newId()),
            paymentId: Value(paymentId),
            saleId: Value(a.saleId),
            amount: Value(a.amount),
          ));
        }
        return result.remainder;
      });

  /// Outstanding balance computed from ledger entries only.
  Future<int> outstandingBalance(String customerId) async {
    final customer = await getCustomer(customerId);
    if (customer == null) throw StateError('Customer not found');
    final invoices = await (db.select(db.salesInvoices)
          ..where((t) =>
              t.customerId.equals(customerId) & t.status.equals('final')))
        .get();
    final payments = await (db.select(db.customerPayments)
          ..where((t) => t.customerId.equals(customerId)))
        .get();
    final adjustments = await (db.select(db.creditAdjustments)
          ..where((t) => t.customerId.equals(customerId)))
        .get();
    return customerBalance(
      opening: customer.openingBalance,
      // Full invoice totals; every payment (including at-sale ones, which are
      // also stored as CustomerPayments rows) is subtracted exactly once.
      invoiceTotals: invoices.map((i) => i.total),
      payments: payments.map((p) => p.amount),
      adjustments: adjustments.map((a) => a.amount),
    );
  }

  Future<void> addAdjustment({
    required String customerId,
    required int amount,
    required String reason,
    required int date,
  }) =>
      db.into(db.creditAdjustments).insert(CreditAdjustmentsCompanion(
        id: Value(newId()),
        customerId: Value(customerId),
        amount: Value(amount),
        reason: Value(reason.trim()),
        date: Value(date),
        createdAt: Value(PkTime.nowEpochMs()),
      ));

  /// Chronological ledger entries for the customer detail page.
  Future<List<LedgerEntry>> ledger(String customerId) async {
    final customer = await getCustomer(customerId);
    final invoices = await (db.select(db.salesInvoices)
          ..where((t) =>
              t.customerId.equals(customerId))
          ..orderBy([(t) => OrderingTerm.asc(t.saleDate)]))
        .get();
    final payments = await (db.select(db.customerPayments)
          ..where((t) => t.customerId.equals(customerId))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
    final adjustments = await (db.select(db.creditAdjustments)
          ..where((t) => t.customerId.equals(customerId))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();

    final entries = <LedgerEntry>[];
    if (customer != null && customer.openingBalance != 0) {
      entries.add(LedgerEntry(
        date: customer.createdAt,
        reference: 'Opening',
        description: 'Opening balance',
        debit: customer.openingBalance > 0 ? customer.openingBalance : 0,
        credit: customer.openingBalance < 0 ? -customer.openingBalance : 0,
        status: 'posted',
      ));
    }
    for (final i in invoices) {
      entries.add(LedgerEntry(
        date: i.saleDate,
        reference: i.invoiceNo,
        description: 'Sale ${i.invoiceNo}',
        debit: i.total,
        credit: 0,
        status: i.status,
      ));
    }
    for (final p in payments) {
      entries.add(LedgerEntry(
        date: p.date,
        reference: p.saleId == null ? 'Payment' : 'Payment (sale)',
        description: p.notes.isEmpty ? 'Payment received' : p.notes,
        debit: 0,
        credit: p.amount,
        status: 'posted',
      ));
    }
    for (final a in adjustments) {
      entries.add(LedgerEntry(
        date: a.date,
        reference: 'Adjustment',
        description: a.reason,
        debit: a.amount < 0 ? -a.amount : 0,
        credit: a.amount > 0 ? a.amount : 0,
        status: 'posted',
      ));
    }
    entries.sort((a, b) => a.date.compareTo(b.date));
    var running = 0;
    return [
      for (final e in entries)
        e.copyWith(runningBalance: running += e.debit - e.credit),
    ];
  }

  Future<List<Customer>> customersWithDues() async {
    final all = await db.select(db.customers).get();
    final out = <Customer>[];
    for (final c in all) {
      if (await outstandingBalance(c.id) > 0) out.add(c);
    }
    out.sort((a, b) => a.name.compareTo(b.name));
    return out;
  }
}

class LedgerEntry {
  final int date;
  final String reference;
  final String description;
  final int debit;
  final int credit;
  final int runningBalance;
  final String status;

  const LedgerEntry({
    required this.date,
    required this.reference,
    required this.description,
    required this.debit,
    required this.credit,
    this.runningBalance = 0,
    required this.status,
  });

  LedgerEntry copyWith({int? runningBalance}) => LedgerEntry(
        date: date,
        reference: reference,
        description: description,
        debit: debit,
        credit: credit,
        runningBalance: runningBalance ?? this.runningBalance,
        status: status,
      );
}
