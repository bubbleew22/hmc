/// Pure accounting calculations. No widgets, no database — fully unit tested.
///
/// Money is integer minor units (paisa) everywhere.

/// One line on a sale before it is saved.
class SaleLineInput {
  final int quantity;
  final int unitPriceMinor;
  final int unitCostMinor;

  const SaleLineInput({
    required this.quantity,
    required this.unitPriceMinor,
    required this.unitCostMinor,
  });
}

class SaleTotals {
  final int subtotal;
  final int discount;
  final int tax;
  final int total;
  final int paid;
  final int balance;
  final int cogs;

  const SaleTotals({
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.total,
    required this.paid,
    required this.balance,
    required this.cogs,
  });
}

/// Computes sale totals. Throws [ArgumentError] on invalid input.
SaleTotals calcSaleTotals({
  required List<SaleLineInput> lines,
  required int discount,
  required int tax,
  required int paid,
}) {
  if (lines.isEmpty) throw ArgumentError('Sale must have at least one item');
  if (discount < 0) throw ArgumentError('Discount cannot be negative');
  if (tax < 0) throw ArgumentError('Tax cannot be negative');
  if (paid < 0) throw ArgumentError('Paid amount cannot be negative');

  var subtotal = 0;
  var cogs = 0;
  for (final l in lines) {
    if (l.quantity <= 0) throw ArgumentError('Quantity must be positive');
    if (l.unitPriceMinor < 0) throw ArgumentError('Price cannot be negative');
    subtotal += l.quantity * l.unitPriceMinor;
    cogs += l.quantity * l.unitCostMinor;
  }
  if (discount > subtotal) {
    throw ArgumentError('Discount cannot exceed subtotal');
  }
  final total = subtotal - discount + tax;
  if (paid > total) {
    throw ArgumentError(
        'Paid amount exceeds invoice total — use an advance workflow instead');
  }
  return SaleTotals(
    subtotal: subtotal,
    discount: discount,
    tax: tax,
    total: total,
    paid: paid,
    balance: total - paid,
    cogs: cogs,
  );
}

/// Customer outstanding balance derived from ledger entries only:
/// opening + invoices − payments − credit adjustments(negative reduces).
int customerBalance({
  required int opening,
  required Iterable<int> invoiceTotals,
  required Iterable<int> payments,
  required Iterable<int> adjustments,
}) {
  var b = opening;
  for (final t in invoiceTotals) {
    b += t;
  }
  for (final p in payments) {
    b -= p;
  }
  for (final a in adjustments) {
    b -= a;
  }
  return b;
}

class OpenInvoice {
  final String saleId;
  final int balance; // total − allocated so far, minor units
  final int saleDate;

  const OpenInvoice({
    required this.saleId,
    required this.balance,
    required this.saleDate,
  });
}

class PaymentAllocation {
  final String saleId;
  final int amount;

  const PaymentAllocation(this.saleId, this.amount);
}

/// Allocate a payment across open invoices, oldest first (FIFO).
/// Returns allocations; any remainder is an unallocated advance.
({List<PaymentAllocation> allocations, int remainder}) allocatePayment({
  required int amount,
  required List<OpenInvoice> openInvoices,
}) {
  if (amount < 0) throw ArgumentError('Payment amount cannot be negative');
  final sorted = [...openInvoices]..sort((a, b) => a.saleDate.compareTo(b.saleDate));
  final out = <PaymentAllocation>[];
  var rest = amount;
  for (final inv in sorted) {
    if (rest <= 0) break;
    if (inv.balance <= 0) continue;
    final take = rest < inv.balance ? rest : inv.balance;
    out.add(PaymentAllocation(inv.saleId, take));
    rest -= take;
  }
  return (allocations: out, remainder: rest);
}

/// Profit statement inputs → net profit. All minor units.
class ProfitStatement {
  final int salesRevenue;
  final int salesReturns;
  final int discounts;
  final int cogs;
  final int expenses;

  const ProfitStatement({
    required this.salesRevenue,
    required this.salesReturns,
    required this.discounts,
    required this.cogs,
    required this.expenses,
  });

  int get netSales => salesRevenue - salesReturns - discounts;
  int get grossProfit => netSales - cogs;
  int get netProfit => grossProfit - expenses;
}
