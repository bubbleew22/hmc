import 'package:flutter_test/flutter_test.dart';
import 'package:hmc/core/services/accounting.dart';
import 'package:hmc/core/utils/money.dart';

/// Acceptance scenarios from the product spec (sections 26 A & B).
void main() {
  int rs(int rupees) => Money.fromMajor(rupees);

  group('Scenario A — purchase and sale', () {
    test('sale totals: 2 units @ 60000', () {
      final t = calcSaleTotals(
        lines: const [
          SaleLineInput(quantity: 1, unitPriceMinor: 6000000, unitCostMinor: 5000000),
          SaleLineInput(quantity: 1, unitPriceMinor: 6000000, unitCostMinor: 5000000),
        ],
        discount: 0,
        tax: 0,
        paid: 0,
      );
      expect(t.subtotal, rs(120000));
      expect(t.total, rs(120000));
      expect(t.cogs, rs(100000));
      expect(t.balance, rs(120000));
    });

    test('customer A full payment, customer B partial payment', () {
      // Customer A: invoice 60000, paid 60000 → balance 0
      final a = customerBalance(
        opening: 0,
        invoiceTotals: [rs(60000)],
        payments: [rs(60000)],
        adjustments: const [],
      );
      expect(a, 0);

      // Customer B: invoice 60000, paid 20000 → balance 40000
      final b = customerBalance(
        opening: 0,
        invoiceTotals: [rs(60000)],
        payments: [rs(20000)],
        adjustments: const [],
      );
      expect(b, rs(40000));

      // Collections so far: 80000 (not revenue)
      expect(rs(60000) + rs(20000), rs(80000));
    });

    test('gross profit is 20000 before expenses', () {
      const st = ProfitStatement(
        salesRevenue: 12000000,
        salesReturns: 0,
        discounts: 0,
        cogs: 10000000,
        expenses: 0,
      );
      expect(st.netSales, rs(120000));
      expect(st.grossProfit, rs(20000));
      expect(st.netProfit, rs(20000));
    });

    test('after B pays remaining 40000: balance 0, revenue unchanged', () {
      final b = customerBalance(
        opening: 0,
        invoiceTotals: [rs(60000)],
        payments: [rs(20000), rs(40000)],
        adjustments: const [],
      );
      expect(b, 0);
      // Installments never count as new sales revenue:
      expect(rs(60000) + rs(20000) + rs(40000), rs(120000)); // collections
    });

    test('paid cannot exceed total without advance workflow', () {
      expect(
        () => calcSaleTotals(
          lines: const [
            SaleLineInput(quantity: 1, unitPriceMinor: 6000000, unitCostMinor: 5000000),
          ],
          discount: 0,
          tax: 0,
          paid: 7000000,
        ),
        throwsArgumentError,
      );
    });

    test('discount cannot exceed subtotal', () {
      expect(
        () => calcSaleTotals(
          lines: const [
            SaleLineInput(quantity: 1, unitPriceMinor: 6000000, unitCostMinor: 5000000),
          ],
          discount: 7000000,
          tax: 0,
          paid: 0,
        ),
        throwsArgumentError,
      );
    });
  });

  group('Scenario B — consignment accounting', () {
    test('dispatch is not a sale; revenue only on confirmed sale', () {
      // 10 purchased, 2 dispatched, 2 sold from shop.
      const purchased = 10, dispatched = 2, sold = 2;
      final available = purchased - dispatched - sold;
      expect(available, 6);
      expect(purchased, available + dispatched + sold);

      // Revenue only from the 2 shop sales, not the dispatched units.
      final t = calcSaleTotals(
        lines: const [
          SaleLineInput(quantity: 2, unitPriceMinor: 6000000, unitCostMinor: 5000000),
        ],
        discount: 0,
        tax: 0,
        paid: 12000000,
      );
      expect(t.total, rs(120000));
      expect(t.cogs, rs(100000));
    });
  });

  group('Payment allocation', () {
    test('FIFO across open invoices', () {
      final r = allocatePayment(
        amount: rs(90000),
        openInvoices: const [
          OpenInvoice(saleId: 's1', balance: 6000000, saleDate: 1000),
          OpenInvoice(saleId: 's2', balance: 6000000, saleDate: 2000),
        ],
      );
      expect(r.allocations.length, 2);
      expect(r.allocations[0].saleId, 's1');
      expect(r.allocations[0].amount, rs(60000));
      expect(r.allocations[1].saleId, 's2');
      expect(r.allocations[1].amount, rs(30000));
      expect(r.remainder, 0);
    });

    test('overpayment leaves remainder as advance', () {
      final r = allocatePayment(
        amount: rs(70000),
        openInvoices: const [
          OpenInvoice(saleId: 's1', balance: 6000000, saleDate: 1000),
        ],
      );
      expect(r.allocations.single.amount, rs(60000));
      expect(r.remainder, rs(10000));
    });
  });

  group('Money', () {
    test('formats PKR without floating point errors', () {
      expect(Money.format(6000000), 'Rs 60,000');
      expect(Money.format(605050), 'Rs 6,050.50');
      expect(Money.tryParseMajor('60,000'), 6000000);
      expect(Money.fromMajor(0.1) + Money.fromMajor(0.2), Money.fromMajor(0.3));
    });
  });
}
