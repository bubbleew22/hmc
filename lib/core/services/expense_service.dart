import 'package:drift/drift.dart';

import '../../data/db/app_database.dart';
import '../utils/ids.dart';
import '../utils/time.dart';

/// Operating expenses.
class ExpenseService {
  final AppDatabase db;
  ExpenseService(this.db);

  static const defaultCategories = [
    'Shop rent',
    'Electricity',
    'Staff salary',
    'Transport',
    'Repair',
    'Internet',
    'Miscellaneous',
  ];

  Future<void> seedCategories() async {
    final query = db.selectOnly(db.expenseCategories)
      ..addColumns([db.expenseCategories.id.count()]);
    final row = await query.getSingle();
    if ((row.read(db.expenseCategories.id.count()) ?? 0) > 0) return;
    for (final name in defaultCategories) {
      await db.into(db.expenseCategories).insert(
          ExpenseCategoriesCompanion(id: Value(newId()), name: Value(name)));
    }
  }

  Stream<List<ExpenseCategory>> watchCategories() =>
      (db.select(db.expenseCategories)
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch();

  Future<ExpenseCategory> addCategory(String name) async {
    final row = ExpenseCategoriesCompanion(
        id: Value(newId()), name: Value(name.trim()));
    await db.into(db.expenseCategories).insert(row);
    return (db.select(db.expenseCategories)
          ..where((t) => t.id.equals(row.id.value)))
        .getSingle();
  }

  Future<Expense> addExpense({
    required String categoryId,
    required String description,
    required int date,
    required int amount,
    String method = 'Cash',
    String reference = '',
    String notes = '',
  }) async {
    if (amount <= 0) throw ArgumentError('Amount must be positive');
    final row = ExpensesCompanion(
      id: Value(newId()),
      categoryId: Value(categoryId),
      description: Value(description.trim()),
      date: Value(date),
      amount: Value(amount),
      method: Value(method),
      reference: Value(reference.trim()),
      notes: Value(notes.trim()),
      createdAt: Value(PkTime.nowEpochMs()),
    );
    await db.into(db.expenses).insert(row);
    return (db.select(db.expenses)..where((t) => t.id.equals(row.id.value)))
        .getSingle();
  }

  Stream<List<Expense>> watchExpenses({int? from, int? to}) {
    final q = db.select(db.expenses)
      ..orderBy([(t) => OrderingTerm.desc(t.date)]);
    if (from != null) q.where((t) => t.date.isBiggerOrEqualValue(from));
    if (to != null) q.where((t) => t.date.isSmallerThanValue(to));
    return q.watch();
  }

  Future<void> updateExpense(String id, ExpensesCompanion c) =>
      (db.update(db.expenses)..where((t) => t.id.equals(id))).write(c);
}
