import '../../data/db/app_database.dart';
import 'package:drift/drift.dart';
import '../services/accounting.dart';
import '../utils/time.dart';

/// Dashboard metrics and reports — always computed from saved records.
class ReportService {
  final AppDatabase db;
  ReportService(this.db);

  Future<DashboardMetrics> dashboard({int? from, int? to}) async {
    final (dayStart, dayEnd) = PkTime.todayRange();
    final f = from ?? dayStart;
    final t = to ?? dayEnd;

    final sales = await (db.select(db.salesInvoices)
          ..where((tbl) =>
              tbl.saleDate.isBiggerOrEqualValue(f) &
              tbl.saleDate.isSmallerThanValue(t) &
              tbl.status.equals('final')))
        .get();
    final items = await (db.select(db.salesItems)
          ..where((tbl) => tbl.saleId.isIn(sales.map((s) => s.id))))
        .get();
    final payments = await (db.select(db.customerPayments)
          ..where((tbl) =>
              tbl.date.isBiggerOrEqualValue(f) &
              tbl.date.isSmallerThanValue(t)))
        .get();
    final purchases = await (db.select(db.purchaseInvoices)
          ..where((tbl) =>
              tbl.purchaseDate.isBiggerOrEqualValue(f) &
              tbl.purchaseDate.isSmallerThanValue(t)))
        .get();
    final expenses = await (db.select(db.expenses)
          ..where((tbl) =>
              tbl.date.isBiggerOrEqualValue(f) &
              tbl.date.isSmallerThanValue(t)))
        .get();

    final revenue = sales.fold<int>(0, (s, i) => s + i.total);
    final discounts = sales.fold<int>(0, (s, i) => s + i.discount);
    final cogs = items.fold<int>(0, (s, i) => s + i.unitCost * i.quantity);
    final expenseTotal = expenses.fold<int>(0, (s, e) => s + e.amount);
    final profit = ProfitStatement(
      salesRevenue: revenue,
      salesReturns: 0,
      discounts: discounts,
      cogs: cogs,
      expenses: expenseTotal,
    );

    final units = await db.select(db.inventoryUnits).get();
    final batches = await db.select(db.stockBatches).get();
    var availableQty = 0, purchaseValue = 0, retailValue = 0;
    for (final u in units) {
      if (u.status == 'available') {
        availableQty++;
        purchaseValue += u.purchasePrice;
        retailValue += u.salePrice;
      }
    }
    for (final b in batches) {
      availableQty += b.quantity;
      purchaseValue += b.quantity * b.purchasePrice;
    }

    // Pending customer payments (all time, not just the range).
    final allSales = await (db.select(db.salesInvoices)
          ..where((tbl) => tbl.status.equals('final')))
        .get();
    final allPayments =
        await db.select(db.customerPayments).get();
    final allInvoices = allSales.fold<int>(0, (s, i) => s + i.total);
    final allCollected = allPayments.fold<int>(0, (s, p) => s + p.amount);
    final pendingReceivables = allInvoices - allCollected;

    final allPurchases = await db.select(db.purchaseInvoices).get();
    final allSupPayments = await db.select(db.supplierPayments).get();
    final payables = allPurchases.fold<int>(0, (s, i) => s + i.total) -
        allSupPayments.fold<int>(0, (s, p) => s + p.amount);

    final dispatched = units.where((u) => u.status == 'dispatched').length;

    final recentSales = await (db.select(db.salesInvoices)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.saleDate)])
          ..limit(10))
        .get();

    return DashboardMetrics(
      salesRevenue: revenue,
      paymentsReceived: payments.fold<int>(0, (s, p) => s + p.amount),
      purchases: purchases.fold<int>(0, (s, p) => s + p.total),
      grossProfit: profit.grossProfit,
      netProfit: profit.netProfit,
      availableQty: availableQty,
      stockPurchaseValue: purchaseValue,
      stockRetailValue: retailValue,
      pendingReceivables: pendingReceivables,
      supplierPayables: payables,
      dispatchedQty: dispatched,
      recentSales: recentSales,
    );
  }

  /// Daily sales totals for a date range (bar chart data).
  Future<List<DailyPoint>> dailySales(int from, int to) async {
    final sales = await (db.select(db.salesInvoices)
          ..where((tbl) =>
              tbl.saleDate.isBiggerOrEqualValue(from) &
              tbl.saleDate.isSmallerThanValue(to) &
              tbl.status.equals('final')))
        .get();
    final byDay = <int, int>{};
    for (final s in sales) {
      final day = DateTime.fromMillisecondsSinceEpoch(s.saleDate, isUtc: true)
          .toUtc()
          .add(const Duration(hours: 5));
      final key = DateTime(day.year, day.month, day.day).millisecondsSinceEpoch;
      byDay[key] = (byDay[key] ?? 0) + s.total;
    }
    final days = byDay.keys.toList()..sort();
    return [for (final d in days) DailyPoint(day: d, total: byDay[d]!)];
  }

  /// Brand-wise sales revenue in a range.
  Future<List<BrandPoint>> brandSales(int from, int to) async {
    final sales = await (db.select(db.salesInvoices)
          ..where((tbl) =>
              tbl.saleDate.isBiggerOrEqualValue(from) &
              tbl.saleDate.isSmallerThanValue(to) &
              tbl.status.equals('final')))
        .get();
    if (sales.isEmpty) return [];
    final items = await (db.select(db.salesItems)
          ..where((tbl) => tbl.saleId.isIn(sales.map((s) => s.id))))
        .get();
    final variants = await db.select(db.productVariants).get();
    final models = await db.select(db.productModels).get();
    final brands = await db.select(db.brands).get();
    final variantById = {for (final v in variants) v.id: v};
    final modelById = {for (final m in models) m.id: m};
    final brandById = {for (final b in brands) b.id: b};
    final totals = <String, int>{};
    for (final it in items) {
      final v = variantById[it.variantId];
      final m = v == null ? null : modelById[v.modelId];
      final b = m == null ? null : brandById[m.brandId];
      final name = b?.name ?? 'Unknown';
      totals[name] = (totals[name] ?? 0) + it.unitPrice * it.quantity;
    }
    final points = [
      for (final e in totals.entries) BrandPoint(brand: e.key, total: e.value)
    ]..sort((a, b) => b.total.compareTo(a.total));
    return points;
  }

  /// Payment method breakdown in a range.
  Future<List<BrandPoint>> paymentsByMethod(int from, int to) async {
    final payments = await (db.select(db.customerPayments)
          ..where((tbl) =>
              tbl.date.isBiggerOrEqualValue(from) &
              tbl.date.isSmallerThanValue(to)))
        .get();
    final totals = <String, int>{};
    for (final p in payments) {
      totals[p.method] = (totals[p.method] ?? 0) + p.amount;
    }
    return [
      for (final e in totals.entries) BrandPoint(brand: e.key, total: e.value)
    ]..sort((a, b) => b.total.compareTo(a.total));
  }

  /// Top-selling models in a range.
  Future<List<BrandPoint>> topModels(int from, int to, {int limit = 10}) async {
    final sales = await (db.select(db.salesInvoices)
          ..where((tbl) =>
              tbl.saleDate.isBiggerOrEqualValue(from) &
              tbl.saleDate.isSmallerThanValue(to) &
              tbl.status.equals('final')))
        .get();
    if (sales.isEmpty) return [];
    final items = await (db.select(db.salesItems)
          ..where((tbl) => tbl.saleId.isIn(sales.map((s) => s.id))))
        .get();
    final variants = await db.select(db.productVariants).get();
    final models = await db.select(db.productModels).get();
    final variantById = {for (final v in variants) v.id: v};
    final modelById = {for (final m in models) m.id: m};
    final qty = <String, int>{};
    for (final it in items) {
      final v = variantById[it.variantId];
      final m = v == null ? null : modelById[v.modelId];
      final name = m?.name ?? 'Unknown';
      qty[name] = (qty[name] ?? 0) + it.quantity;
    }
    final points = [
      for (final e in qty.entries) BrandPoint(brand: e.key, total: e.value)
    ]..sort((a, b) => b.total.compareTo(a.total));
    return points.take(limit).toList();
  }

  Future<ProfitStatement> profitStatement(int from, int to) async {
    final sales = await (db.select(db.salesInvoices)
          ..where((tbl) =>
              tbl.saleDate.isBiggerOrEqualValue(from) &
              tbl.saleDate.isSmallerThanValue(to) &
              tbl.status.equals('final')))
        .get();
    final items = await (db.select(db.salesItems)
          ..where((tbl) => tbl.saleId.isIn(sales.map((s) => s.id))))
        .get();
    final expenses = await (db.select(db.expenses)
          ..where((tbl) =>
              tbl.date.isBiggerOrEqualValue(from) &
              tbl.date.isSmallerThanValue(to)))
        .get();
    final returns = await (db.select(db.productReturns)
          ..where((tbl) =>
              tbl.date.isBiggerOrEqualValue(from) &
              tbl.date.isSmallerThanValue(to)))
        .get();
    return ProfitStatement(
      salesRevenue: sales.fold<int>(0, (s, i) => s + i.total),
      salesReturns: returns.fold<int>(0, (s, r) => s + r.refundAmount),
      discounts: sales.fold<int>(0, (s, i) => s + i.discount),
      cogs: items.fold<int>(0, (s, i) => s + i.unitCost * i.quantity),
      expenses: expenses.fold<int>(0, (s, e) => s + e.amount),
    );
  }
}

class DashboardMetrics {
  final int salesRevenue;
  final int paymentsReceived;
  final int purchases;
  final int grossProfit;
  final int netProfit;
  final int availableQty;
  final int stockPurchaseValue;
  final int stockRetailValue;
  final int pendingReceivables;
  final int supplierPayables;
  final int dispatchedQty;
  final List<SalesInvoice> recentSales;

  const DashboardMetrics({
    required this.salesRevenue,
    required this.paymentsReceived,
    required this.purchases,
    required this.grossProfit,
    required this.netProfit,
    required this.availableQty,
    required this.stockPurchaseValue,
    required this.stockRetailValue,
    required this.pendingReceivables,
    required this.supplierPayables,
    required this.dispatchedQty,
    required this.recentSales,
  });
}

class DailyPoint {
  final int day;
  final int total;
  const DailyPoint({required this.day, required this.total});
}

class BrandPoint {
  final String brand;
  final int total;
  const BrandPoint({required this.brand, required this.total});
}
