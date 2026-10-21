import 'package:drift/drift.dart';

/// All money columns are integer minor units (paisa).
/// All timestamps are UTC epoch millis.
/// All ids are UUID v4 strings (except auto-increment audit/backup rows).

// ── Shop & app ──────────────────────────────────────────────

class ShopSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get shopName =>
      text().withDefault(const Constant('Hassan Mobile Center'))();
  TextColumn get subtitle => text().withDefault(const Constant('Shewa Adda'))();
  TextColumn get contactNumber => text().withDefault(const Constant(''))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get invoiceFooter => text().withDefault(const Constant(''))();
  TextColumn get currency => text().withDefault(const Constant('PKR'))();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  TextColumn get invoiceFormat => text().withDefault(const Constant('a4'))();
  IntColumn get lowStockThreshold => integer().withDefault(const Constant(5))();
  TextColumn get dateFormat =>
      text().withDefault(const Constant('dd/MM/yyyy'))();
  IntColumn get setupDone => integer().withDefault(const Constant(0))();
  TextColumn get whatsappTemplate => text().withDefault(const Constant(''))();
}

class AppMetadata extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  @override
  Set<Column> get primaryKey => {key};
}

// ── Users, roles, audit ─────────────────────────────────────

class LocalUsers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get pinHash => text()();
  TextColumn get pinSalt => text()();
  /// admin | operator | viewer
  TextColumn get role => text()();
  IntColumn get isActive => integer().withDefault(const Constant(1))();
  IntColumn get useBiometrics => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().nullable()();
  TextColumn get action => text()();
  TextColumn get entityType => text().nullable()();
  TextColumn get entityId => text().nullable()();
  TextColumn get details => text().nullable()();
  IntColumn get createdAt => integer()();
}

// ── Catalogue: brands, models, variants ─────────────────────

class Brands extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().unique()();
  IntColumn get isArchived => integer().withDefault(const Constant(0))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class ProductModels extends Table {
  TextColumn get id => text()();
  TextColumn get brandId => text().references(Brands, #id)();
  TextColumn get name => text()();
  TextColumn get photoPath => text().nullable()();
  IntColumn get isArchived => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class ProductVariants extends Table {
  TextColumn get id => text()();
  TextColumn get modelId => text().references(ProductModels, #id)();
  TextColumn get ram => text().withDefault(const Constant(''))();
  TextColumn get storage => text().withDefault(const Constant(''))();
  TextColumn get color => text().withDefault(const Constant(''))();
  /// New | Used | Refurbished
  TextColumn get condition => text().withDefault(const Constant('New'))();
  @override
  Set<Column> get primaryKey => {id};
}

// ── Inventory ───────────────────────────────────────────────

class Suppliers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get phone => text().withDefault(const Constant(''))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

/// Serialized physical phone.
/// status: available | reserved | dispatched | sold | returned | damaged
class InventoryUnits extends Table {
  TextColumn get id => text()();
  TextColumn get variantId => text().references(ProductVariants, #id)();
  TextColumn get imei1 => text().nullable().unique()();
  TextColumn get imei2 => text().nullable()();
  TextColumn get serial => text().nullable()();
  TextColumn get ptaStatus => text().withDefault(const Constant('Approved'))();
  IntColumn get purchasePrice => integer()();
  IntColumn get salePrice => integer()();
  TextColumn get supplierId => text().nullable().references(Suppliers, #id)();
  IntColumn get purchaseDate => integer().nullable()();
  TextColumn get warranty => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  TextColumn get photoPath => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('available'))();
  TextColumn get batchId => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

/// Quantity-based batches for non-serialized products/accessories.
class StockBatches extends Table {
  TextColumn get id => text()();
  TextColumn get variantId => text().references(ProductVariants, #id)();
  IntColumn get quantity => integer()();
  IntColumn get purchasePrice => integer()();
  TextColumn get supplierId => text().nullable().references(Suppliers, #id)();
  IntColumn get purchaseDate => integer().nullable()();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class StockMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get unitId => text().nullable()();
  TextColumn get batchId => text().nullable()();
  IntColumn get quantityDelta => integer()();
  TextColumn get fromStatus => text().nullable()();
  TextColumn get toStatus => text()();
  TextColumn get reason => text()();
  TextColumn get refType => text().nullable()();
  TextColumn get refId => text().nullable()();
  TextColumn get userId => text().nullable()();
  IntColumn get createdAt => integer()();
}

// ── Purchases ───────────────────────────────────────────────

class PurchaseInvoices extends Table {
  TextColumn get id => text()();
  TextColumn get refNo => text().unique()();
  TextColumn get supplierId => text().references(Suppliers, #id)();
  TextColumn get userId => text().nullable()();
  IntColumn get purchaseDate => integer()();
  IntColumn get subtotal => integer()();
  IntColumn get discount => integer().withDefault(const Constant(0))();
  IntColumn get expenses => integer().withDefault(const Constant(0))();
  IntColumn get total => integer()();
  IntColumn get paid => integer().withDefault(const Constant(0))();
  TextColumn get paymentMethod => text().withDefault(const Constant('Cash'))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class PurchaseItems extends Table {
  TextColumn get id => text()();
  TextColumn get purchaseId => text().references(PurchaseInvoices, #id)();
  TextColumn get variantId => text().references(ProductVariants, #id)();
  TextColumn get unitId => text().nullable()();
  TextColumn get batchId => text().nullable()();
  IntColumn get quantity => integer()();
  IntColumn get unitCost => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class SupplierPayments extends Table {
  TextColumn get id => text()();
  TextColumn get supplierId => text().references(Suppliers, #id)();
  TextColumn get purchaseId => text().nullable().references(PurchaseInvoices, #id)();
  IntColumn get amount => integer()();
  IntColumn get date => integer()();
  TextColumn get method => text().withDefault(const Constant('Cash'))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

// ── Customers & sales ───────────────────────────────────────

class Customers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get phone => text().withDefault(const Constant(''))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get openingBalance => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class SalesInvoices extends Table {
  TextColumn get id => text()();
  TextColumn get invoiceNo => text().unique()();
  IntColumn get saleDate => integer()();
  TextColumn get customerId => text().references(Customers, #id)();
  IntColumn get subtotal => integer()();
  IntColumn get discount => integer().withDefault(const Constant(0))();
  IntColumn get tax => integer().withDefault(const Constant(0))();
  IntColumn get total => integer()();
  IntColumn get paid => integer().withDefault(const Constant(0))();
  /// full | partial | credit
  TextColumn get paymentType => text()();
  TextColumn get paymentMethod => text().withDefault(const Constant('Cash'))();
  /// final | cancelled | returned
  TextColumn get status => text().withDefault(const Constant('final'))();
  TextColumn get idempotencyKey => text().unique()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  TextColumn get warranty => text().withDefault(const Constant(''))();
  TextColumn get userId => text().nullable()();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class SalesItems extends Table {
  TextColumn get id => text()();
  TextColumn get saleId => text().references(SalesInvoices, #id)();
  TextColumn get variantId => text().references(ProductVariants, #id)();
  TextColumn get unitId => text().nullable()();
  TextColumn get batchId => text().nullable()();
  IntColumn get quantity => integer()();
  IntColumn get unitPrice => integer()();
  /// Acquisition cost captured at sale time (COGS basis).
  IntColumn get unitCost => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class CustomerPayments extends Table {
  TextColumn get id => text()();
  TextColumn get customerId => text().references(Customers, #id)();
  TextColumn get saleId => text().nullable().references(SalesInvoices, #id)();
  IntColumn get amount => integer()();
  IntColumn get date => integer()();
  TextColumn get method => text().withDefault(const Constant('Cash'))();
  IntColumn get dueDate => integer().nullable()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class PaymentAllocations extends Table {
  TextColumn get id => text()();
  TextColumn get paymentId => text().references(CustomerPayments, #id)();
  TextColumn get saleId => text().references(SalesInvoices, #id)();
  IntColumn get amount => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class CreditAdjustments extends Table {
  TextColumn get id => text()();
  TextColumn get customerId => text().references(Customers, #id)();
  /// Signed minor units: positive adds to what customer owes.
  IntColumn get amount => integer()();
  TextColumn get reason => text()();
  IntColumn get date => integer()();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

// ── Dispatch / consignment ──────────────────────────────────

class Dispatches extends Table {
  TextColumn get id => text()();
  TextColumn get refNo => text().unique()();
  TextColumn get recipientName => text()();
  TextColumn get recipientPhone => text().withDefault(const Constant(''))();
  TextColumn get recipientAddress => text().withDefault(const Constant(''))();
  IntColumn get dispatchDate => integer()();
  IntColumn get agreedPrice => integer().withDefault(const Constant(0))();
  /// draft | sent | partially_sold | sold | partially_returned | returned | cancelled
  TextColumn get status => text().withDefault(const Constant('sent'))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class DispatchItems extends Table {
  TextColumn get id => text()();
  TextColumn get dispatchId => text().references(Dispatches, #id)();
  TextColumn get unitId => text().nullable()();
  TextColumn get variantId => text().references(ProductVariants, #id)();
  TextColumn get batchId => text().nullable()();
  IntColumn get quantity => integer()();
  IntColumn get unitCost => integer()();
  IntColumn get agreedPrice => integer()();
  /// sent | sold | returned | cancelled
  TextColumn get status => text().withDefault(const Constant('sent'))();
  @override
  Set<Column> get primaryKey => {id};
}

class ConsignmentSales extends Table {
  TextColumn get id => text()();
  TextColumn get dispatchItemId => text().references(DispatchItems, #id)();
  IntColumn get quantity => integer()();
  IntColumn get salePrice => integer()();
  IntColumn get amountReceived => integer().withDefault(const Constant(0))();
  IntColumn get date => integer()();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

// ── Returns & refunds ───────────────────────────────────────

class ProductReturns extends Table {
  TextColumn get id => text()();
  TextColumn get saleId => text().nullable().references(SalesInvoices, #id)();
  TextColumn get unitId => text().nullable()();
  TextColumn get variantId => text().nullable().references(ProductVariants, #id)();
  TextColumn get batchId => text().nullable()();
  IntColumn get quantity => integer()();
  IntColumn get refundAmount => integer()();
  TextColumn get reason => text().withDefault(const Constant(''))();
  IntColumn get restock => integer().withDefault(const Constant(1))();
  IntColumn get date => integer()();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

class Refunds extends Table {
  TextColumn get id => text()();
  TextColumn get returnId => text().references(ProductReturns, #id)();
  IntColumn get amount => integer()();
  IntColumn get date => integer()();
  TextColumn get method => text().withDefault(const Constant('Cash'))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

// ── Expenses ────────────────────────────────────────────────

class ExpenseCategories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().unique()();
  @override
  Set<Column> get primaryKey => {id};
}

class Expenses extends Table {
  TextColumn get id => text()();
  TextColumn get categoryId => text().references(ExpenseCategories, #id)();
  TextColumn get description => text()();
  IntColumn get date => integer()();
  IntColumn get amount => integer()();
  TextColumn get method => text().withDefault(const Constant('Cash'))();
  TextColumn get reference => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

// ── Backup ──────────────────────────────────────────────────

class BackupMetadata extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fileName => text()();
  IntColumn get createdAt => integer()();
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();
  TextColumn get appVersion => text().withDefault(const Constant('1.0.0'))();
  IntColumn get dbVersion => integer().withDefault(const Constant(1))();
}
