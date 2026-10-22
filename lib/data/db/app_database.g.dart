// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ShopSettingsTable extends ShopSettings
    with TableInfo<$ShopSettingsTable, ShopSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _shopNameMeta = const VerificationMeta(
    'shopName',
  );
  @override
  late final GeneratedColumn<String> shopName = GeneratedColumn<String>(
    'shop_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Hassan Mobile Center'),
  );
  static const VerificationMeta _subtitleMeta = const VerificationMeta(
    'subtitle',
  );
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
    'subtitle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Shewa Adda'),
  );
  static const VerificationMeta _contactNumberMeta = const VerificationMeta(
    'contactNumber',
  );
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
    'contact_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _invoiceFooterMeta = const VerificationMeta(
    'invoiceFooter',
  );
  @override
  late final GeneratedColumn<String> invoiceFooter = GeneratedColumn<String>(
    'invoice_footer',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PKR'),
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  static const VerificationMeta _invoiceFormatMeta = const VerificationMeta(
    'invoiceFormat',
  );
  @override
  late final GeneratedColumn<String> invoiceFormat = GeneratedColumn<String>(
    'invoice_format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('a4'),
  );
  static const VerificationMeta _lowStockThresholdMeta = const VerificationMeta(
    'lowStockThreshold',
  );
  @override
  late final GeneratedColumn<int> lowStockThreshold = GeneratedColumn<int>(
    'low_stock_threshold',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _dateFormatMeta = const VerificationMeta(
    'dateFormat',
  );
  @override
  late final GeneratedColumn<String> dateFormat = GeneratedColumn<String>(
    'date_format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('dd/MM/yyyy'),
  );
  static const VerificationMeta _setupDoneMeta = const VerificationMeta(
    'setupDone',
  );
  @override
  late final GeneratedColumn<int> setupDone = GeneratedColumn<int>(
    'setup_done',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _whatsappTemplateMeta = const VerificationMeta(
    'whatsappTemplate',
  );
  @override
  late final GeneratedColumn<String> whatsappTemplate = GeneratedColumn<String>(
    'whatsapp_template',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopName,
    subtitle,
    contactNumber,
    address,
    invoiceFooter,
    currency,
    themeMode,
    invoiceFormat,
    lowStockThreshold,
    dateFormat,
    setupDone,
    whatsappTemplate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_name')) {
      context.handle(
        _shopNameMeta,
        shopName.isAcceptableOrUnknown(data['shop_name']!, _shopNameMeta),
      );
    }
    if (data.containsKey('subtitle')) {
      context.handle(
        _subtitleMeta,
        subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta),
      );
    }
    if (data.containsKey('contact_number')) {
      context.handle(
        _contactNumberMeta,
        contactNumber.isAcceptableOrUnknown(
          data['contact_number']!,
          _contactNumberMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('invoice_footer')) {
      context.handle(
        _invoiceFooterMeta,
        invoiceFooter.isAcceptableOrUnknown(
          data['invoice_footer']!,
          _invoiceFooterMeta,
        ),
      );
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('invoice_format')) {
      context.handle(
        _invoiceFormatMeta,
        invoiceFormat.isAcceptableOrUnknown(
          data['invoice_format']!,
          _invoiceFormatMeta,
        ),
      );
    }
    if (data.containsKey('low_stock_threshold')) {
      context.handle(
        _lowStockThresholdMeta,
        lowStockThreshold.isAcceptableOrUnknown(
          data['low_stock_threshold']!,
          _lowStockThresholdMeta,
        ),
      );
    }
    if (data.containsKey('date_format')) {
      context.handle(
        _dateFormatMeta,
        dateFormat.isAcceptableOrUnknown(data['date_format']!, _dateFormatMeta),
      );
    }
    if (data.containsKey('setup_done')) {
      context.handle(
        _setupDoneMeta,
        setupDone.isAcceptableOrUnknown(data['setup_done']!, _setupDoneMeta),
      );
    }
    if (data.containsKey('whatsapp_template')) {
      context.handle(
        _whatsappTemplateMeta,
        whatsappTemplate.isAcceptableOrUnknown(
          data['whatsapp_template']!,
          _whatsappTemplateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shop_name'],
      )!,
      subtitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtitle'],
      )!,
      contactNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_number'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      invoiceFooter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_footer'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      invoiceFormat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_format'],
      )!,
      lowStockThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}low_stock_threshold'],
      )!,
      dateFormat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_format'],
      )!,
      setupDone: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}setup_done'],
      )!,
      whatsappTemplate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whatsapp_template'],
      )!,
    );
  }

  @override
  $ShopSettingsTable createAlias(String alias) {
    return $ShopSettingsTable(attachedDatabase, alias);
  }
}

class ShopSetting extends DataClass implements Insertable<ShopSetting> {
  final int id;
  final String shopName;
  final String subtitle;
  final String contactNumber;
  final String address;
  final String invoiceFooter;
  final String currency;
  final String themeMode;
  final String invoiceFormat;
  final int lowStockThreshold;
  final String dateFormat;
  final int setupDone;
  final String whatsappTemplate;
  const ShopSetting({
    required this.id,
    required this.shopName,
    required this.subtitle,
    required this.contactNumber,
    required this.address,
    required this.invoiceFooter,
    required this.currency,
    required this.themeMode,
    required this.invoiceFormat,
    required this.lowStockThreshold,
    required this.dateFormat,
    required this.setupDone,
    required this.whatsappTemplate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_name'] = Variable<String>(shopName);
    map['subtitle'] = Variable<String>(subtitle);
    map['contact_number'] = Variable<String>(contactNumber);
    map['address'] = Variable<String>(address);
    map['invoice_footer'] = Variable<String>(invoiceFooter);
    map['currency'] = Variable<String>(currency);
    map['theme_mode'] = Variable<String>(themeMode);
    map['invoice_format'] = Variable<String>(invoiceFormat);
    map['low_stock_threshold'] = Variable<int>(lowStockThreshold);
    map['date_format'] = Variable<String>(dateFormat);
    map['setup_done'] = Variable<int>(setupDone);
    map['whatsapp_template'] = Variable<String>(whatsappTemplate);
    return map;
  }

  ShopSettingsCompanion toCompanion(bool nullToAbsent) {
    return ShopSettingsCompanion(
      id: Value(id),
      shopName: Value(shopName),
      subtitle: Value(subtitle),
      contactNumber: Value(contactNumber),
      address: Value(address),
      invoiceFooter: Value(invoiceFooter),
      currency: Value(currency),
      themeMode: Value(themeMode),
      invoiceFormat: Value(invoiceFormat),
      lowStockThreshold: Value(lowStockThreshold),
      dateFormat: Value(dateFormat),
      setupDone: Value(setupDone),
      whatsappTemplate: Value(whatsappTemplate),
    );
  }

  factory ShopSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopSetting(
      id: serializer.fromJson<int>(json['id']),
      shopName: serializer.fromJson<String>(json['shopName']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
      address: serializer.fromJson<String>(json['address']),
      invoiceFooter: serializer.fromJson<String>(json['invoiceFooter']),
      currency: serializer.fromJson<String>(json['currency']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      invoiceFormat: serializer.fromJson<String>(json['invoiceFormat']),
      lowStockThreshold: serializer.fromJson<int>(json['lowStockThreshold']),
      dateFormat: serializer.fromJson<String>(json['dateFormat']),
      setupDone: serializer.fromJson<int>(json['setupDone']),
      whatsappTemplate: serializer.fromJson<String>(json['whatsappTemplate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopName': serializer.toJson<String>(shopName),
      'subtitle': serializer.toJson<String>(subtitle),
      'contactNumber': serializer.toJson<String>(contactNumber),
      'address': serializer.toJson<String>(address),
      'invoiceFooter': serializer.toJson<String>(invoiceFooter),
      'currency': serializer.toJson<String>(currency),
      'themeMode': serializer.toJson<String>(themeMode),
      'invoiceFormat': serializer.toJson<String>(invoiceFormat),
      'lowStockThreshold': serializer.toJson<int>(lowStockThreshold),
      'dateFormat': serializer.toJson<String>(dateFormat),
      'setupDone': serializer.toJson<int>(setupDone),
      'whatsappTemplate': serializer.toJson<String>(whatsappTemplate),
    };
  }

  ShopSetting copyWith({
    int? id,
    String? shopName,
    String? subtitle,
    String? contactNumber,
    String? address,
    String? invoiceFooter,
    String? currency,
    String? themeMode,
    String? invoiceFormat,
    int? lowStockThreshold,
    String? dateFormat,
    int? setupDone,
    String? whatsappTemplate,
  }) => ShopSetting(
    id: id ?? this.id,
    shopName: shopName ?? this.shopName,
    subtitle: subtitle ?? this.subtitle,
    contactNumber: contactNumber ?? this.contactNumber,
    address: address ?? this.address,
    invoiceFooter: invoiceFooter ?? this.invoiceFooter,
    currency: currency ?? this.currency,
    themeMode: themeMode ?? this.themeMode,
    invoiceFormat: invoiceFormat ?? this.invoiceFormat,
    lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
    dateFormat: dateFormat ?? this.dateFormat,
    setupDone: setupDone ?? this.setupDone,
    whatsappTemplate: whatsappTemplate ?? this.whatsappTemplate,
  );
  ShopSetting copyWithCompanion(ShopSettingsCompanion data) {
    return ShopSetting(
      id: data.id.present ? data.id.value : this.id,
      shopName: data.shopName.present ? data.shopName.value : this.shopName,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      contactNumber: data.contactNumber.present
          ? data.contactNumber.value
          : this.contactNumber,
      address: data.address.present ? data.address.value : this.address,
      invoiceFooter: data.invoiceFooter.present
          ? data.invoiceFooter.value
          : this.invoiceFooter,
      currency: data.currency.present ? data.currency.value : this.currency,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      invoiceFormat: data.invoiceFormat.present
          ? data.invoiceFormat.value
          : this.invoiceFormat,
      lowStockThreshold: data.lowStockThreshold.present
          ? data.lowStockThreshold.value
          : this.lowStockThreshold,
      dateFormat: data.dateFormat.present
          ? data.dateFormat.value
          : this.dateFormat,
      setupDone: data.setupDone.present ? data.setupDone.value : this.setupDone,
      whatsappTemplate: data.whatsappTemplate.present
          ? data.whatsappTemplate.value
          : this.whatsappTemplate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopSetting(')
          ..write('id: $id, ')
          ..write('shopName: $shopName, ')
          ..write('subtitle: $subtitle, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('address: $address, ')
          ..write('invoiceFooter: $invoiceFooter, ')
          ..write('currency: $currency, ')
          ..write('themeMode: $themeMode, ')
          ..write('invoiceFormat: $invoiceFormat, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('setupDone: $setupDone, ')
          ..write('whatsappTemplate: $whatsappTemplate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopName,
    subtitle,
    contactNumber,
    address,
    invoiceFooter,
    currency,
    themeMode,
    invoiceFormat,
    lowStockThreshold,
    dateFormat,
    setupDone,
    whatsappTemplate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopSetting &&
          other.id == this.id &&
          other.shopName == this.shopName &&
          other.subtitle == this.subtitle &&
          other.contactNumber == this.contactNumber &&
          other.address == this.address &&
          other.invoiceFooter == this.invoiceFooter &&
          other.currency == this.currency &&
          other.themeMode == this.themeMode &&
          other.invoiceFormat == this.invoiceFormat &&
          other.lowStockThreshold == this.lowStockThreshold &&
          other.dateFormat == this.dateFormat &&
          other.setupDone == this.setupDone &&
          other.whatsappTemplate == this.whatsappTemplate);
}

class ShopSettingsCompanion extends UpdateCompanion<ShopSetting> {
  final Value<int> id;
  final Value<String> shopName;
  final Value<String> subtitle;
  final Value<String> contactNumber;
  final Value<String> address;
  final Value<String> invoiceFooter;
  final Value<String> currency;
  final Value<String> themeMode;
  final Value<String> invoiceFormat;
  final Value<int> lowStockThreshold;
  final Value<String> dateFormat;
  final Value<int> setupDone;
  final Value<String> whatsappTemplate;
  const ShopSettingsCompanion({
    this.id = const Value.absent(),
    this.shopName = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.address = const Value.absent(),
    this.invoiceFooter = const Value.absent(),
    this.currency = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.invoiceFormat = const Value.absent(),
    this.lowStockThreshold = const Value.absent(),
    this.dateFormat = const Value.absent(),
    this.setupDone = const Value.absent(),
    this.whatsappTemplate = const Value.absent(),
  });
  ShopSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.shopName = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.address = const Value.absent(),
    this.invoiceFooter = const Value.absent(),
    this.currency = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.invoiceFormat = const Value.absent(),
    this.lowStockThreshold = const Value.absent(),
    this.dateFormat = const Value.absent(),
    this.setupDone = const Value.absent(),
    this.whatsappTemplate = const Value.absent(),
  });
  static Insertable<ShopSetting> custom({
    Expression<int>? id,
    Expression<String>? shopName,
    Expression<String>? subtitle,
    Expression<String>? contactNumber,
    Expression<String>? address,
    Expression<String>? invoiceFooter,
    Expression<String>? currency,
    Expression<String>? themeMode,
    Expression<String>? invoiceFormat,
    Expression<int>? lowStockThreshold,
    Expression<String>? dateFormat,
    Expression<int>? setupDone,
    Expression<String>? whatsappTemplate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopName != null) 'shop_name': shopName,
      if (subtitle != null) 'subtitle': subtitle,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (address != null) 'address': address,
      if (invoiceFooter != null) 'invoice_footer': invoiceFooter,
      if (currency != null) 'currency': currency,
      if (themeMode != null) 'theme_mode': themeMode,
      if (invoiceFormat != null) 'invoice_format': invoiceFormat,
      if (lowStockThreshold != null) 'low_stock_threshold': lowStockThreshold,
      if (dateFormat != null) 'date_format': dateFormat,
      if (setupDone != null) 'setup_done': setupDone,
      if (whatsappTemplate != null) 'whatsapp_template': whatsappTemplate,
    });
  }

  ShopSettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? shopName,
    Value<String>? subtitle,
    Value<String>? contactNumber,
    Value<String>? address,
    Value<String>? invoiceFooter,
    Value<String>? currency,
    Value<String>? themeMode,
    Value<String>? invoiceFormat,
    Value<int>? lowStockThreshold,
    Value<String>? dateFormat,
    Value<int>? setupDone,
    Value<String>? whatsappTemplate,
  }) {
    return ShopSettingsCompanion(
      id: id ?? this.id,
      shopName: shopName ?? this.shopName,
      subtitle: subtitle ?? this.subtitle,
      contactNumber: contactNumber ?? this.contactNumber,
      address: address ?? this.address,
      invoiceFooter: invoiceFooter ?? this.invoiceFooter,
      currency: currency ?? this.currency,
      themeMode: themeMode ?? this.themeMode,
      invoiceFormat: invoiceFormat ?? this.invoiceFormat,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      dateFormat: dateFormat ?? this.dateFormat,
      setupDone: setupDone ?? this.setupDone,
      whatsappTemplate: whatsappTemplate ?? this.whatsappTemplate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopName.present) {
      map['shop_name'] = Variable<String>(shopName.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (invoiceFooter.present) {
      map['invoice_footer'] = Variable<String>(invoiceFooter.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (invoiceFormat.present) {
      map['invoice_format'] = Variable<String>(invoiceFormat.value);
    }
    if (lowStockThreshold.present) {
      map['low_stock_threshold'] = Variable<int>(lowStockThreshold.value);
    }
    if (dateFormat.present) {
      map['date_format'] = Variable<String>(dateFormat.value);
    }
    if (setupDone.present) {
      map['setup_done'] = Variable<int>(setupDone.value);
    }
    if (whatsappTemplate.present) {
      map['whatsapp_template'] = Variable<String>(whatsappTemplate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopSettingsCompanion(')
          ..write('id: $id, ')
          ..write('shopName: $shopName, ')
          ..write('subtitle: $subtitle, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('address: $address, ')
          ..write('invoiceFooter: $invoiceFooter, ')
          ..write('currency: $currency, ')
          ..write('themeMode: $themeMode, ')
          ..write('invoiceFormat: $invoiceFormat, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('setupDone: $setupDone, ')
          ..write('whatsappTemplate: $whatsappTemplate')
          ..write(')'))
        .toString();
  }
}

class $AppMetadataTable extends AppMetadata
    with TableInfo<$AppMetadataTable, AppMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppMetadataData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppMetadataTable createAlias(String alias) {
    return $AppMetadataTable(attachedDatabase, alias);
  }
}

class AppMetadataData extends DataClass implements Insertable<AppMetadataData> {
  final String key;
  final String value;
  const AppMetadataData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppMetadataCompanion toCompanion(bool nullToAbsent) {
    return AppMetadataCompanion(key: Value(key), value: Value(value));
  }

  factory AppMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppMetadataData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppMetadataData copyWith({String? key, String? value}) =>
      AppMetadataData(key: key ?? this.key, value: value ?? this.value);
  AppMetadataData copyWithCompanion(AppMetadataCompanion data) {
    return AppMetadataData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppMetadataData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppMetadataData &&
          other.key == this.key &&
          other.value == this.value);
}

class AppMetadataCompanion extends UpdateCompanion<AppMetadataData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppMetadataCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppMetadataCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppMetadataData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppMetadataCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppMetadataCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppMetadataCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalUsersTable extends LocalUsers
    with TableInfo<$LocalUsersTable, LocalUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinHashMeta = const VerificationMeta(
    'pinHash',
  );
  @override
  late final GeneratedColumn<String> pinHash = GeneratedColumn<String>(
    'pin_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinSaltMeta = const VerificationMeta(
    'pinSalt',
  );
  @override
  late final GeneratedColumn<String> pinSalt = GeneratedColumn<String>(
    'pin_salt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _useBiometricsMeta = const VerificationMeta(
    'useBiometrics',
  );
  @override
  late final GeneratedColumn<int> useBiometrics = GeneratedColumn<int>(
    'use_biometrics',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _firebaseUidMeta = const VerificationMeta(
    'firebaseUid',
  );
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
    'firebase_uid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    pinHash,
    pinSalt,
    role,
    isActive,
    useBiometrics,
    firebaseUid,
    email,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_users';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalUser> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pin_hash')) {
      context.handle(
        _pinHashMeta,
        pinHash.isAcceptableOrUnknown(data['pin_hash']!, _pinHashMeta),
      );
    } else if (isInserting) {
      context.missing(_pinHashMeta);
    }
    if (data.containsKey('pin_salt')) {
      context.handle(
        _pinSaltMeta,
        pinSalt.isAcceptableOrUnknown(data['pin_salt']!, _pinSaltMeta),
      );
    } else if (isInserting) {
      context.missing(_pinSaltMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('use_biometrics')) {
      context.handle(
        _useBiometricsMeta,
        useBiometrics.isAcceptableOrUnknown(
          data['use_biometrics']!,
          _useBiometricsMeta,
        ),
      );
    }
    if (data.containsKey('firebase_uid')) {
      context.handle(
        _firebaseUidMeta,
        firebaseUid.isAcceptableOrUnknown(
          data['firebase_uid']!,
          _firebaseUidMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalUser(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      pinHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_hash'],
      )!,
      pinSalt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_salt'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
      useBiometrics: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}use_biometrics'],
      )!,
      firebaseUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_uid'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LocalUsersTable createAlias(String alias) {
    return $LocalUsersTable(attachedDatabase, alias);
  }
}

class LocalUser extends DataClass implements Insertable<LocalUser> {
  final String id;
  final String name;
  final String pinHash;
  final String pinSalt;

  /// admin | operator | viewer
  final String role;
  final int isActive;
  final int useBiometrics;

  /// Firebase Auth UID — links local user to Firebase account for sync.
  final String? firebaseUid;

  /// Firebase Auth email — for login.
  final String? email;
  final int createdAt;
  const LocalUser({
    required this.id,
    required this.name,
    required this.pinHash,
    required this.pinSalt,
    required this.role,
    required this.isActive,
    required this.useBiometrics,
    this.firebaseUid,
    this.email,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['pin_hash'] = Variable<String>(pinHash);
    map['pin_salt'] = Variable<String>(pinSalt);
    map['role'] = Variable<String>(role);
    map['is_active'] = Variable<int>(isActive);
    map['use_biometrics'] = Variable<int>(useBiometrics);
    if (!nullToAbsent || firebaseUid != null) {
      map['firebase_uid'] = Variable<String>(firebaseUid);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  LocalUsersCompanion toCompanion(bool nullToAbsent) {
    return LocalUsersCompanion(
      id: Value(id),
      name: Value(name),
      pinHash: Value(pinHash),
      pinSalt: Value(pinSalt),
      role: Value(role),
      isActive: Value(isActive),
      useBiometrics: Value(useBiometrics),
      firebaseUid: firebaseUid == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseUid),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      createdAt: Value(createdAt),
    );
  }

  factory LocalUser.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalUser(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pinHash: serializer.fromJson<String>(json['pinHash']),
      pinSalt: serializer.fromJson<String>(json['pinSalt']),
      role: serializer.fromJson<String>(json['role']),
      isActive: serializer.fromJson<int>(json['isActive']),
      useBiometrics: serializer.fromJson<int>(json['useBiometrics']),
      firebaseUid: serializer.fromJson<String?>(json['firebaseUid']),
      email: serializer.fromJson<String?>(json['email']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'pinHash': serializer.toJson<String>(pinHash),
      'pinSalt': serializer.toJson<String>(pinSalt),
      'role': serializer.toJson<String>(role),
      'isActive': serializer.toJson<int>(isActive),
      'useBiometrics': serializer.toJson<int>(useBiometrics),
      'firebaseUid': serializer.toJson<String?>(firebaseUid),
      'email': serializer.toJson<String?>(email),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  LocalUser copyWith({
    String? id,
    String? name,
    String? pinHash,
    String? pinSalt,
    String? role,
    int? isActive,
    int? useBiometrics,
    Value<String?> firebaseUid = const Value.absent(),
    Value<String?> email = const Value.absent(),
    int? createdAt,
  }) => LocalUser(
    id: id ?? this.id,
    name: name ?? this.name,
    pinHash: pinHash ?? this.pinHash,
    pinSalt: pinSalt ?? this.pinSalt,
    role: role ?? this.role,
    isActive: isActive ?? this.isActive,
    useBiometrics: useBiometrics ?? this.useBiometrics,
    firebaseUid: firebaseUid.present ? firebaseUid.value : this.firebaseUid,
    email: email.present ? email.value : this.email,
    createdAt: createdAt ?? this.createdAt,
  );
  LocalUser copyWithCompanion(LocalUsersCompanion data) {
    return LocalUser(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      pinHash: data.pinHash.present ? data.pinHash.value : this.pinHash,
      pinSalt: data.pinSalt.present ? data.pinSalt.value : this.pinSalt,
      role: data.role.present ? data.role.value : this.role,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      useBiometrics: data.useBiometrics.present
          ? data.useBiometrics.value
          : this.useBiometrics,
      firebaseUid: data.firebaseUid.present
          ? data.firebaseUid.value
          : this.firebaseUid,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalUser(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pinHash: $pinHash, ')
          ..write('pinSalt: $pinSalt, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('useBiometrics: $useBiometrics, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    pinHash,
    pinSalt,
    role,
    isActive,
    useBiometrics,
    firebaseUid,
    email,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalUser &&
          other.id == this.id &&
          other.name == this.name &&
          other.pinHash == this.pinHash &&
          other.pinSalt == this.pinSalt &&
          other.role == this.role &&
          other.isActive == this.isActive &&
          other.useBiometrics == this.useBiometrics &&
          other.firebaseUid == this.firebaseUid &&
          other.email == this.email &&
          other.createdAt == this.createdAt);
}

class LocalUsersCompanion extends UpdateCompanion<LocalUser> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> pinHash;
  final Value<String> pinSalt;
  final Value<String> role;
  final Value<int> isActive;
  final Value<int> useBiometrics;
  final Value<String?> firebaseUid;
  final Value<String?> email;
  final Value<int> createdAt;
  final Value<int> rowid;
  const LocalUsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pinHash = const Value.absent(),
    this.pinSalt = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.useBiometrics = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalUsersCompanion.insert({
    required String id,
    required String name,
    required String pinHash,
    required String pinSalt,
    required String role,
    this.isActive = const Value.absent(),
    this.useBiometrics = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.email = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       pinHash = Value(pinHash),
       pinSalt = Value(pinSalt),
       role = Value(role),
       createdAt = Value(createdAt);
  static Insertable<LocalUser> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? pinHash,
    Expression<String>? pinSalt,
    Expression<String>? role,
    Expression<int>? isActive,
    Expression<int>? useBiometrics,
    Expression<String>? firebaseUid,
    Expression<String>? email,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pinHash != null) 'pin_hash': pinHash,
      if (pinSalt != null) 'pin_salt': pinSalt,
      if (role != null) 'role': role,
      if (isActive != null) 'is_active': isActive,
      if (useBiometrics != null) 'use_biometrics': useBiometrics,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalUsersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? pinHash,
    Value<String>? pinSalt,
    Value<String>? role,
    Value<int>? isActive,
    Value<int>? useBiometrics,
    Value<String?>? firebaseUid,
    Value<String?>? email,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return LocalUsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pinHash: pinHash ?? this.pinHash,
      pinSalt: pinSalt ?? this.pinSalt,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      useBiometrics: useBiometrics ?? this.useBiometrics,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pinHash.present) {
      map['pin_hash'] = Variable<String>(pinHash.value);
    }
    if (pinSalt.present) {
      map['pin_salt'] = Variable<String>(pinSalt.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    if (useBiometrics.present) {
      map['use_biometrics'] = Variable<int>(useBiometrics.value);
    }
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalUsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pinHash: $pinHash, ')
          ..write('pinSalt: $pinSalt, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('useBiometrics: $useBiometrics, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    action,
    entityType,
    entityId,
    details,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      ),
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      ),
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final int id;
  final String? userId;
  final String action;
  final String? entityType;
  final String? entityId;
  final String? details;
  final int createdAt;
  const AuditLog({
    required this.id,
    this.userId,
    required this.action,
    this.entityType,
    this.entityId,
    this.details,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || entityType != null) {
      map['entity_type'] = Variable<String>(entityType);
    }
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String>(entityId);
    }
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      action: Value(action),
      entityType: entityType == null && nullToAbsent
          ? const Value.absent()
          : Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      createdAt: Value(createdAt),
    );
  }

  factory AuditLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      action: serializer.fromJson<String>(json['action']),
      entityType: serializer.fromJson<String?>(json['entityType']),
      entityId: serializer.fromJson<String?>(json['entityId']),
      details: serializer.fromJson<String?>(json['details']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String?>(userId),
      'action': serializer.toJson<String>(action),
      'entityType': serializer.toJson<String?>(entityType),
      'entityId': serializer.toJson<String?>(entityId),
      'details': serializer.toJson<String?>(details),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  AuditLog copyWith({
    int? id,
    Value<String?> userId = const Value.absent(),
    String? action,
    Value<String?> entityType = const Value.absent(),
    Value<String?> entityId = const Value.absent(),
    Value<String?> details = const Value.absent(),
    int? createdAt,
  }) => AuditLog(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    action: action ?? this.action,
    entityType: entityType.present ? entityType.value : this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
    details: details.present ? details.value : this.details,
    createdAt: createdAt ?? this.createdAt,
  );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      action: data.action.present ? data.action.value : this.action,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      details: data.details.present ? data.details.value : this.details,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, action, entityType, entityId, details, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.action == this.action &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.details == this.details &&
          other.createdAt == this.createdAt);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<int> id;
  final Value<String?> userId;
  final Value<String> action;
  final Value<String?> entityType;
  final Value<String?> entityId;
  final Value<String?> details;
  final Value<int> createdAt;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.action = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.details = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String action,
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.details = const Value.absent(),
    required int createdAt,
  }) : action = Value(action),
       createdAt = Value(createdAt);
  static Insertable<AuditLog> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? action,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? details,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (action != null) 'action': action,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (details != null) 'details': details,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuditLogsCompanion copyWith({
    Value<int>? id,
    Value<String?>? userId,
    Value<String>? action,
    Value<String?>? entityType,
    Value<String?>? entityId,
    Value<String?>? details,
    Value<int>? createdAt,
  }) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      action: action ?? this.action,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      details: details ?? this.details,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BrandsTable extends Brands with TableInfo<$BrandsTable, Brand> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<int> isArchived = GeneratedColumn<int>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    isArchived,
    sortOrder,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'brands';
  @override
  VerificationContext validateIntegrity(
    Insertable<Brand> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Brand map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Brand(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_archived'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BrandsTable createAlias(String alias) {
    return $BrandsTable(attachedDatabase, alias);
  }
}

class Brand extends DataClass implements Insertable<Brand> {
  final String id;
  final String name;
  final int isArchived;
  final int sortOrder;
  final int createdAt;
  const Brand({
    required this.id,
    required this.name,
    required this.isArchived,
    required this.sortOrder,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['is_archived'] = Variable<int>(isArchived);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  BrandsCompanion toCompanion(bool nullToAbsent) {
    return BrandsCompanion(
      id: Value(id),
      name: Value(name),
      isArchived: Value(isArchived),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
    );
  }

  factory Brand.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Brand(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isArchived: serializer.fromJson<int>(json['isArchived']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'isArchived': serializer.toJson<int>(isArchived),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Brand copyWith({
    String? id,
    String? name,
    int? isArchived,
    int? sortOrder,
    int? createdAt,
  }) => Brand(
    id: id ?? this.id,
    name: name ?? this.name,
    isArchived: isArchived ?? this.isArchived,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
  );
  Brand copyWithCompanion(BrandsCompanion data) {
    return Brand(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Brand(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isArchived, sortOrder, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Brand &&
          other.id == this.id &&
          other.name == this.name &&
          other.isArchived == this.isArchived &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt);
}

class BrandsCompanion extends UpdateCompanion<Brand> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> isArchived;
  final Value<int> sortOrder;
  final Value<int> createdAt;
  final Value<int> rowid;
  const BrandsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BrandsCompanion.insert({
    required String id,
    required String name,
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Brand> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? isArchived,
    Expression<int>? sortOrder,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isArchived != null) 'is_archived': isArchived,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BrandsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? isArchived,
    Value<int>? sortOrder,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return BrandsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isArchived: isArchived ?? this.isArchived,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<int>(isArchived.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrandsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductModelsTable extends ProductModels
    with TableInfo<$ProductModelsTable, ProductModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandIdMeta = const VerificationMeta(
    'brandId',
  );
  @override
  late final GeneratedColumn<String> brandId = GeneratedColumn<String>(
    'brand_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<int> isArchived = GeneratedColumn<int>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brandId,
    name,
    photoPath,
    isArchived,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('brand_id')) {
      context.handle(
        _brandIdMeta,
        brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta),
      );
    } else if (isInserting) {
      context.missing(_brandIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      brandId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductModelsTable createAlias(String alias) {
    return $ProductModelsTable(attachedDatabase, alias);
  }
}

class ProductModel extends DataClass implements Insertable<ProductModel> {
  final String id;
  final String brandId;
  final String name;
  final String? photoPath;
  final int isArchived;
  final int createdAt;
  const ProductModel({
    required this.id,
    required this.brandId,
    required this.name,
    this.photoPath,
    required this.isArchived,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['brand_id'] = Variable<String>(brandId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['is_archived'] = Variable<int>(isArchived);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ProductModelsCompanion toCompanion(bool nullToAbsent) {
    return ProductModelsCompanion(
      id: Value(id),
      brandId: Value(brandId),
      name: Value(name),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
    );
  }

  factory ProductModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductModel(
      id: serializer.fromJson<String>(json['id']),
      brandId: serializer.fromJson<String>(json['brandId']),
      name: serializer.fromJson<String>(json['name']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      isArchived: serializer.fromJson<int>(json['isArchived']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'brandId': serializer.toJson<String>(brandId),
      'name': serializer.toJson<String>(name),
      'photoPath': serializer.toJson<String?>(photoPath),
      'isArchived': serializer.toJson<int>(isArchived),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  ProductModel copyWith({
    String? id,
    String? brandId,
    String? name,
    Value<String?> photoPath = const Value.absent(),
    int? isArchived,
    int? createdAt,
  }) => ProductModel(
    id: id ?? this.id,
    brandId: brandId ?? this.brandId,
    name: name ?? this.name,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
  );
  ProductModel copyWithCompanion(ProductModelsCompanion data) {
    return ProductModel(
      id: data.id.present ? data.id.value : this.id,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      name: data.name.present ? data.name.value : this.name,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductModel(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('name: $name, ')
          ..write('photoPath: $photoPath, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, brandId, name, photoPath, isArchived, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModel &&
          other.id == this.id &&
          other.brandId == this.brandId &&
          other.name == this.name &&
          other.photoPath == this.photoPath &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt);
}

class ProductModelsCompanion extends UpdateCompanion<ProductModel> {
  final Value<String> id;
  final Value<String> brandId;
  final Value<String> name;
  final Value<String?> photoPath;
  final Value<int> isArchived;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ProductModelsCompanion({
    this.id = const Value.absent(),
    this.brandId = const Value.absent(),
    this.name = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductModelsCompanion.insert({
    required String id,
    required String brandId,
    required String name,
    this.photoPath = const Value.absent(),
    this.isArchived = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       brandId = Value(brandId),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<ProductModel> custom({
    Expression<String>? id,
    Expression<String>? brandId,
    Expression<String>? name,
    Expression<String>? photoPath,
    Expression<int>? isArchived,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brandId != null) 'brand_id': brandId,
      if (name != null) 'name': name,
      if (photoPath != null) 'photo_path': photoPath,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductModelsCompanion copyWith({
    Value<String>? id,
    Value<String>? brandId,
    Value<String>? name,
    Value<String?>? photoPath,
    Value<int>? isArchived,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ProductModelsCompanion(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      name: name ?? this.name,
      photoPath: photoPath ?? this.photoPath,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<String>(brandId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<int>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductModelsCompanion(')
          ..write('id: $id, ')
          ..write('brandId: $brandId, ')
          ..write('name: $name, ')
          ..write('photoPath: $photoPath, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductVariantsTable extends ProductVariants
    with TableInfo<$ProductVariantsTable, ProductVariant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductVariantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<String> modelId = GeneratedColumn<String>(
    'model_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ramMeta = const VerificationMeta('ram');
  @override
  late final GeneratedColumn<String> ram = GeneratedColumn<String>(
    'ram',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _storageMeta = const VerificationMeta(
    'storage',
  );
  @override
  late final GeneratedColumn<String> storage = GeneratedColumn<String>(
    'storage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('New'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    modelId,
    ram,
    storage,
    color,
    condition,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_variants';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductVariant> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_modelIdMeta);
    }
    if (data.containsKey('ram')) {
      context.handle(
        _ramMeta,
        ram.isAcceptableOrUnknown(data['ram']!, _ramMeta),
      );
    }
    if (data.containsKey('storage')) {
      context.handle(
        _storageMeta,
        storage.isAcceptableOrUnknown(data['storage']!, _storageMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductVariant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductVariant(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_id'],
      )!,
      ram: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ram'],
      )!,
      storage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
    );
  }

  @override
  $ProductVariantsTable createAlias(String alias) {
    return $ProductVariantsTable(attachedDatabase, alias);
  }
}

class ProductVariant extends DataClass implements Insertable<ProductVariant> {
  final String id;
  final String modelId;
  final String ram;
  final String storage;
  final String color;

  /// New | Used | Refurbished
  final String condition;
  const ProductVariant({
    required this.id,
    required this.modelId,
    required this.ram,
    required this.storage,
    required this.color,
    required this.condition,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['model_id'] = Variable<String>(modelId);
    map['ram'] = Variable<String>(ram);
    map['storage'] = Variable<String>(storage);
    map['color'] = Variable<String>(color);
    map['condition'] = Variable<String>(condition);
    return map;
  }

  ProductVariantsCompanion toCompanion(bool nullToAbsent) {
    return ProductVariantsCompanion(
      id: Value(id),
      modelId: Value(modelId),
      ram: Value(ram),
      storage: Value(storage),
      color: Value(color),
      condition: Value(condition),
    );
  }

  factory ProductVariant.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductVariant(
      id: serializer.fromJson<String>(json['id']),
      modelId: serializer.fromJson<String>(json['modelId']),
      ram: serializer.fromJson<String>(json['ram']),
      storage: serializer.fromJson<String>(json['storage']),
      color: serializer.fromJson<String>(json['color']),
      condition: serializer.fromJson<String>(json['condition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'modelId': serializer.toJson<String>(modelId),
      'ram': serializer.toJson<String>(ram),
      'storage': serializer.toJson<String>(storage),
      'color': serializer.toJson<String>(color),
      'condition': serializer.toJson<String>(condition),
    };
  }

  ProductVariant copyWith({
    String? id,
    String? modelId,
    String? ram,
    String? storage,
    String? color,
    String? condition,
  }) => ProductVariant(
    id: id ?? this.id,
    modelId: modelId ?? this.modelId,
    ram: ram ?? this.ram,
    storage: storage ?? this.storage,
    color: color ?? this.color,
    condition: condition ?? this.condition,
  );
  ProductVariant copyWithCompanion(ProductVariantsCompanion data) {
    return ProductVariant(
      id: data.id.present ? data.id.value : this.id,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
      ram: data.ram.present ? data.ram.value : this.ram,
      storage: data.storage.present ? data.storage.value : this.storage,
      color: data.color.present ? data.color.value : this.color,
      condition: data.condition.present ? data.condition.value : this.condition,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariant(')
          ..write('id: $id, ')
          ..write('modelId: $modelId, ')
          ..write('ram: $ram, ')
          ..write('storage: $storage, ')
          ..write('color: $color, ')
          ..write('condition: $condition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, modelId, ram, storage, color, condition);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductVariant &&
          other.id == this.id &&
          other.modelId == this.modelId &&
          other.ram == this.ram &&
          other.storage == this.storage &&
          other.color == this.color &&
          other.condition == this.condition);
}

class ProductVariantsCompanion extends UpdateCompanion<ProductVariant> {
  final Value<String> id;
  final Value<String> modelId;
  final Value<String> ram;
  final Value<String> storage;
  final Value<String> color;
  final Value<String> condition;
  final Value<int> rowid;
  const ProductVariantsCompanion({
    this.id = const Value.absent(),
    this.modelId = const Value.absent(),
    this.ram = const Value.absent(),
    this.storage = const Value.absent(),
    this.color = const Value.absent(),
    this.condition = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductVariantsCompanion.insert({
    required String id,
    required String modelId,
    this.ram = const Value.absent(),
    this.storage = const Value.absent(),
    this.color = const Value.absent(),
    this.condition = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       modelId = Value(modelId);
  static Insertable<ProductVariant> custom({
    Expression<String>? id,
    Expression<String>? modelId,
    Expression<String>? ram,
    Expression<String>? storage,
    Expression<String>? color,
    Expression<String>? condition,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (modelId != null) 'model_id': modelId,
      if (ram != null) 'ram': ram,
      if (storage != null) 'storage': storage,
      if (color != null) 'color': color,
      if (condition != null) 'condition': condition,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductVariantsCompanion copyWith({
    Value<String>? id,
    Value<String>? modelId,
    Value<String>? ram,
    Value<String>? storage,
    Value<String>? color,
    Value<String>? condition,
    Value<int>? rowid,
  }) {
    return ProductVariantsCompanion(
      id: id ?? this.id,
      modelId: modelId ?? this.modelId,
      ram: ram ?? this.ram,
      storage: storage ?? this.storage,
      color: color ?? this.color,
      condition: condition ?? this.condition,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<String>(modelId.value);
    }
    if (ram.present) {
      map['ram'] = Variable<String>(ram.value);
    }
    if (storage.present) {
      map['storage'] = Variable<String>(storage.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantsCompanion(')
          ..write('id: $id, ')
          ..write('modelId: $modelId, ')
          ..write('ram: $ram, ')
          ..write('storage: $storage, ')
          ..write('color: $color, ')
          ..write('condition: $condition, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, Supplier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    address,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Supplier> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Supplier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supplier(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class Supplier extends DataClass implements Insertable<Supplier> {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String notes;
  final int createdAt;
  const Supplier({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['address'] = Variable<String>(address);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      address: Value(address),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Supplier.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Supplier(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String>(json['address']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String>(address),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Supplier copyWith({
    String? id,
    String? name,
    String? phone,
    String? address,
    String? notes,
    int? createdAt,
  }) => Supplier(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    address: address ?? this.address,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Supplier copyWithCompanion(SuppliersCompanion data) {
    return Supplier(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Supplier(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, address, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supplier &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class SuppliersCompanion extends UpdateCompanion<Supplier> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> address;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SuppliersCompanion.insert({
    required String id,
    required String name,
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Supplier> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SuppliersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? address,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return SuppliersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryUnitsTable extends InventoryUnits
    with TableInfo<$InventoryUnitsTable, InventoryUnit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryUnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<String> variantId = GeneratedColumn<String>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imei1Meta = const VerificationMeta('imei1');
  @override
  late final GeneratedColumn<String> imei1 = GeneratedColumn<String>(
    'imei1',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _imei2Meta = const VerificationMeta('imei2');
  @override
  late final GeneratedColumn<String> imei2 = GeneratedColumn<String>(
    'imei2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<String> serial = GeneratedColumn<String>(
    'serial',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ptaStatusMeta = const VerificationMeta(
    'ptaStatus',
  );
  @override
  late final GeneratedColumn<String> ptaStatus = GeneratedColumn<String>(
    'pta_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Approved'),
  );
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<int> purchasePrice = GeneratedColumn<int>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salePriceMeta = const VerificationMeta(
    'salePrice',
  );
  @override
  late final GeneratedColumn<int> salePrice = GeneratedColumn<int>(
    'sale_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<String> supplierId = GeneratedColumn<String>(
    'supplier_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta(
    'purchaseDate',
  );
  @override
  late final GeneratedColumn<int> purchaseDate = GeneratedColumn<int>(
    'purchase_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _warrantyMeta = const VerificationMeta(
    'warranty',
  );
  @override
  late final GeneratedColumn<String> warranty = GeneratedColumn<String>(
    'warranty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('available'),
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    variantId,
    imei1,
    imei2,
    serial,
    ptaStatus,
    purchasePrice,
    salePrice,
    supplierId,
    purchaseDate,
    warranty,
    notes,
    photoPath,
    status,
    batchId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_units';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryUnit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    if (data.containsKey('imei1')) {
      context.handle(
        _imei1Meta,
        imei1.isAcceptableOrUnknown(data['imei1']!, _imei1Meta),
      );
    }
    if (data.containsKey('imei2')) {
      context.handle(
        _imei2Meta,
        imei2.isAcceptableOrUnknown(data['imei2']!, _imei2Meta),
      );
    }
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    }
    if (data.containsKey('pta_status')) {
      context.handle(
        _ptaStatusMeta,
        ptaStatus.isAcceptableOrUnknown(data['pta_status']!, _ptaStatusMeta),
      );
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('sale_price')) {
      context.handle(
        _salePriceMeta,
        salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta),
      );
    } else if (isInserting) {
      context.missing(_salePriceMeta);
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
        _purchaseDateMeta,
        purchaseDate.isAcceptableOrUnknown(
          data['purchase_date']!,
          _purchaseDateMeta,
        ),
      );
    }
    if (data.containsKey('warranty')) {
      context.handle(
        _warrantyMeta,
        warranty.isAcceptableOrUnknown(data['warranty']!, _warrantyMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryUnit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryUnit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_id'],
      )!,
      imei1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imei1'],
      ),
      imei2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imei2'],
      ),
      serial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial'],
      ),
      ptaStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pta_status'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_price'],
      )!,
      salePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sale_price'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_id'],
      ),
      purchaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_date'],
      ),
      warranty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warranty'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $InventoryUnitsTable createAlias(String alias) {
    return $InventoryUnitsTable(attachedDatabase, alias);
  }
}

class InventoryUnit extends DataClass implements Insertable<InventoryUnit> {
  final String id;
  final String variantId;
  final String? imei1;
  final String? imei2;
  final String? serial;
  final String ptaStatus;
  final int purchasePrice;
  final int salePrice;
  final String? supplierId;
  final int? purchaseDate;
  final String warranty;
  final String notes;
  final String? photoPath;
  final String status;
  final String? batchId;
  final int createdAt;
  final int updatedAt;
  const InventoryUnit({
    required this.id,
    required this.variantId,
    this.imei1,
    this.imei2,
    this.serial,
    required this.ptaStatus,
    required this.purchasePrice,
    required this.salePrice,
    this.supplierId,
    this.purchaseDate,
    required this.warranty,
    required this.notes,
    this.photoPath,
    required this.status,
    this.batchId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['variant_id'] = Variable<String>(variantId);
    if (!nullToAbsent || imei1 != null) {
      map['imei1'] = Variable<String>(imei1);
    }
    if (!nullToAbsent || imei2 != null) {
      map['imei2'] = Variable<String>(imei2);
    }
    if (!nullToAbsent || serial != null) {
      map['serial'] = Variable<String>(serial);
    }
    map['pta_status'] = Variable<String>(ptaStatus);
    map['purchase_price'] = Variable<int>(purchasePrice);
    map['sale_price'] = Variable<int>(salePrice);
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<String>(supplierId);
    }
    if (!nullToAbsent || purchaseDate != null) {
      map['purchase_date'] = Variable<int>(purchaseDate);
    }
    map['warranty'] = Variable<String>(warranty);
    map['notes'] = Variable<String>(notes);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  InventoryUnitsCompanion toCompanion(bool nullToAbsent) {
    return InventoryUnitsCompanion(
      id: Value(id),
      variantId: Value(variantId),
      imei1: imei1 == null && nullToAbsent
          ? const Value.absent()
          : Value(imei1),
      imei2: imei2 == null && nullToAbsent
          ? const Value.absent()
          : Value(imei2),
      serial: serial == null && nullToAbsent
          ? const Value.absent()
          : Value(serial),
      ptaStatus: Value(ptaStatus),
      purchasePrice: Value(purchasePrice),
      salePrice: Value(salePrice),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      purchaseDate: purchaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseDate),
      warranty: Value(warranty),
      notes: Value(notes),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      status: Value(status),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InventoryUnit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryUnit(
      id: serializer.fromJson<String>(json['id']),
      variantId: serializer.fromJson<String>(json['variantId']),
      imei1: serializer.fromJson<String?>(json['imei1']),
      imei2: serializer.fromJson<String?>(json['imei2']),
      serial: serializer.fromJson<String?>(json['serial']),
      ptaStatus: serializer.fromJson<String>(json['ptaStatus']),
      purchasePrice: serializer.fromJson<int>(json['purchasePrice']),
      salePrice: serializer.fromJson<int>(json['salePrice']),
      supplierId: serializer.fromJson<String?>(json['supplierId']),
      purchaseDate: serializer.fromJson<int?>(json['purchaseDate']),
      warranty: serializer.fromJson<String>(json['warranty']),
      notes: serializer.fromJson<String>(json['notes']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      status: serializer.fromJson<String>(json['status']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'variantId': serializer.toJson<String>(variantId),
      'imei1': serializer.toJson<String?>(imei1),
      'imei2': serializer.toJson<String?>(imei2),
      'serial': serializer.toJson<String?>(serial),
      'ptaStatus': serializer.toJson<String>(ptaStatus),
      'purchasePrice': serializer.toJson<int>(purchasePrice),
      'salePrice': serializer.toJson<int>(salePrice),
      'supplierId': serializer.toJson<String?>(supplierId),
      'purchaseDate': serializer.toJson<int?>(purchaseDate),
      'warranty': serializer.toJson<String>(warranty),
      'notes': serializer.toJson<String>(notes),
      'photoPath': serializer.toJson<String?>(photoPath),
      'status': serializer.toJson<String>(status),
      'batchId': serializer.toJson<String?>(batchId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  InventoryUnit copyWith({
    String? id,
    String? variantId,
    Value<String?> imei1 = const Value.absent(),
    Value<String?> imei2 = const Value.absent(),
    Value<String?> serial = const Value.absent(),
    String? ptaStatus,
    int? purchasePrice,
    int? salePrice,
    Value<String?> supplierId = const Value.absent(),
    Value<int?> purchaseDate = const Value.absent(),
    String? warranty,
    String? notes,
    Value<String?> photoPath = const Value.absent(),
    String? status,
    Value<String?> batchId = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => InventoryUnit(
    id: id ?? this.id,
    variantId: variantId ?? this.variantId,
    imei1: imei1.present ? imei1.value : this.imei1,
    imei2: imei2.present ? imei2.value : this.imei2,
    serial: serial.present ? serial.value : this.serial,
    ptaStatus: ptaStatus ?? this.ptaStatus,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    salePrice: salePrice ?? this.salePrice,
    supplierId: supplierId.present ? supplierId.value : this.supplierId,
    purchaseDate: purchaseDate.present ? purchaseDate.value : this.purchaseDate,
    warranty: warranty ?? this.warranty,
    notes: notes ?? this.notes,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    status: status ?? this.status,
    batchId: batchId.present ? batchId.value : this.batchId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  InventoryUnit copyWithCompanion(InventoryUnitsCompanion data) {
    return InventoryUnit(
      id: data.id.present ? data.id.value : this.id,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      imei1: data.imei1.present ? data.imei1.value : this.imei1,
      imei2: data.imei2.present ? data.imei2.value : this.imei2,
      serial: data.serial.present ? data.serial.value : this.serial,
      ptaStatus: data.ptaStatus.present ? data.ptaStatus.value : this.ptaStatus,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      warranty: data.warranty.present ? data.warranty.value : this.warranty,
      notes: data.notes.present ? data.notes.value : this.notes,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      status: data.status.present ? data.status.value : this.status,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryUnit(')
          ..write('id: $id, ')
          ..write('variantId: $variantId, ')
          ..write('imei1: $imei1, ')
          ..write('imei2: $imei2, ')
          ..write('serial: $serial, ')
          ..write('ptaStatus: $ptaStatus, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('warranty: $warranty, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('status: $status, ')
          ..write('batchId: $batchId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    variantId,
    imei1,
    imei2,
    serial,
    ptaStatus,
    purchasePrice,
    salePrice,
    supplierId,
    purchaseDate,
    warranty,
    notes,
    photoPath,
    status,
    batchId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryUnit &&
          other.id == this.id &&
          other.variantId == this.variantId &&
          other.imei1 == this.imei1 &&
          other.imei2 == this.imei2 &&
          other.serial == this.serial &&
          other.ptaStatus == this.ptaStatus &&
          other.purchasePrice == this.purchasePrice &&
          other.salePrice == this.salePrice &&
          other.supplierId == this.supplierId &&
          other.purchaseDate == this.purchaseDate &&
          other.warranty == this.warranty &&
          other.notes == this.notes &&
          other.photoPath == this.photoPath &&
          other.status == this.status &&
          other.batchId == this.batchId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InventoryUnitsCompanion extends UpdateCompanion<InventoryUnit> {
  final Value<String> id;
  final Value<String> variantId;
  final Value<String?> imei1;
  final Value<String?> imei2;
  final Value<String?> serial;
  final Value<String> ptaStatus;
  final Value<int> purchasePrice;
  final Value<int> salePrice;
  final Value<String?> supplierId;
  final Value<int?> purchaseDate;
  final Value<String> warranty;
  final Value<String> notes;
  final Value<String?> photoPath;
  final Value<String> status;
  final Value<String?> batchId;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const InventoryUnitsCompanion({
    this.id = const Value.absent(),
    this.variantId = const Value.absent(),
    this.imei1 = const Value.absent(),
    this.imei2 = const Value.absent(),
    this.serial = const Value.absent(),
    this.ptaStatus = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.warranty = const Value.absent(),
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.status = const Value.absent(),
    this.batchId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryUnitsCompanion.insert({
    required String id,
    required String variantId,
    this.imei1 = const Value.absent(),
    this.imei2 = const Value.absent(),
    this.serial = const Value.absent(),
    this.ptaStatus = const Value.absent(),
    required int purchasePrice,
    required int salePrice,
    this.supplierId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.warranty = const Value.absent(),
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.status = const Value.absent(),
    this.batchId = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       variantId = Value(variantId),
       purchasePrice = Value(purchasePrice),
       salePrice = Value(salePrice),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<InventoryUnit> custom({
    Expression<String>? id,
    Expression<String>? variantId,
    Expression<String>? imei1,
    Expression<String>? imei2,
    Expression<String>? serial,
    Expression<String>? ptaStatus,
    Expression<int>? purchasePrice,
    Expression<int>? salePrice,
    Expression<String>? supplierId,
    Expression<int>? purchaseDate,
    Expression<String>? warranty,
    Expression<String>? notes,
    Expression<String>? photoPath,
    Expression<String>? status,
    Expression<String>? batchId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (variantId != null) 'variant_id': variantId,
      if (imei1 != null) 'imei1': imei1,
      if (imei2 != null) 'imei2': imei2,
      if (serial != null) 'serial': serial,
      if (ptaStatus != null) 'pta_status': ptaStatus,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (salePrice != null) 'sale_price': salePrice,
      if (supplierId != null) 'supplier_id': supplierId,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (warranty != null) 'warranty': warranty,
      if (notes != null) 'notes': notes,
      if (photoPath != null) 'photo_path': photoPath,
      if (status != null) 'status': status,
      if (batchId != null) 'batch_id': batchId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryUnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? variantId,
    Value<String?>? imei1,
    Value<String?>? imei2,
    Value<String?>? serial,
    Value<String>? ptaStatus,
    Value<int>? purchasePrice,
    Value<int>? salePrice,
    Value<String?>? supplierId,
    Value<int?>? purchaseDate,
    Value<String>? warranty,
    Value<String>? notes,
    Value<String?>? photoPath,
    Value<String>? status,
    Value<String?>? batchId,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return InventoryUnitsCompanion(
      id: id ?? this.id,
      variantId: variantId ?? this.variantId,
      imei1: imei1 ?? this.imei1,
      imei2: imei2 ?? this.imei2,
      serial: serial ?? this.serial,
      ptaStatus: ptaStatus ?? this.ptaStatus,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      salePrice: salePrice ?? this.salePrice,
      supplierId: supplierId ?? this.supplierId,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      warranty: warranty ?? this.warranty,
      notes: notes ?? this.notes,
      photoPath: photoPath ?? this.photoPath,
      status: status ?? this.status,
      batchId: batchId ?? this.batchId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<String>(variantId.value);
    }
    if (imei1.present) {
      map['imei1'] = Variable<String>(imei1.value);
    }
    if (imei2.present) {
      map['imei2'] = Variable<String>(imei2.value);
    }
    if (serial.present) {
      map['serial'] = Variable<String>(serial.value);
    }
    if (ptaStatus.present) {
      map['pta_status'] = Variable<String>(ptaStatus.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<int>(purchasePrice.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<int>(salePrice.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<String>(supplierId.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<int>(purchaseDate.value);
    }
    if (warranty.present) {
      map['warranty'] = Variable<String>(warranty.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryUnitsCompanion(')
          ..write('id: $id, ')
          ..write('variantId: $variantId, ')
          ..write('imei1: $imei1, ')
          ..write('imei2: $imei2, ')
          ..write('serial: $serial, ')
          ..write('ptaStatus: $ptaStatus, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('warranty: $warranty, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('status: $status, ')
          ..write('batchId: $batchId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockBatchesTable extends StockBatches
    with TableInfo<$StockBatchesTable, StockBatche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockBatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<String> variantId = GeneratedColumn<String>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<int> purchasePrice = GeneratedColumn<int>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<String> supplierId = GeneratedColumn<String>(
    'supplier_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta(
    'purchaseDate',
  );
  @override
  late final GeneratedColumn<int> purchaseDate = GeneratedColumn<int>(
    'purchase_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    variantId,
    quantity,
    purchasePrice,
    supplierId,
    purchaseDate,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_batches';
  @override
  VerificationContext validateIntegrity(
    Insertable<StockBatche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
        _purchaseDateMeta,
        purchaseDate.isAcceptableOrUnknown(
          data['purchase_date']!,
          _purchaseDateMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockBatche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockBatche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_price'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_id'],
      ),
      purchaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StockBatchesTable createAlias(String alias) {
    return $StockBatchesTable(attachedDatabase, alias);
  }
}

class StockBatche extends DataClass implements Insertable<StockBatche> {
  final String id;
  final String variantId;
  final int quantity;
  final int purchasePrice;
  final String? supplierId;
  final int? purchaseDate;
  final int createdAt;
  const StockBatche({
    required this.id,
    required this.variantId,
    required this.quantity,
    required this.purchasePrice,
    this.supplierId,
    this.purchaseDate,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['variant_id'] = Variable<String>(variantId);
    map['quantity'] = Variable<int>(quantity);
    map['purchase_price'] = Variable<int>(purchasePrice);
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<String>(supplierId);
    }
    if (!nullToAbsent || purchaseDate != null) {
      map['purchase_date'] = Variable<int>(purchaseDate);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  StockBatchesCompanion toCompanion(bool nullToAbsent) {
    return StockBatchesCompanion(
      id: Value(id),
      variantId: Value(variantId),
      quantity: Value(quantity),
      purchasePrice: Value(purchasePrice),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      purchaseDate: purchaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseDate),
      createdAt: Value(createdAt),
    );
  }

  factory StockBatche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockBatche(
      id: serializer.fromJson<String>(json['id']),
      variantId: serializer.fromJson<String>(json['variantId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      purchasePrice: serializer.fromJson<int>(json['purchasePrice']),
      supplierId: serializer.fromJson<String?>(json['supplierId']),
      purchaseDate: serializer.fromJson<int?>(json['purchaseDate']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'variantId': serializer.toJson<String>(variantId),
      'quantity': serializer.toJson<int>(quantity),
      'purchasePrice': serializer.toJson<int>(purchasePrice),
      'supplierId': serializer.toJson<String?>(supplierId),
      'purchaseDate': serializer.toJson<int?>(purchaseDate),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  StockBatche copyWith({
    String? id,
    String? variantId,
    int? quantity,
    int? purchasePrice,
    Value<String?> supplierId = const Value.absent(),
    Value<int?> purchaseDate = const Value.absent(),
    int? createdAt,
  }) => StockBatche(
    id: id ?? this.id,
    variantId: variantId ?? this.variantId,
    quantity: quantity ?? this.quantity,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    supplierId: supplierId.present ? supplierId.value : this.supplierId,
    purchaseDate: purchaseDate.present ? purchaseDate.value : this.purchaseDate,
    createdAt: createdAt ?? this.createdAt,
  );
  StockBatche copyWithCompanion(StockBatchesCompanion data) {
    return StockBatche(
      id: data.id.present ? data.id.value : this.id,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockBatche(')
          ..write('id: $id, ')
          ..write('variantId: $variantId, ')
          ..write('quantity: $quantity, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    variantId,
    quantity,
    purchasePrice,
    supplierId,
    purchaseDate,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockBatche &&
          other.id == this.id &&
          other.variantId == this.variantId &&
          other.quantity == this.quantity &&
          other.purchasePrice == this.purchasePrice &&
          other.supplierId == this.supplierId &&
          other.purchaseDate == this.purchaseDate &&
          other.createdAt == this.createdAt);
}

class StockBatchesCompanion extends UpdateCompanion<StockBatche> {
  final Value<String> id;
  final Value<String> variantId;
  final Value<int> quantity;
  final Value<int> purchasePrice;
  final Value<String?> supplierId;
  final Value<int?> purchaseDate;
  final Value<int> createdAt;
  final Value<int> rowid;
  const StockBatchesCompanion({
    this.id = const Value.absent(),
    this.variantId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockBatchesCompanion.insert({
    required String id,
    required String variantId,
    required int quantity,
    required int purchasePrice,
    this.supplierId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       variantId = Value(variantId),
       quantity = Value(quantity),
       purchasePrice = Value(purchasePrice),
       createdAt = Value(createdAt);
  static Insertable<StockBatche> custom({
    Expression<String>? id,
    Expression<String>? variantId,
    Expression<int>? quantity,
    Expression<int>? purchasePrice,
    Expression<String>? supplierId,
    Expression<int>? purchaseDate,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (variantId != null) 'variant_id': variantId,
      if (quantity != null) 'quantity': quantity,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (supplierId != null) 'supplier_id': supplierId,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockBatchesCompanion copyWith({
    Value<String>? id,
    Value<String>? variantId,
    Value<int>? quantity,
    Value<int>? purchasePrice,
    Value<String?>? supplierId,
    Value<int?>? purchaseDate,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return StockBatchesCompanion(
      id: id ?? this.id,
      variantId: variantId ?? this.variantId,
      quantity: quantity ?? this.quantity,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      supplierId: supplierId ?? this.supplierId,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<String>(variantId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<int>(purchasePrice.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<String>(supplierId.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<int>(purchaseDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockBatchesCompanion(')
          ..write('id: $id, ')
          ..write('variantId: $variantId, ')
          ..write('quantity: $quantity, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockMovementsTable extends StockMovements
    with TableInfo<$StockMovementsTable, StockMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityDeltaMeta = const VerificationMeta(
    'quantityDelta',
  );
  @override
  late final GeneratedColumn<int> quantityDelta = GeneratedColumn<int>(
    'quantity_delta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromStatusMeta = const VerificationMeta(
    'fromStatus',
  );
  @override
  late final GeneratedColumn<String> fromStatus = GeneratedColumn<String>(
    'from_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toStatusMeta = const VerificationMeta(
    'toStatus',
  );
  @override
  late final GeneratedColumn<String> toStatus = GeneratedColumn<String>(
    'to_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refTypeMeta = const VerificationMeta(
    'refType',
  );
  @override
  late final GeneratedColumn<String> refType = GeneratedColumn<String>(
    'ref_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<String> refId = GeneratedColumn<String>(
    'ref_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    unitId,
    batchId,
    quantityDelta,
    fromStatus,
    toStatus,
    reason,
    refType,
    refId,
    userId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_movements';
  @override
  VerificationContext validateIntegrity(
    Insertable<StockMovement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    }
    if (data.containsKey('quantity_delta')) {
      context.handle(
        _quantityDeltaMeta,
        quantityDelta.isAcceptableOrUnknown(
          data['quantity_delta']!,
          _quantityDeltaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityDeltaMeta);
    }
    if (data.containsKey('from_status')) {
      context.handle(
        _fromStatusMeta,
        fromStatus.isAcceptableOrUnknown(data['from_status']!, _fromStatusMeta),
      );
    }
    if (data.containsKey('to_status')) {
      context.handle(
        _toStatusMeta,
        toStatus.isAcceptableOrUnknown(data['to_status']!, _toStatusMeta),
      );
    } else if (isInserting) {
      context.missing(_toStatusMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('ref_type')) {
      context.handle(
        _refTypeMeta,
        refType.isAcceptableOrUnknown(data['ref_type']!, _refTypeMeta),
      );
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockMovement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      ),
      quantityDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_delta'],
      )!,
      fromStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_status'],
      ),
      toStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_status'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      refType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_type'],
      ),
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_id'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StockMovementsTable createAlias(String alias) {
    return $StockMovementsTable(attachedDatabase, alias);
  }
}

class StockMovement extends DataClass implements Insertable<StockMovement> {
  final int id;
  final String? unitId;
  final String? batchId;
  final int quantityDelta;
  final String? fromStatus;
  final String toStatus;
  final String reason;
  final String? refType;
  final String? refId;
  final String? userId;
  final int createdAt;
  const StockMovement({
    required this.id,
    this.unitId,
    this.batchId,
    required this.quantityDelta,
    this.fromStatus,
    required this.toStatus,
    required this.reason,
    this.refType,
    this.refId,
    this.userId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['quantity_delta'] = Variable<int>(quantityDelta);
    if (!nullToAbsent || fromStatus != null) {
      map['from_status'] = Variable<String>(fromStatus);
    }
    map['to_status'] = Variable<String>(toStatus);
    map['reason'] = Variable<String>(reason);
    if (!nullToAbsent || refType != null) {
      map['ref_type'] = Variable<String>(refType);
    }
    if (!nullToAbsent || refId != null) {
      map['ref_id'] = Variable<String>(refId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  StockMovementsCompanion toCompanion(bool nullToAbsent) {
    return StockMovementsCompanion(
      id: Value(id),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      quantityDelta: Value(quantityDelta),
      fromStatus: fromStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(fromStatus),
      toStatus: Value(toStatus),
      reason: Value(reason),
      refType: refType == null && nullToAbsent
          ? const Value.absent()
          : Value(refType),
      refId: refId == null && nullToAbsent
          ? const Value.absent()
          : Value(refId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
    );
  }

  factory StockMovement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockMovement(
      id: serializer.fromJson<int>(json['id']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      quantityDelta: serializer.fromJson<int>(json['quantityDelta']),
      fromStatus: serializer.fromJson<String?>(json['fromStatus']),
      toStatus: serializer.fromJson<String>(json['toStatus']),
      reason: serializer.fromJson<String>(json['reason']),
      refType: serializer.fromJson<String?>(json['refType']),
      refId: serializer.fromJson<String?>(json['refId']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'unitId': serializer.toJson<String?>(unitId),
      'batchId': serializer.toJson<String?>(batchId),
      'quantityDelta': serializer.toJson<int>(quantityDelta),
      'fromStatus': serializer.toJson<String?>(fromStatus),
      'toStatus': serializer.toJson<String>(toStatus),
      'reason': serializer.toJson<String>(reason),
      'refType': serializer.toJson<String?>(refType),
      'refId': serializer.toJson<String?>(refId),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  StockMovement copyWith({
    int? id,
    Value<String?> unitId = const Value.absent(),
    Value<String?> batchId = const Value.absent(),
    int? quantityDelta,
    Value<String?> fromStatus = const Value.absent(),
    String? toStatus,
    String? reason,
    Value<String?> refType = const Value.absent(),
    Value<String?> refId = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    int? createdAt,
  }) => StockMovement(
    id: id ?? this.id,
    unitId: unitId.present ? unitId.value : this.unitId,
    batchId: batchId.present ? batchId.value : this.batchId,
    quantityDelta: quantityDelta ?? this.quantityDelta,
    fromStatus: fromStatus.present ? fromStatus.value : this.fromStatus,
    toStatus: toStatus ?? this.toStatus,
    reason: reason ?? this.reason,
    refType: refType.present ? refType.value : this.refType,
    refId: refId.present ? refId.value : this.refId,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
  );
  StockMovement copyWithCompanion(StockMovementsCompanion data) {
    return StockMovement(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      quantityDelta: data.quantityDelta.present
          ? data.quantityDelta.value
          : this.quantityDelta,
      fromStatus: data.fromStatus.present
          ? data.fromStatus.value
          : this.fromStatus,
      toStatus: data.toStatus.present ? data.toStatus.value : this.toStatus,
      reason: data.reason.present ? data.reason.value : this.reason,
      refType: data.refType.present ? data.refType.value : this.refType,
      refId: data.refId.present ? data.refId.value : this.refId,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockMovement(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('fromStatus: $fromStatus, ')
          ..write('toStatus: $toStatus, ')
          ..write('reason: $reason, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    unitId,
    batchId,
    quantityDelta,
    fromStatus,
    toStatus,
    reason,
    refType,
    refId,
    userId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockMovement &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.batchId == this.batchId &&
          other.quantityDelta == this.quantityDelta &&
          other.fromStatus == this.fromStatus &&
          other.toStatus == this.toStatus &&
          other.reason == this.reason &&
          other.refType == this.refType &&
          other.refId == this.refId &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt);
}

class StockMovementsCompanion extends UpdateCompanion<StockMovement> {
  final Value<int> id;
  final Value<String?> unitId;
  final Value<String?> batchId;
  final Value<int> quantityDelta;
  final Value<String?> fromStatus;
  final Value<String> toStatus;
  final Value<String> reason;
  final Value<String?> refType;
  final Value<String?> refId;
  final Value<String?> userId;
  final Value<int> createdAt;
  const StockMovementsCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.batchId = const Value.absent(),
    this.quantityDelta = const Value.absent(),
    this.fromStatus = const Value.absent(),
    this.toStatus = const Value.absent(),
    this.reason = const Value.absent(),
    this.refType = const Value.absent(),
    this.refId = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  StockMovementsCompanion.insert({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.batchId = const Value.absent(),
    required int quantityDelta,
    this.fromStatus = const Value.absent(),
    required String toStatus,
    required String reason,
    this.refType = const Value.absent(),
    this.refId = const Value.absent(),
    this.userId = const Value.absent(),
    required int createdAt,
  }) : quantityDelta = Value(quantityDelta),
       toStatus = Value(toStatus),
       reason = Value(reason),
       createdAt = Value(createdAt);
  static Insertable<StockMovement> custom({
    Expression<int>? id,
    Expression<String>? unitId,
    Expression<String>? batchId,
    Expression<int>? quantityDelta,
    Expression<String>? fromStatus,
    Expression<String>? toStatus,
    Expression<String>? reason,
    Expression<String>? refType,
    Expression<String>? refId,
    Expression<String>? userId,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (batchId != null) 'batch_id': batchId,
      if (quantityDelta != null) 'quantity_delta': quantityDelta,
      if (fromStatus != null) 'from_status': fromStatus,
      if (toStatus != null) 'to_status': toStatus,
      if (reason != null) 'reason': reason,
      if (refType != null) 'ref_type': refType,
      if (refId != null) 'ref_id': refId,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  StockMovementsCompanion copyWith({
    Value<int>? id,
    Value<String?>? unitId,
    Value<String?>? batchId,
    Value<int>? quantityDelta,
    Value<String?>? fromStatus,
    Value<String>? toStatus,
    Value<String>? reason,
    Value<String?>? refType,
    Value<String?>? refId,
    Value<String?>? userId,
    Value<int>? createdAt,
  }) {
    return StockMovementsCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      batchId: batchId ?? this.batchId,
      quantityDelta: quantityDelta ?? this.quantityDelta,
      fromStatus: fromStatus ?? this.fromStatus,
      toStatus: toStatus ?? this.toStatus,
      reason: reason ?? this.reason,
      refType: refType ?? this.refType,
      refId: refId ?? this.refId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (quantityDelta.present) {
      map['quantity_delta'] = Variable<int>(quantityDelta.value);
    }
    if (fromStatus.present) {
      map['from_status'] = Variable<String>(fromStatus.value);
    }
    if (toStatus.present) {
      map['to_status'] = Variable<String>(toStatus.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (refType.present) {
      map['ref_type'] = Variable<String>(refType.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<String>(refId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockMovementsCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('fromStatus: $fromStatus, ')
          ..write('toStatus: $toStatus, ')
          ..write('reason: $reason, ')
          ..write('refType: $refType, ')
          ..write('refId: $refId, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PurchaseInvoicesTable extends PurchaseInvoices
    with TableInfo<$PurchaseInvoicesTable, PurchaseInvoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseInvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refNoMeta = const VerificationMeta('refNo');
  @override
  late final GeneratedColumn<String> refNo = GeneratedColumn<String>(
    'ref_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<String> supplierId = GeneratedColumn<String>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta(
    'purchaseDate',
  );
  @override
  late final GeneratedColumn<int> purchaseDate = GeneratedColumn<int>(
    'purchase_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<int> discount = GeneratedColumn<int>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _expensesMeta = const VerificationMeta(
    'expenses',
  );
  @override
  late final GeneratedColumn<int> expenses = GeneratedColumn<int>(
    'expenses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidMeta = const VerificationMeta('paid');
  @override
  late final GeneratedColumn<int> paid = GeneratedColumn<int>(
    'paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    refNo,
    supplierId,
    userId,
    purchaseDate,
    subtotal,
    discount,
    expenses,
    total,
    paid,
    paymentMethod,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseInvoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('ref_no')) {
      context.handle(
        _refNoMeta,
        refNo.isAcceptableOrUnknown(data['ref_no']!, _refNoMeta),
      );
    } else if (isInserting) {
      context.missing(_refNoMeta);
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
        _purchaseDateMeta,
        purchaseDate.isAcceptableOrUnknown(
          data['purchase_date']!,
          _purchaseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('expenses')) {
      context.handle(
        _expensesMeta,
        expenses.isAcceptableOrUnknown(data['expenses']!, _expensesMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('paid')) {
      context.handle(
        _paidMeta,
        paid.isAcceptableOrUnknown(data['paid']!, _paidMeta),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseInvoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseInvoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      refNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_no'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      purchaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_date'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount'],
      )!,
      expenses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expenses'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      paid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paid'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PurchaseInvoicesTable createAlias(String alias) {
    return $PurchaseInvoicesTable(attachedDatabase, alias);
  }
}

class PurchaseInvoice extends DataClass implements Insertable<PurchaseInvoice> {
  final String id;
  final String refNo;
  final String supplierId;
  final String? userId;
  final int purchaseDate;
  final int subtotal;
  final int discount;
  final int expenses;
  final int total;
  final int paid;
  final String paymentMethod;
  final String notes;
  final int createdAt;
  const PurchaseInvoice({
    required this.id,
    required this.refNo,
    required this.supplierId,
    this.userId,
    required this.purchaseDate,
    required this.subtotal,
    required this.discount,
    required this.expenses,
    required this.total,
    required this.paid,
    required this.paymentMethod,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ref_no'] = Variable<String>(refNo);
    map['supplier_id'] = Variable<String>(supplierId);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['purchase_date'] = Variable<int>(purchaseDate);
    map['subtotal'] = Variable<int>(subtotal);
    map['discount'] = Variable<int>(discount);
    map['expenses'] = Variable<int>(expenses);
    map['total'] = Variable<int>(total);
    map['paid'] = Variable<int>(paid);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  PurchaseInvoicesCompanion toCompanion(bool nullToAbsent) {
    return PurchaseInvoicesCompanion(
      id: Value(id),
      refNo: Value(refNo),
      supplierId: Value(supplierId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      purchaseDate: Value(purchaseDate),
      subtotal: Value(subtotal),
      discount: Value(discount),
      expenses: Value(expenses),
      total: Value(total),
      paid: Value(paid),
      paymentMethod: Value(paymentMethod),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory PurchaseInvoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseInvoice(
      id: serializer.fromJson<String>(json['id']),
      refNo: serializer.fromJson<String>(json['refNo']),
      supplierId: serializer.fromJson<String>(json['supplierId']),
      userId: serializer.fromJson<String?>(json['userId']),
      purchaseDate: serializer.fromJson<int>(json['purchaseDate']),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      discount: serializer.fromJson<int>(json['discount']),
      expenses: serializer.fromJson<int>(json['expenses']),
      total: serializer.fromJson<int>(json['total']),
      paid: serializer.fromJson<int>(json['paid']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'refNo': serializer.toJson<String>(refNo),
      'supplierId': serializer.toJson<String>(supplierId),
      'userId': serializer.toJson<String?>(userId),
      'purchaseDate': serializer.toJson<int>(purchaseDate),
      'subtotal': serializer.toJson<int>(subtotal),
      'discount': serializer.toJson<int>(discount),
      'expenses': serializer.toJson<int>(expenses),
      'total': serializer.toJson<int>(total),
      'paid': serializer.toJson<int>(paid),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  PurchaseInvoice copyWith({
    String? id,
    String? refNo,
    String? supplierId,
    Value<String?> userId = const Value.absent(),
    int? purchaseDate,
    int? subtotal,
    int? discount,
    int? expenses,
    int? total,
    int? paid,
    String? paymentMethod,
    String? notes,
    int? createdAt,
  }) => PurchaseInvoice(
    id: id ?? this.id,
    refNo: refNo ?? this.refNo,
    supplierId: supplierId ?? this.supplierId,
    userId: userId.present ? userId.value : this.userId,
    purchaseDate: purchaseDate ?? this.purchaseDate,
    subtotal: subtotal ?? this.subtotal,
    discount: discount ?? this.discount,
    expenses: expenses ?? this.expenses,
    total: total ?? this.total,
    paid: paid ?? this.paid,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  PurchaseInvoice copyWithCompanion(PurchaseInvoicesCompanion data) {
    return PurchaseInvoice(
      id: data.id.present ? data.id.value : this.id,
      refNo: data.refNo.present ? data.refNo.value : this.refNo,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      userId: data.userId.present ? data.userId.value : this.userId,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      expenses: data.expenses.present ? data.expenses.value : this.expenses,
      total: data.total.present ? data.total.value : this.total,
      paid: data.paid.present ? data.paid.value : this.paid,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoice(')
          ..write('id: $id, ')
          ..write('refNo: $refNo, ')
          ..write('supplierId: $supplierId, ')
          ..write('userId: $userId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('expenses: $expenses, ')
          ..write('total: $total, ')
          ..write('paid: $paid, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    refNo,
    supplierId,
    userId,
    purchaseDate,
    subtotal,
    discount,
    expenses,
    total,
    paid,
    paymentMethod,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseInvoice &&
          other.id == this.id &&
          other.refNo == this.refNo &&
          other.supplierId == this.supplierId &&
          other.userId == this.userId &&
          other.purchaseDate == this.purchaseDate &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.expenses == this.expenses &&
          other.total == this.total &&
          other.paid == this.paid &&
          other.paymentMethod == this.paymentMethod &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class PurchaseInvoicesCompanion extends UpdateCompanion<PurchaseInvoice> {
  final Value<String> id;
  final Value<String> refNo;
  final Value<String> supplierId;
  final Value<String?> userId;
  final Value<int> purchaseDate;
  final Value<int> subtotal;
  final Value<int> discount;
  final Value<int> expenses;
  final Value<int> total;
  final Value<int> paid;
  final Value<String> paymentMethod;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const PurchaseInvoicesCompanion({
    this.id = const Value.absent(),
    this.refNo = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.userId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.expenses = const Value.absent(),
    this.total = const Value.absent(),
    this.paid = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseInvoicesCompanion.insert({
    required String id,
    required String refNo,
    required String supplierId,
    this.userId = const Value.absent(),
    required int purchaseDate,
    required int subtotal,
    this.discount = const Value.absent(),
    this.expenses = const Value.absent(),
    required int total,
    this.paid = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       refNo = Value(refNo),
       supplierId = Value(supplierId),
       purchaseDate = Value(purchaseDate),
       subtotal = Value(subtotal),
       total = Value(total),
       createdAt = Value(createdAt);
  static Insertable<PurchaseInvoice> custom({
    Expression<String>? id,
    Expression<String>? refNo,
    Expression<String>? supplierId,
    Expression<String>? userId,
    Expression<int>? purchaseDate,
    Expression<int>? subtotal,
    Expression<int>? discount,
    Expression<int>? expenses,
    Expression<int>? total,
    Expression<int>? paid,
    Expression<String>? paymentMethod,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refNo != null) 'ref_no': refNo,
      if (supplierId != null) 'supplier_id': supplierId,
      if (userId != null) 'user_id': userId,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (expenses != null) 'expenses': expenses,
      if (total != null) 'total': total,
      if (paid != null) 'paid': paid,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseInvoicesCompanion copyWith({
    Value<String>? id,
    Value<String>? refNo,
    Value<String>? supplierId,
    Value<String?>? userId,
    Value<int>? purchaseDate,
    Value<int>? subtotal,
    Value<int>? discount,
    Value<int>? expenses,
    Value<int>? total,
    Value<int>? paid,
    Value<String>? paymentMethod,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return PurchaseInvoicesCompanion(
      id: id ?? this.id,
      refNo: refNo ?? this.refNo,
      supplierId: supplierId ?? this.supplierId,
      userId: userId ?? this.userId,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      expenses: expenses ?? this.expenses,
      total: total ?? this.total,
      paid: paid ?? this.paid,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (refNo.present) {
      map['ref_no'] = Variable<String>(refNo.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<String>(supplierId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<int>(purchaseDate.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int>(discount.value);
    }
    if (expenses.present) {
      map['expenses'] = Variable<int>(expenses.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (paid.present) {
      map['paid'] = Variable<int>(paid.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoicesCompanion(')
          ..write('id: $id, ')
          ..write('refNo: $refNo, ')
          ..write('supplierId: $supplierId, ')
          ..write('userId: $userId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('expenses: $expenses, ')
          ..write('total: $total, ')
          ..write('paid: $paid, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseItemsTable extends PurchaseItems
    with TableInfo<$PurchaseItemsTable, PurchaseItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchaseIdMeta = const VerificationMeta(
    'purchaseId',
  );
  @override
  late final GeneratedColumn<String> purchaseId = GeneratedColumn<String>(
    'purchase_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<String> variantId = GeneratedColumn<String>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCostMeta = const VerificationMeta(
    'unitCost',
  );
  @override
  late final GeneratedColumn<int> unitCost = GeneratedColumn<int>(
    'unit_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    purchaseId,
    variantId,
    unitId,
    batchId,
    quantity,
    unitCost,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
        _purchaseIdMeta,
        purchaseId.isAcceptableOrUnknown(data['purchase_id']!, _purchaseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(
        _unitCostMeta,
        unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta),
      );
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      purchaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_id'],
      )!,
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost'],
      )!,
    );
  }

  @override
  $PurchaseItemsTable createAlias(String alias) {
    return $PurchaseItemsTable(attachedDatabase, alias);
  }
}

class PurchaseItem extends DataClass implements Insertable<PurchaseItem> {
  final String id;
  final String purchaseId;
  final String variantId;
  final String? unitId;
  final String? batchId;
  final int quantity;
  final int unitCost;
  const PurchaseItem({
    required this.id,
    required this.purchaseId,
    required this.variantId,
    this.unitId,
    this.batchId,
    required this.quantity,
    required this.unitCost,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['purchase_id'] = Variable<String>(purchaseId);
    map['variant_id'] = Variable<String>(variantId);
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['unit_cost'] = Variable<int>(unitCost);
    return map;
  }

  PurchaseItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseItemsCompanion(
      id: Value(id),
      purchaseId: Value(purchaseId),
      variantId: Value(variantId),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      quantity: Value(quantity),
      unitCost: Value(unitCost),
    );
  }

  factory PurchaseItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseItem(
      id: serializer.fromJson<String>(json['id']),
      purchaseId: serializer.fromJson<String>(json['purchaseId']),
      variantId: serializer.fromJson<String>(json['variantId']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitCost: serializer.fromJson<int>(json['unitCost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'purchaseId': serializer.toJson<String>(purchaseId),
      'variantId': serializer.toJson<String>(variantId),
      'unitId': serializer.toJson<String?>(unitId),
      'batchId': serializer.toJson<String?>(batchId),
      'quantity': serializer.toJson<int>(quantity),
      'unitCost': serializer.toJson<int>(unitCost),
    };
  }

  PurchaseItem copyWith({
    String? id,
    String? purchaseId,
    String? variantId,
    Value<String?> unitId = const Value.absent(),
    Value<String?> batchId = const Value.absent(),
    int? quantity,
    int? unitCost,
  }) => PurchaseItem(
    id: id ?? this.id,
    purchaseId: purchaseId ?? this.purchaseId,
    variantId: variantId ?? this.variantId,
    unitId: unitId.present ? unitId.value : this.unitId,
    batchId: batchId.present ? batchId.value : this.batchId,
    quantity: quantity ?? this.quantity,
    unitCost: unitCost ?? this.unitCost,
  );
  PurchaseItem copyWithCompanion(PurchaseItemsCompanion data) {
    return PurchaseItem(
      id: data.id.present ? data.id.value : this.id,
      purchaseId: data.purchaseId.present
          ? data.purchaseId.value
          : this.purchaseId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItem(')
          ..write('id: $id, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('variantId: $variantId, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('unitCost: $unitCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    purchaseId,
    variantId,
    unitId,
    batchId,
    quantity,
    unitCost,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseItem &&
          other.id == this.id &&
          other.purchaseId == this.purchaseId &&
          other.variantId == this.variantId &&
          other.unitId == this.unitId &&
          other.batchId == this.batchId &&
          other.quantity == this.quantity &&
          other.unitCost == this.unitCost);
}

class PurchaseItemsCompanion extends UpdateCompanion<PurchaseItem> {
  final Value<String> id;
  final Value<String> purchaseId;
  final Value<String> variantId;
  final Value<String?> unitId;
  final Value<String?> batchId;
  final Value<int> quantity;
  final Value<int> unitCost;
  final Value<int> rowid;
  const PurchaseItemsCompanion({
    this.id = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.batchId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseItemsCompanion.insert({
    required String id,
    required String purchaseId,
    required String variantId,
    this.unitId = const Value.absent(),
    this.batchId = const Value.absent(),
    required int quantity,
    required int unitCost,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       purchaseId = Value(purchaseId),
       variantId = Value(variantId),
       quantity = Value(quantity),
       unitCost = Value(unitCost);
  static Insertable<PurchaseItem> custom({
    Expression<String>? id,
    Expression<String>? purchaseId,
    Expression<String>? variantId,
    Expression<String>? unitId,
    Expression<String>? batchId,
    Expression<int>? quantity,
    Expression<int>? unitCost,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (variantId != null) 'variant_id': variantId,
      if (unitId != null) 'unit_id': unitId,
      if (batchId != null) 'batch_id': batchId,
      if (quantity != null) 'quantity': quantity,
      if (unitCost != null) 'unit_cost': unitCost,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? purchaseId,
    Value<String>? variantId,
    Value<String?>? unitId,
    Value<String?>? batchId,
    Value<int>? quantity,
    Value<int>? unitCost,
    Value<int>? rowid,
  }) {
    return PurchaseItemsCompanion(
      id: id ?? this.id,
      purchaseId: purchaseId ?? this.purchaseId,
      variantId: variantId ?? this.variantId,
      unitId: unitId ?? this.unitId,
      batchId: batchId ?? this.batchId,
      quantity: quantity ?? this.quantity,
      unitCost: unitCost ?? this.unitCost,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<String>(purchaseId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<String>(variantId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<int>(unitCost.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItemsCompanion(')
          ..write('id: $id, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('variantId: $variantId, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('unitCost: $unitCost, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SupplierPaymentsTable extends SupplierPayments
    with TableInfo<$SupplierPaymentsTable, SupplierPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierPaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<String> supplierId = GeneratedColumn<String>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchaseIdMeta = const VerificationMeta(
    'purchaseId',
  );
  @override
  late final GeneratedColumn<String> purchaseId = GeneratedColumn<String>(
    'purchase_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplierId,
    purchaseId,
    amount,
    date,
    method,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierPayment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
        _purchaseIdMeta,
        purchaseId.isAcceptableOrUnknown(data['purchase_id']!, _purchaseIdMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierPayment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_id'],
      )!,
      purchaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SupplierPaymentsTable createAlias(String alias) {
    return $SupplierPaymentsTable(attachedDatabase, alias);
  }
}

class SupplierPayment extends DataClass implements Insertable<SupplierPayment> {
  final String id;
  final String supplierId;
  final String? purchaseId;
  final int amount;
  final int date;
  final String method;
  final String notes;
  final int createdAt;
  const SupplierPayment({
    required this.id,
    required this.supplierId,
    this.purchaseId,
    required this.amount,
    required this.date,
    required this.method,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['supplier_id'] = Variable<String>(supplierId);
    if (!nullToAbsent || purchaseId != null) {
      map['purchase_id'] = Variable<String>(purchaseId);
    }
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<int>(date);
    map['method'] = Variable<String>(method);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  SupplierPaymentsCompanion toCompanion(bool nullToAbsent) {
    return SupplierPaymentsCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      purchaseId: purchaseId == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseId),
      amount: Value(amount),
      date: Value(date),
      method: Value(method),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory SupplierPayment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierPayment(
      id: serializer.fromJson<String>(json['id']),
      supplierId: serializer.fromJson<String>(json['supplierId']),
      purchaseId: serializer.fromJson<String?>(json['purchaseId']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<int>(json['date']),
      method: serializer.fromJson<String>(json['method']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'supplierId': serializer.toJson<String>(supplierId),
      'purchaseId': serializer.toJson<String?>(purchaseId),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<int>(date),
      'method': serializer.toJson<String>(method),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  SupplierPayment copyWith({
    String? id,
    String? supplierId,
    Value<String?> purchaseId = const Value.absent(),
    int? amount,
    int? date,
    String? method,
    String? notes,
    int? createdAt,
  }) => SupplierPayment(
    id: id ?? this.id,
    supplierId: supplierId ?? this.supplierId,
    purchaseId: purchaseId.present ? purchaseId.value : this.purchaseId,
    amount: amount ?? this.amount,
    date: date ?? this.date,
    method: method ?? this.method,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  SupplierPayment copyWithCompanion(SupplierPaymentsCompanion data) {
    return SupplierPayment(
      id: data.id.present ? data.id.value : this.id,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      purchaseId: data.purchaseId.present
          ? data.purchaseId.value
          : this.purchaseId,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
      method: data.method.present ? data.method.value : this.method,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierPayment(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    supplierId,
    purchaseId,
    amount,
    date,
    method,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierPayment &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.purchaseId == this.purchaseId &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.method == this.method &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class SupplierPaymentsCompanion extends UpdateCompanion<SupplierPayment> {
  final Value<String> id;
  final Value<String> supplierId;
  final Value<String?> purchaseId;
  final Value<int> amount;
  final Value<int> date;
  final Value<String> method;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const SupplierPaymentsCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.method = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SupplierPaymentsCompanion.insert({
    required String id,
    required String supplierId,
    this.purchaseId = const Value.absent(),
    required int amount,
    required int date,
    this.method = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       supplierId = Value(supplierId),
       amount = Value(amount),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<SupplierPayment> custom({
    Expression<String>? id,
    Expression<String>? supplierId,
    Expression<String>? purchaseId,
    Expression<int>? amount,
    Expression<int>? date,
    Expression<String>? method,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (method != null) 'method': method,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SupplierPaymentsCompanion copyWith({
    Value<String>? id,
    Value<String>? supplierId,
    Value<String?>? purchaseId,
    Value<int>? amount,
    Value<int>? date,
    Value<String>? method,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return SupplierPaymentsCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      purchaseId: purchaseId ?? this.purchaseId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      method: method ?? this.method,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<String>(supplierId.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<String>(purchaseId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _openingBalanceMeta = const VerificationMeta(
    'openingBalance',
  );
  @override
  late final GeneratedColumn<int> openingBalance = GeneratedColumn<int>(
    'opening_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    address,
    notes,
    openingBalance,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
        _openingBalanceMeta,
        openingBalance.isAcceptableOrUnknown(
          data['opening_balance']!,
          _openingBalanceMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      openingBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String notes;
  final int openingBalance;
  final int createdAt;
  const Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.notes,
    required this.openingBalance,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['address'] = Variable<String>(address);
    map['notes'] = Variable<String>(notes);
    map['opening_balance'] = Variable<int>(openingBalance);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      address: Value(address),
      notes: Value(notes),
      openingBalance: Value(openingBalance),
      createdAt: Value(createdAt),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String>(json['address']),
      notes: serializer.fromJson<String>(json['notes']),
      openingBalance: serializer.fromJson<int>(json['openingBalance']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String>(address),
      'notes': serializer.toJson<String>(notes),
      'openingBalance': serializer.toJson<int>(openingBalance),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    String? address,
    String? notes,
    int? openingBalance,
    int? createdAt,
  }) => Customer(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    address: address ?? this.address,
    notes: notes ?? this.notes,
    openingBalance: openingBalance ?? this.openingBalance,
    createdAt: createdAt ?? this.createdAt,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, phone, address, notes, openingBalance, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.notes == this.notes &&
          other.openingBalance == this.openingBalance &&
          other.createdAt == this.createdAt);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> address;
  final Value<String> notes;
  final Value<int> openingBalance;
  final Value<int> createdAt;
  final Value<int> rowid;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomersCompanion.insert({
    required String id,
    required String name,
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.openingBalance = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Customer> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? notes,
    Expression<int>? openingBalance,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? address,
    Value<String>? notes,
    Value<int>? openingBalance,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      openingBalance: openingBalance ?? this.openingBalance,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<int>(openingBalance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SalesInvoicesTable extends SalesInvoices
    with TableInfo<$SalesInvoicesTable, SalesInvoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesInvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invoiceNoMeta = const VerificationMeta(
    'invoiceNo',
  );
  @override
  late final GeneratedColumn<String> invoiceNo = GeneratedColumn<String>(
    'invoice_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _saleDateMeta = const VerificationMeta(
    'saleDate',
  );
  @override
  late final GeneratedColumn<int> saleDate = GeneratedColumn<int>(
    'sale_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMeta = const VerificationMeta(
    'discount',
  );
  @override
  late final GeneratedColumn<int> discount = GeneratedColumn<int>(
    'discount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<int> tax = GeneratedColumn<int>(
    'tax',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidMeta = const VerificationMeta('paid');
  @override
  late final GeneratedColumn<int> paid = GeneratedColumn<int>(
    'paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _paymentTypeMeta = const VerificationMeta(
    'paymentType',
  );
  @override
  late final GeneratedColumn<String> paymentType = GeneratedColumn<String>(
    'payment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('final'),
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _warrantyMeta = const VerificationMeta(
    'warranty',
  );
  @override
  late final GeneratedColumn<String> warranty = GeneratedColumn<String>(
    'warranty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceNo,
    saleDate,
    customerId,
    subtotal,
    discount,
    tax,
    total,
    paid,
    paymentType,
    paymentMethod,
    status,
    idempotencyKey,
    notes,
    warranty,
    userId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesInvoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('invoice_no')) {
      context.handle(
        _invoiceNoMeta,
        invoiceNo.isAcceptableOrUnknown(data['invoice_no']!, _invoiceNoMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceNoMeta);
    }
    if (data.containsKey('sale_date')) {
      context.handle(
        _saleDateMeta,
        saleDate.isAcceptableOrUnknown(data['sale_date']!, _saleDateMeta),
      );
    } else if (isInserting) {
      context.missing(_saleDateMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(
        _discountMeta,
        discount.isAcceptableOrUnknown(data['discount']!, _discountMeta),
      );
    }
    if (data.containsKey('tax')) {
      context.handle(
        _taxMeta,
        tax.isAcceptableOrUnknown(data['tax']!, _taxMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('paid')) {
      context.handle(
        _paidMeta,
        paid.isAcceptableOrUnknown(data['paid']!, _paidMeta),
      );
    }
    if (data.containsKey('payment_type')) {
      context.handle(
        _paymentTypeMeta,
        paymentType.isAcceptableOrUnknown(
          data['payment_type']!,
          _paymentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentTypeMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idempotencyKeyMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('warranty')) {
      context.handle(
        _warrantyMeta,
        warranty.isAcceptableOrUnknown(data['warranty']!, _warrantyMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesInvoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesInvoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      invoiceNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_no'],
      )!,
      saleDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sale_date'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal'],
      )!,
      discount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount'],
      )!,
      tax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      paid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paid'],
      )!,
      paymentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_type'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      warranty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warranty'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SalesInvoicesTable createAlias(String alias) {
    return $SalesInvoicesTable(attachedDatabase, alias);
  }
}

class SalesInvoice extends DataClass implements Insertable<SalesInvoice> {
  final String id;
  final String invoiceNo;
  final int saleDate;
  final String customerId;
  final int subtotal;
  final int discount;
  final int tax;
  final int total;
  final int paid;

  /// full | partial | credit
  final String paymentType;
  final String paymentMethod;

  /// final | cancelled | returned
  final String status;
  final String idempotencyKey;
  final String notes;
  final String warranty;
  final String? userId;
  final int createdAt;
  const SalesInvoice({
    required this.id,
    required this.invoiceNo,
    required this.saleDate,
    required this.customerId,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.total,
    required this.paid,
    required this.paymentType,
    required this.paymentMethod,
    required this.status,
    required this.idempotencyKey,
    required this.notes,
    required this.warranty,
    this.userId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['invoice_no'] = Variable<String>(invoiceNo);
    map['sale_date'] = Variable<int>(saleDate);
    map['customer_id'] = Variable<String>(customerId);
    map['subtotal'] = Variable<int>(subtotal);
    map['discount'] = Variable<int>(discount);
    map['tax'] = Variable<int>(tax);
    map['total'] = Variable<int>(total);
    map['paid'] = Variable<int>(paid);
    map['payment_type'] = Variable<String>(paymentType);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['status'] = Variable<String>(status);
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    map['notes'] = Variable<String>(notes);
    map['warranty'] = Variable<String>(warranty);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  SalesInvoicesCompanion toCompanion(bool nullToAbsent) {
    return SalesInvoicesCompanion(
      id: Value(id),
      invoiceNo: Value(invoiceNo),
      saleDate: Value(saleDate),
      customerId: Value(customerId),
      subtotal: Value(subtotal),
      discount: Value(discount),
      tax: Value(tax),
      total: Value(total),
      paid: Value(paid),
      paymentType: Value(paymentType),
      paymentMethod: Value(paymentMethod),
      status: Value(status),
      idempotencyKey: Value(idempotencyKey),
      notes: Value(notes),
      warranty: Value(warranty),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
    );
  }

  factory SalesInvoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesInvoice(
      id: serializer.fromJson<String>(json['id']),
      invoiceNo: serializer.fromJson<String>(json['invoiceNo']),
      saleDate: serializer.fromJson<int>(json['saleDate']),
      customerId: serializer.fromJson<String>(json['customerId']),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      discount: serializer.fromJson<int>(json['discount']),
      tax: serializer.fromJson<int>(json['tax']),
      total: serializer.fromJson<int>(json['total']),
      paid: serializer.fromJson<int>(json['paid']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      status: serializer.fromJson<String>(json['status']),
      idempotencyKey: serializer.fromJson<String>(json['idempotencyKey']),
      notes: serializer.fromJson<String>(json['notes']),
      warranty: serializer.fromJson<String>(json['warranty']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'invoiceNo': serializer.toJson<String>(invoiceNo),
      'saleDate': serializer.toJson<int>(saleDate),
      'customerId': serializer.toJson<String>(customerId),
      'subtotal': serializer.toJson<int>(subtotal),
      'discount': serializer.toJson<int>(discount),
      'tax': serializer.toJson<int>(tax),
      'total': serializer.toJson<int>(total),
      'paid': serializer.toJson<int>(paid),
      'paymentType': serializer.toJson<String>(paymentType),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'status': serializer.toJson<String>(status),
      'idempotencyKey': serializer.toJson<String>(idempotencyKey),
      'notes': serializer.toJson<String>(notes),
      'warranty': serializer.toJson<String>(warranty),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  SalesInvoice copyWith({
    String? id,
    String? invoiceNo,
    int? saleDate,
    String? customerId,
    int? subtotal,
    int? discount,
    int? tax,
    int? total,
    int? paid,
    String? paymentType,
    String? paymentMethod,
    String? status,
    String? idempotencyKey,
    String? notes,
    String? warranty,
    Value<String?> userId = const Value.absent(),
    int? createdAt,
  }) => SalesInvoice(
    id: id ?? this.id,
    invoiceNo: invoiceNo ?? this.invoiceNo,
    saleDate: saleDate ?? this.saleDate,
    customerId: customerId ?? this.customerId,
    subtotal: subtotal ?? this.subtotal,
    discount: discount ?? this.discount,
    tax: tax ?? this.tax,
    total: total ?? this.total,
    paid: paid ?? this.paid,
    paymentType: paymentType ?? this.paymentType,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    status: status ?? this.status,
    idempotencyKey: idempotencyKey ?? this.idempotencyKey,
    notes: notes ?? this.notes,
    warranty: warranty ?? this.warranty,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
  );
  SalesInvoice copyWithCompanion(SalesInvoicesCompanion data) {
    return SalesInvoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNo: data.invoiceNo.present ? data.invoiceNo.value : this.invoiceNo,
      saleDate: data.saleDate.present ? data.saleDate.value : this.saleDate,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      discount: data.discount.present ? data.discount.value : this.discount,
      tax: data.tax.present ? data.tax.value : this.tax,
      total: data.total.present ? data.total.value : this.total,
      paid: data.paid.present ? data.paid.value : this.paid,
      paymentType: data.paymentType.present
          ? data.paymentType.value
          : this.paymentType,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      status: data.status.present ? data.status.value : this.status,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      notes: data.notes.present ? data.notes.value : this.notes,
      warranty: data.warranty.present ? data.warranty.value : this.warranty,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesInvoice(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('saleDate: $saleDate, ')
          ..write('customerId: $customerId, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('total: $total, ')
          ..write('paid: $paid, ')
          ..write('paymentType: $paymentType, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('status: $status, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('notes: $notes, ')
          ..write('warranty: $warranty, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceNo,
    saleDate,
    customerId,
    subtotal,
    discount,
    tax,
    total,
    paid,
    paymentType,
    paymentMethod,
    status,
    idempotencyKey,
    notes,
    warranty,
    userId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesInvoice &&
          other.id == this.id &&
          other.invoiceNo == this.invoiceNo &&
          other.saleDate == this.saleDate &&
          other.customerId == this.customerId &&
          other.subtotal == this.subtotal &&
          other.discount == this.discount &&
          other.tax == this.tax &&
          other.total == this.total &&
          other.paid == this.paid &&
          other.paymentType == this.paymentType &&
          other.paymentMethod == this.paymentMethod &&
          other.status == this.status &&
          other.idempotencyKey == this.idempotencyKey &&
          other.notes == this.notes &&
          other.warranty == this.warranty &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt);
}

class SalesInvoicesCompanion extends UpdateCompanion<SalesInvoice> {
  final Value<String> id;
  final Value<String> invoiceNo;
  final Value<int> saleDate;
  final Value<String> customerId;
  final Value<int> subtotal;
  final Value<int> discount;
  final Value<int> tax;
  final Value<int> total;
  final Value<int> paid;
  final Value<String> paymentType;
  final Value<String> paymentMethod;
  final Value<String> status;
  final Value<String> idempotencyKey;
  final Value<String> notes;
  final Value<String> warranty;
  final Value<String?> userId;
  final Value<int> createdAt;
  final Value<int> rowid;
  const SalesInvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNo = const Value.absent(),
    this.saleDate = const Value.absent(),
    this.customerId = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    this.total = const Value.absent(),
    this.paid = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.status = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.notes = const Value.absent(),
    this.warranty = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SalesInvoicesCompanion.insert({
    required String id,
    required String invoiceNo,
    required int saleDate,
    required String customerId,
    required int subtotal,
    this.discount = const Value.absent(),
    this.tax = const Value.absent(),
    required int total,
    this.paid = const Value.absent(),
    required String paymentType,
    this.paymentMethod = const Value.absent(),
    this.status = const Value.absent(),
    required String idempotencyKey,
    this.notes = const Value.absent(),
    this.warranty = const Value.absent(),
    this.userId = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       invoiceNo = Value(invoiceNo),
       saleDate = Value(saleDate),
       customerId = Value(customerId),
       subtotal = Value(subtotal),
       total = Value(total),
       paymentType = Value(paymentType),
       idempotencyKey = Value(idempotencyKey),
       createdAt = Value(createdAt);
  static Insertable<SalesInvoice> custom({
    Expression<String>? id,
    Expression<String>? invoiceNo,
    Expression<int>? saleDate,
    Expression<String>? customerId,
    Expression<int>? subtotal,
    Expression<int>? discount,
    Expression<int>? tax,
    Expression<int>? total,
    Expression<int>? paid,
    Expression<String>? paymentType,
    Expression<String>? paymentMethod,
    Expression<String>? status,
    Expression<String>? idempotencyKey,
    Expression<String>? notes,
    Expression<String>? warranty,
    Expression<String>? userId,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNo != null) 'invoice_no': invoiceNo,
      if (saleDate != null) 'sale_date': saleDate,
      if (customerId != null) 'customer_id': customerId,
      if (subtotal != null) 'subtotal': subtotal,
      if (discount != null) 'discount': discount,
      if (tax != null) 'tax': tax,
      if (total != null) 'total': total,
      if (paid != null) 'paid': paid,
      if (paymentType != null) 'payment_type': paymentType,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (status != null) 'status': status,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (notes != null) 'notes': notes,
      if (warranty != null) 'warranty': warranty,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SalesInvoicesCompanion copyWith({
    Value<String>? id,
    Value<String>? invoiceNo,
    Value<int>? saleDate,
    Value<String>? customerId,
    Value<int>? subtotal,
    Value<int>? discount,
    Value<int>? tax,
    Value<int>? total,
    Value<int>? paid,
    Value<String>? paymentType,
    Value<String>? paymentMethod,
    Value<String>? status,
    Value<String>? idempotencyKey,
    Value<String>? notes,
    Value<String>? warranty,
    Value<String?>? userId,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return SalesInvoicesCompanion(
      id: id ?? this.id,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      saleDate: saleDate ?? this.saleDate,
      customerId: customerId ?? this.customerId,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      tax: tax ?? this.tax,
      total: total ?? this.total,
      paid: paid ?? this.paid,
      paymentType: paymentType ?? this.paymentType,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      notes: notes ?? this.notes,
      warranty: warranty ?? this.warranty,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (invoiceNo.present) {
      map['invoice_no'] = Variable<String>(invoiceNo.value);
    }
    if (saleDate.present) {
      map['sale_date'] = Variable<int>(saleDate.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int>(discount.value);
    }
    if (tax.present) {
      map['tax'] = Variable<int>(tax.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (paid.present) {
      map['paid'] = Variable<int>(paid.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (warranty.present) {
      map['warranty'] = Variable<String>(warranty.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesInvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('saleDate: $saleDate, ')
          ..write('customerId: $customerId, ')
          ..write('subtotal: $subtotal, ')
          ..write('discount: $discount, ')
          ..write('tax: $tax, ')
          ..write('total: $total, ')
          ..write('paid: $paid, ')
          ..write('paymentType: $paymentType, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('status: $status, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('notes: $notes, ')
          ..write('warranty: $warranty, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SalesItemsTable extends SalesItems
    with TableInfo<$SalesItemsTable, SalesItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
    'sale_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<String> variantId = GeneratedColumn<String>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCostMeta = const VerificationMeta(
    'unitCost',
  );
  @override
  late final GeneratedColumn<int> unitCost = GeneratedColumn<int>(
    'unit_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    saleId,
    variantId,
    unitId,
    batchId,
    quantity,
    unitPrice,
    unitCost,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sale_id')) {
      context.handle(
        _saleIdMeta,
        saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(
        _unitCostMeta,
        unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta),
      );
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      saleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_id'],
      )!,
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
      )!,
      unitCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost'],
      )!,
    );
  }

  @override
  $SalesItemsTable createAlias(String alias) {
    return $SalesItemsTable(attachedDatabase, alias);
  }
}

class SalesItem extends DataClass implements Insertable<SalesItem> {
  final String id;
  final String saleId;
  final String variantId;
  final String? unitId;
  final String? batchId;
  final int quantity;
  final int unitPrice;

  /// Acquisition cost captured at sale time (COGS basis).
  final int unitCost;
  const SalesItem({
    required this.id,
    required this.saleId,
    required this.variantId,
    this.unitId,
    this.batchId,
    required this.quantity,
    required this.unitPrice,
    required this.unitCost,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sale_id'] = Variable<String>(saleId);
    map['variant_id'] = Variable<String>(variantId);
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['unit_cost'] = Variable<int>(unitCost);
    return map;
  }

  SalesItemsCompanion toCompanion(bool nullToAbsent) {
    return SalesItemsCompanion(
      id: Value(id),
      saleId: Value(saleId),
      variantId: Value(variantId),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      unitCost: Value(unitCost),
    );
  }

  factory SalesItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesItem(
      id: serializer.fromJson<String>(json['id']),
      saleId: serializer.fromJson<String>(json['saleId']),
      variantId: serializer.fromJson<String>(json['variantId']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      unitCost: serializer.fromJson<int>(json['unitCost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'saleId': serializer.toJson<String>(saleId),
      'variantId': serializer.toJson<String>(variantId),
      'unitId': serializer.toJson<String?>(unitId),
      'batchId': serializer.toJson<String?>(batchId),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'unitCost': serializer.toJson<int>(unitCost),
    };
  }

  SalesItem copyWith({
    String? id,
    String? saleId,
    String? variantId,
    Value<String?> unitId = const Value.absent(),
    Value<String?> batchId = const Value.absent(),
    int? quantity,
    int? unitPrice,
    int? unitCost,
  }) => SalesItem(
    id: id ?? this.id,
    saleId: saleId ?? this.saleId,
    variantId: variantId ?? this.variantId,
    unitId: unitId.present ? unitId.value : this.unitId,
    batchId: batchId.present ? batchId.value : this.batchId,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    unitCost: unitCost ?? this.unitCost,
  );
  SalesItem copyWithCompanion(SalesItemsCompanion data) {
    return SalesItem(
      id: data.id.present ? data.id.value : this.id,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesItem(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('variantId: $variantId, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitCost: $unitCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    saleId,
    variantId,
    unitId,
    batchId,
    quantity,
    unitPrice,
    unitCost,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesItem &&
          other.id == this.id &&
          other.saleId == this.saleId &&
          other.variantId == this.variantId &&
          other.unitId == this.unitId &&
          other.batchId == this.batchId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.unitCost == this.unitCost);
}

class SalesItemsCompanion extends UpdateCompanion<SalesItem> {
  final Value<String> id;
  final Value<String> saleId;
  final Value<String> variantId;
  final Value<String?> unitId;
  final Value<String?> batchId;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<int> unitCost;
  final Value<int> rowid;
  const SalesItemsCompanion({
    this.id = const Value.absent(),
    this.saleId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.batchId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SalesItemsCompanion.insert({
    required String id,
    required String saleId,
    required String variantId,
    this.unitId = const Value.absent(),
    this.batchId = const Value.absent(),
    required int quantity,
    required int unitPrice,
    required int unitCost,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       saleId = Value(saleId),
       variantId = Value(variantId),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice),
       unitCost = Value(unitCost);
  static Insertable<SalesItem> custom({
    Expression<String>? id,
    Expression<String>? saleId,
    Expression<String>? variantId,
    Expression<String>? unitId,
    Expression<String>? batchId,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<int>? unitCost,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleId != null) 'sale_id': saleId,
      if (variantId != null) 'variant_id': variantId,
      if (unitId != null) 'unit_id': unitId,
      if (batchId != null) 'batch_id': batchId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (unitCost != null) 'unit_cost': unitCost,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SalesItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? saleId,
    Value<String>? variantId,
    Value<String?>? unitId,
    Value<String?>? batchId,
    Value<int>? quantity,
    Value<int>? unitPrice,
    Value<int>? unitCost,
    Value<int>? rowid,
  }) {
    return SalesItemsCompanion(
      id: id ?? this.id,
      saleId: saleId ?? this.saleId,
      variantId: variantId ?? this.variantId,
      unitId: unitId ?? this.unitId,
      batchId: batchId ?? this.batchId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      unitCost: unitCost ?? this.unitCost,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<String>(variantId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<int>(unitCost.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesItemsCompanion(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('variantId: $variantId, ')
          ..write('unitId: $unitId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitCost: $unitCost, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomerPaymentsTable extends CustomerPayments
    with TableInfo<$CustomerPaymentsTable, CustomerPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerPaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
    'sale_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerId,
    saleId,
    amount,
    date,
    method,
    dueDate,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerPayment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('sale_id')) {
      context.handle(
        _saleIdMeta,
        saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerPayment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      saleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_id'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CustomerPaymentsTable createAlias(String alias) {
    return $CustomerPaymentsTable(attachedDatabase, alias);
  }
}

class CustomerPayment extends DataClass implements Insertable<CustomerPayment> {
  final String id;
  final String customerId;
  final String? saleId;
  final int amount;
  final int date;
  final String method;
  final int? dueDate;
  final String notes;
  final int createdAt;
  const CustomerPayment({
    required this.id,
    required this.customerId,
    this.saleId,
    required this.amount,
    required this.date,
    required this.method,
    this.dueDate,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['customer_id'] = Variable<String>(customerId);
    if (!nullToAbsent || saleId != null) {
      map['sale_id'] = Variable<String>(saleId);
    }
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<int>(date);
    map['method'] = Variable<String>(method);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<int>(dueDate);
    }
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  CustomerPaymentsCompanion toCompanion(bool nullToAbsent) {
    return CustomerPaymentsCompanion(
      id: Value(id),
      customerId: Value(customerId),
      saleId: saleId == null && nullToAbsent
          ? const Value.absent()
          : Value(saleId),
      amount: Value(amount),
      date: Value(date),
      method: Value(method),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory CustomerPayment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerPayment(
      id: serializer.fromJson<String>(json['id']),
      customerId: serializer.fromJson<String>(json['customerId']),
      saleId: serializer.fromJson<String?>(json['saleId']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<int>(json['date']),
      method: serializer.fromJson<String>(json['method']),
      dueDate: serializer.fromJson<int?>(json['dueDate']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'customerId': serializer.toJson<String>(customerId),
      'saleId': serializer.toJson<String?>(saleId),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<int>(date),
      'method': serializer.toJson<String>(method),
      'dueDate': serializer.toJson<int?>(dueDate),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  CustomerPayment copyWith({
    String? id,
    String? customerId,
    Value<String?> saleId = const Value.absent(),
    int? amount,
    int? date,
    String? method,
    Value<int?> dueDate = const Value.absent(),
    String? notes,
    int? createdAt,
  }) => CustomerPayment(
    id: id ?? this.id,
    customerId: customerId ?? this.customerId,
    saleId: saleId.present ? saleId.value : this.saleId,
    amount: amount ?? this.amount,
    date: date ?? this.date,
    method: method ?? this.method,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  CustomerPayment copyWithCompanion(CustomerPaymentsCompanion data) {
    return CustomerPayment(
      id: data.id.present ? data.id.value : this.id,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
      method: data.method.present ? data.method.value : this.method,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerPayment(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('saleId: $saleId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('dueDate: $dueDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    customerId,
    saleId,
    amount,
    date,
    method,
    dueDate,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerPayment &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.saleId == this.saleId &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.method == this.method &&
          other.dueDate == this.dueDate &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class CustomerPaymentsCompanion extends UpdateCompanion<CustomerPayment> {
  final Value<String> id;
  final Value<String> customerId;
  final Value<String?> saleId;
  final Value<int> amount;
  final Value<int> date;
  final Value<String> method;
  final Value<int?> dueDate;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const CustomerPaymentsCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.saleId = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.method = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomerPaymentsCompanion.insert({
    required String id,
    required String customerId,
    this.saleId = const Value.absent(),
    required int amount,
    required int date,
    this.method = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       customerId = Value(customerId),
       amount = Value(amount),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<CustomerPayment> custom({
    Expression<String>? id,
    Expression<String>? customerId,
    Expression<String>? saleId,
    Expression<int>? amount,
    Expression<int>? date,
    Expression<String>? method,
    Expression<int>? dueDate,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (saleId != null) 'sale_id': saleId,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (method != null) 'method': method,
      if (dueDate != null) 'due_date': dueDate,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomerPaymentsCompanion copyWith({
    Value<String>? id,
    Value<String>? customerId,
    Value<String?>? saleId,
    Value<int>? amount,
    Value<int>? date,
    Value<String>? method,
    Value<int?>? dueDate,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return CustomerPaymentsCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      saleId: saleId ?? this.saleId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      method: method ?? this.method,
      dueDate: dueDate ?? this.dueDate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<int>(dueDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('saleId: $saleId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('dueDate: $dueDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentAllocationsTable extends PaymentAllocations
    with TableInfo<$PaymentAllocationsTable, PaymentAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentAllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
    'sale_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, paymentId, saleId, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentAllocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('sale_id')) {
      context.handle(
        _saleIdMeta,
        saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentAllocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_id'],
      )!,
      saleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $PaymentAllocationsTable createAlias(String alias) {
    return $PaymentAllocationsTable(attachedDatabase, alias);
  }
}

class PaymentAllocation extends DataClass
    implements Insertable<PaymentAllocation> {
  final String id;
  final String paymentId;
  final String saleId;
  final int amount;
  const PaymentAllocation({
    required this.id,
    required this.paymentId,
    required this.saleId,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['payment_id'] = Variable<String>(paymentId);
    map['sale_id'] = Variable<String>(saleId);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  PaymentAllocationsCompanion toCompanion(bool nullToAbsent) {
    return PaymentAllocationsCompanion(
      id: Value(id),
      paymentId: Value(paymentId),
      saleId: Value(saleId),
      amount: Value(amount),
    );
  }

  factory PaymentAllocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentAllocation(
      id: serializer.fromJson<String>(json['id']),
      paymentId: serializer.fromJson<String>(json['paymentId']),
      saleId: serializer.fromJson<String>(json['saleId']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'paymentId': serializer.toJson<String>(paymentId),
      'saleId': serializer.toJson<String>(saleId),
      'amount': serializer.toJson<int>(amount),
    };
  }

  PaymentAllocation copyWith({
    String? id,
    String? paymentId,
    String? saleId,
    int? amount,
  }) => PaymentAllocation(
    id: id ?? this.id,
    paymentId: paymentId ?? this.paymentId,
    saleId: saleId ?? this.saleId,
    amount: amount ?? this.amount,
  );
  PaymentAllocation copyWithCompanion(PaymentAllocationsCompanion data) {
    return PaymentAllocation(
      id: data.id.present ? data.id.value : this.id,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocation(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('saleId: $saleId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, paymentId, saleId, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentAllocation &&
          other.id == this.id &&
          other.paymentId == this.paymentId &&
          other.saleId == this.saleId &&
          other.amount == this.amount);
}

class PaymentAllocationsCompanion extends UpdateCompanion<PaymentAllocation> {
  final Value<String> id;
  final Value<String> paymentId;
  final Value<String> saleId;
  final Value<int> amount;
  final Value<int> rowid;
  const PaymentAllocationsCompanion({
    this.id = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.saleId = const Value.absent(),
    this.amount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentAllocationsCompanion.insert({
    required String id,
    required String paymentId,
    required String saleId,
    required int amount,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       paymentId = Value(paymentId),
       saleId = Value(saleId),
       amount = Value(amount);
  static Insertable<PaymentAllocation> custom({
    Expression<String>? id,
    Expression<String>? paymentId,
    Expression<String>? saleId,
    Expression<int>? amount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentId != null) 'payment_id': paymentId,
      if (saleId != null) 'sale_id': saleId,
      if (amount != null) 'amount': amount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentAllocationsCompanion copyWith({
    Value<String>? id,
    Value<String>? paymentId,
    Value<String>? saleId,
    Value<int>? amount,
    Value<int>? rowid,
  }) {
    return PaymentAllocationsCompanion(
      id: id ?? this.id,
      paymentId: paymentId ?? this.paymentId,
      saleId: saleId ?? this.saleId,
      amount: amount ?? this.amount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocationsCompanion(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('saleId: $saleId, ')
          ..write('amount: $amount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CreditAdjustmentsTable extends CreditAdjustments
    with TableInfo<$CreditAdjustmentsTable, CreditAdjustment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerId,
    amount,
    reason,
    date,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credit_adjustments';
  @override
  VerificationContext validateIntegrity(
    Insertable<CreditAdjustment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CreditAdjustment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreditAdjustment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CreditAdjustmentsTable createAlias(String alias) {
    return $CreditAdjustmentsTable(attachedDatabase, alias);
  }
}

class CreditAdjustment extends DataClass
    implements Insertable<CreditAdjustment> {
  final String id;
  final String customerId;

  /// Signed minor units: positive adds to what customer owes.
  final int amount;
  final String reason;
  final int date;
  final int createdAt;
  const CreditAdjustment({
    required this.id,
    required this.customerId,
    required this.amount,
    required this.reason,
    required this.date,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['customer_id'] = Variable<String>(customerId);
    map['amount'] = Variable<int>(amount);
    map['reason'] = Variable<String>(reason);
    map['date'] = Variable<int>(date);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  CreditAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return CreditAdjustmentsCompanion(
      id: Value(id),
      customerId: Value(customerId),
      amount: Value(amount),
      reason: Value(reason),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory CreditAdjustment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreditAdjustment(
      id: serializer.fromJson<String>(json['id']),
      customerId: serializer.fromJson<String>(json['customerId']),
      amount: serializer.fromJson<int>(json['amount']),
      reason: serializer.fromJson<String>(json['reason']),
      date: serializer.fromJson<int>(json['date']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'customerId': serializer.toJson<String>(customerId),
      'amount': serializer.toJson<int>(amount),
      'reason': serializer.toJson<String>(reason),
      'date': serializer.toJson<int>(date),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  CreditAdjustment copyWith({
    String? id,
    String? customerId,
    int? amount,
    String? reason,
    int? date,
    int? createdAt,
  }) => CreditAdjustment(
    id: id ?? this.id,
    customerId: customerId ?? this.customerId,
    amount: amount ?? this.amount,
    reason: reason ?? this.reason,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
  );
  CreditAdjustment copyWithCompanion(CreditAdjustmentsCompanion data) {
    return CreditAdjustment(
      id: data.id.present ? data.id.value : this.id,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      amount: data.amount.present ? data.amount.value : this.amount,
      reason: data.reason.present ? data.reason.value : this.reason,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreditAdjustment(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, customerId, amount, reason, date, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreditAdjustment &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.amount == this.amount &&
          other.reason == this.reason &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class CreditAdjustmentsCompanion extends UpdateCompanion<CreditAdjustment> {
  final Value<String> id;
  final Value<String> customerId;
  final Value<int> amount;
  final Value<String> reason;
  final Value<int> date;
  final Value<int> createdAt;
  final Value<int> rowid;
  const CreditAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.amount = const Value.absent(),
    this.reason = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CreditAdjustmentsCompanion.insert({
    required String id,
    required String customerId,
    required int amount,
    required String reason,
    required int date,
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       customerId = Value(customerId),
       amount = Value(amount),
       reason = Value(reason),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<CreditAdjustment> custom({
    Expression<String>? id,
    Expression<String>? customerId,
    Expression<int>? amount,
    Expression<String>? reason,
    Expression<int>? date,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (amount != null) 'amount': amount,
      if (reason != null) 'reason': reason,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CreditAdjustmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? customerId,
    Value<int>? amount,
    Value<String>? reason,
    Value<int>? date,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return CreditAdjustmentsCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      amount: amount ?? this.amount,
      reason: reason ?? this.reason,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DispatchesTable extends Dispatches
    with TableInfo<$DispatchesTable, Dispatche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DispatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refNoMeta = const VerificationMeta('refNo');
  @override
  late final GeneratedColumn<String> refNo = GeneratedColumn<String>(
    'ref_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _recipientNameMeta = const VerificationMeta(
    'recipientName',
  );
  @override
  late final GeneratedColumn<String> recipientName = GeneratedColumn<String>(
    'recipient_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipientPhoneMeta = const VerificationMeta(
    'recipientPhone',
  );
  @override
  late final GeneratedColumn<String> recipientPhone = GeneratedColumn<String>(
    'recipient_phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _recipientAddressMeta = const VerificationMeta(
    'recipientAddress',
  );
  @override
  late final GeneratedColumn<String> recipientAddress = GeneratedColumn<String>(
    'recipient_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _dispatchDateMeta = const VerificationMeta(
    'dispatchDate',
  );
  @override
  late final GeneratedColumn<int> dispatchDate = GeneratedColumn<int>(
    'dispatch_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agreedPriceMeta = const VerificationMeta(
    'agreedPrice',
  );
  @override
  late final GeneratedColumn<int> agreedPrice = GeneratedColumn<int>(
    'agreed_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('sent'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    refNo,
    recipientName,
    recipientPhone,
    recipientAddress,
    dispatchDate,
    agreedPrice,
    status,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dispatches';
  @override
  VerificationContext validateIntegrity(
    Insertable<Dispatche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('ref_no')) {
      context.handle(
        _refNoMeta,
        refNo.isAcceptableOrUnknown(data['ref_no']!, _refNoMeta),
      );
    } else if (isInserting) {
      context.missing(_refNoMeta);
    }
    if (data.containsKey('recipient_name')) {
      context.handle(
        _recipientNameMeta,
        recipientName.isAcceptableOrUnknown(
          data['recipient_name']!,
          _recipientNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recipientNameMeta);
    }
    if (data.containsKey('recipient_phone')) {
      context.handle(
        _recipientPhoneMeta,
        recipientPhone.isAcceptableOrUnknown(
          data['recipient_phone']!,
          _recipientPhoneMeta,
        ),
      );
    }
    if (data.containsKey('recipient_address')) {
      context.handle(
        _recipientAddressMeta,
        recipientAddress.isAcceptableOrUnknown(
          data['recipient_address']!,
          _recipientAddressMeta,
        ),
      );
    }
    if (data.containsKey('dispatch_date')) {
      context.handle(
        _dispatchDateMeta,
        dispatchDate.isAcceptableOrUnknown(
          data['dispatch_date']!,
          _dispatchDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dispatchDateMeta);
    }
    if (data.containsKey('agreed_price')) {
      context.handle(
        _agreedPriceMeta,
        agreedPrice.isAcceptableOrUnknown(
          data['agreed_price']!,
          _agreedPriceMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dispatche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dispatche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      refNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_no'],
      )!,
      recipientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient_name'],
      )!,
      recipientPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient_phone'],
      )!,
      recipientAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient_address'],
      )!,
      dispatchDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dispatch_date'],
      )!,
      agreedPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agreed_price'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DispatchesTable createAlias(String alias) {
    return $DispatchesTable(attachedDatabase, alias);
  }
}

class Dispatche extends DataClass implements Insertable<Dispatche> {
  final String id;
  final String refNo;
  final String recipientName;
  final String recipientPhone;
  final String recipientAddress;
  final int dispatchDate;
  final int agreedPrice;

  /// draft | sent | partially_sold | sold | partially_returned | returned | cancelled
  final String status;
  final String notes;
  final int createdAt;
  const Dispatche({
    required this.id,
    required this.refNo,
    required this.recipientName,
    required this.recipientPhone,
    required this.recipientAddress,
    required this.dispatchDate,
    required this.agreedPrice,
    required this.status,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ref_no'] = Variable<String>(refNo);
    map['recipient_name'] = Variable<String>(recipientName);
    map['recipient_phone'] = Variable<String>(recipientPhone);
    map['recipient_address'] = Variable<String>(recipientAddress);
    map['dispatch_date'] = Variable<int>(dispatchDate);
    map['agreed_price'] = Variable<int>(agreedPrice);
    map['status'] = Variable<String>(status);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  DispatchesCompanion toCompanion(bool nullToAbsent) {
    return DispatchesCompanion(
      id: Value(id),
      refNo: Value(refNo),
      recipientName: Value(recipientName),
      recipientPhone: Value(recipientPhone),
      recipientAddress: Value(recipientAddress),
      dispatchDate: Value(dispatchDate),
      agreedPrice: Value(agreedPrice),
      status: Value(status),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Dispatche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dispatche(
      id: serializer.fromJson<String>(json['id']),
      refNo: serializer.fromJson<String>(json['refNo']),
      recipientName: serializer.fromJson<String>(json['recipientName']),
      recipientPhone: serializer.fromJson<String>(json['recipientPhone']),
      recipientAddress: serializer.fromJson<String>(json['recipientAddress']),
      dispatchDate: serializer.fromJson<int>(json['dispatchDate']),
      agreedPrice: serializer.fromJson<int>(json['agreedPrice']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'refNo': serializer.toJson<String>(refNo),
      'recipientName': serializer.toJson<String>(recipientName),
      'recipientPhone': serializer.toJson<String>(recipientPhone),
      'recipientAddress': serializer.toJson<String>(recipientAddress),
      'dispatchDate': serializer.toJson<int>(dispatchDate),
      'agreedPrice': serializer.toJson<int>(agreedPrice),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Dispatche copyWith({
    String? id,
    String? refNo,
    String? recipientName,
    String? recipientPhone,
    String? recipientAddress,
    int? dispatchDate,
    int? agreedPrice,
    String? status,
    String? notes,
    int? createdAt,
  }) => Dispatche(
    id: id ?? this.id,
    refNo: refNo ?? this.refNo,
    recipientName: recipientName ?? this.recipientName,
    recipientPhone: recipientPhone ?? this.recipientPhone,
    recipientAddress: recipientAddress ?? this.recipientAddress,
    dispatchDate: dispatchDate ?? this.dispatchDate,
    agreedPrice: agreedPrice ?? this.agreedPrice,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Dispatche copyWithCompanion(DispatchesCompanion data) {
    return Dispatche(
      id: data.id.present ? data.id.value : this.id,
      refNo: data.refNo.present ? data.refNo.value : this.refNo,
      recipientName: data.recipientName.present
          ? data.recipientName.value
          : this.recipientName,
      recipientPhone: data.recipientPhone.present
          ? data.recipientPhone.value
          : this.recipientPhone,
      recipientAddress: data.recipientAddress.present
          ? data.recipientAddress.value
          : this.recipientAddress,
      dispatchDate: data.dispatchDate.present
          ? data.dispatchDate.value
          : this.dispatchDate,
      agreedPrice: data.agreedPrice.present
          ? data.agreedPrice.value
          : this.agreedPrice,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Dispatche(')
          ..write('id: $id, ')
          ..write('refNo: $refNo, ')
          ..write('recipientName: $recipientName, ')
          ..write('recipientPhone: $recipientPhone, ')
          ..write('recipientAddress: $recipientAddress, ')
          ..write('dispatchDate: $dispatchDate, ')
          ..write('agreedPrice: $agreedPrice, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    refNo,
    recipientName,
    recipientPhone,
    recipientAddress,
    dispatchDate,
    agreedPrice,
    status,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dispatche &&
          other.id == this.id &&
          other.refNo == this.refNo &&
          other.recipientName == this.recipientName &&
          other.recipientPhone == this.recipientPhone &&
          other.recipientAddress == this.recipientAddress &&
          other.dispatchDate == this.dispatchDate &&
          other.agreedPrice == this.agreedPrice &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class DispatchesCompanion extends UpdateCompanion<Dispatche> {
  final Value<String> id;
  final Value<String> refNo;
  final Value<String> recipientName;
  final Value<String> recipientPhone;
  final Value<String> recipientAddress;
  final Value<int> dispatchDate;
  final Value<int> agreedPrice;
  final Value<String> status;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const DispatchesCompanion({
    this.id = const Value.absent(),
    this.refNo = const Value.absent(),
    this.recipientName = const Value.absent(),
    this.recipientPhone = const Value.absent(),
    this.recipientAddress = const Value.absent(),
    this.dispatchDate = const Value.absent(),
    this.agreedPrice = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DispatchesCompanion.insert({
    required String id,
    required String refNo,
    required String recipientName,
    this.recipientPhone = const Value.absent(),
    this.recipientAddress = const Value.absent(),
    required int dispatchDate,
    this.agreedPrice = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       refNo = Value(refNo),
       recipientName = Value(recipientName),
       dispatchDate = Value(dispatchDate),
       createdAt = Value(createdAt);
  static Insertable<Dispatche> custom({
    Expression<String>? id,
    Expression<String>? refNo,
    Expression<String>? recipientName,
    Expression<String>? recipientPhone,
    Expression<String>? recipientAddress,
    Expression<int>? dispatchDate,
    Expression<int>? agreedPrice,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refNo != null) 'ref_no': refNo,
      if (recipientName != null) 'recipient_name': recipientName,
      if (recipientPhone != null) 'recipient_phone': recipientPhone,
      if (recipientAddress != null) 'recipient_address': recipientAddress,
      if (dispatchDate != null) 'dispatch_date': dispatchDate,
      if (agreedPrice != null) 'agreed_price': agreedPrice,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DispatchesCompanion copyWith({
    Value<String>? id,
    Value<String>? refNo,
    Value<String>? recipientName,
    Value<String>? recipientPhone,
    Value<String>? recipientAddress,
    Value<int>? dispatchDate,
    Value<int>? agreedPrice,
    Value<String>? status,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return DispatchesCompanion(
      id: id ?? this.id,
      refNo: refNo ?? this.refNo,
      recipientName: recipientName ?? this.recipientName,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      dispatchDate: dispatchDate ?? this.dispatchDate,
      agreedPrice: agreedPrice ?? this.agreedPrice,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (refNo.present) {
      map['ref_no'] = Variable<String>(refNo.value);
    }
    if (recipientName.present) {
      map['recipient_name'] = Variable<String>(recipientName.value);
    }
    if (recipientPhone.present) {
      map['recipient_phone'] = Variable<String>(recipientPhone.value);
    }
    if (recipientAddress.present) {
      map['recipient_address'] = Variable<String>(recipientAddress.value);
    }
    if (dispatchDate.present) {
      map['dispatch_date'] = Variable<int>(dispatchDate.value);
    }
    if (agreedPrice.present) {
      map['agreed_price'] = Variable<int>(agreedPrice.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DispatchesCompanion(')
          ..write('id: $id, ')
          ..write('refNo: $refNo, ')
          ..write('recipientName: $recipientName, ')
          ..write('recipientPhone: $recipientPhone, ')
          ..write('recipientAddress: $recipientAddress, ')
          ..write('dispatchDate: $dispatchDate, ')
          ..write('agreedPrice: $agreedPrice, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DispatchItemsTable extends DispatchItems
    with TableInfo<$DispatchItemsTable, DispatchItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DispatchItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dispatchIdMeta = const VerificationMeta(
    'dispatchId',
  );
  @override
  late final GeneratedColumn<String> dispatchId = GeneratedColumn<String>(
    'dispatch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<String> variantId = GeneratedColumn<String>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCostMeta = const VerificationMeta(
    'unitCost',
  );
  @override
  late final GeneratedColumn<int> unitCost = GeneratedColumn<int>(
    'unit_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agreedPriceMeta = const VerificationMeta(
    'agreedPrice',
  );
  @override
  late final GeneratedColumn<int> agreedPrice = GeneratedColumn<int>(
    'agreed_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('sent'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dispatchId,
    unitId,
    variantId,
    batchId,
    quantity,
    unitCost,
    agreedPrice,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dispatch_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<DispatchItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('dispatch_id')) {
      context.handle(
        _dispatchIdMeta,
        dispatchId.isAcceptableOrUnknown(data['dispatch_id']!, _dispatchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dispatchIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_cost')) {
      context.handle(
        _unitCostMeta,
        unitCost.isAcceptableOrUnknown(data['unit_cost']!, _unitCostMeta),
      );
    } else if (isInserting) {
      context.missing(_unitCostMeta);
    }
    if (data.containsKey('agreed_price')) {
      context.handle(
        _agreedPriceMeta,
        agreedPrice.isAcceptableOrUnknown(
          data['agreed_price']!,
          _agreedPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_agreedPriceMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DispatchItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DispatchItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dispatchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dispatch_id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_id'],
      )!,
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost'],
      )!,
      agreedPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agreed_price'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $DispatchItemsTable createAlias(String alias) {
    return $DispatchItemsTable(attachedDatabase, alias);
  }
}

class DispatchItem extends DataClass implements Insertable<DispatchItem> {
  final String id;
  final String dispatchId;
  final String? unitId;
  final String variantId;
  final String? batchId;
  final int quantity;
  final int unitCost;
  final int agreedPrice;

  /// sent | sold | returned | cancelled
  final String status;
  const DispatchItem({
    required this.id,
    required this.dispatchId,
    this.unitId,
    required this.variantId,
    this.batchId,
    required this.quantity,
    required this.unitCost,
    required this.agreedPrice,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['dispatch_id'] = Variable<String>(dispatchId);
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    map['variant_id'] = Variable<String>(variantId);
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['unit_cost'] = Variable<int>(unitCost);
    map['agreed_price'] = Variable<int>(agreedPrice);
    map['status'] = Variable<String>(status);
    return map;
  }

  DispatchItemsCompanion toCompanion(bool nullToAbsent) {
    return DispatchItemsCompanion(
      id: Value(id),
      dispatchId: Value(dispatchId),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      variantId: Value(variantId),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      quantity: Value(quantity),
      unitCost: Value(unitCost),
      agreedPrice: Value(agreedPrice),
      status: Value(status),
    );
  }

  factory DispatchItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DispatchItem(
      id: serializer.fromJson<String>(json['id']),
      dispatchId: serializer.fromJson<String>(json['dispatchId']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      variantId: serializer.fromJson<String>(json['variantId']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitCost: serializer.fromJson<int>(json['unitCost']),
      agreedPrice: serializer.fromJson<int>(json['agreedPrice']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dispatchId': serializer.toJson<String>(dispatchId),
      'unitId': serializer.toJson<String?>(unitId),
      'variantId': serializer.toJson<String>(variantId),
      'batchId': serializer.toJson<String?>(batchId),
      'quantity': serializer.toJson<int>(quantity),
      'unitCost': serializer.toJson<int>(unitCost),
      'agreedPrice': serializer.toJson<int>(agreedPrice),
      'status': serializer.toJson<String>(status),
    };
  }

  DispatchItem copyWith({
    String? id,
    String? dispatchId,
    Value<String?> unitId = const Value.absent(),
    String? variantId,
    Value<String?> batchId = const Value.absent(),
    int? quantity,
    int? unitCost,
    int? agreedPrice,
    String? status,
  }) => DispatchItem(
    id: id ?? this.id,
    dispatchId: dispatchId ?? this.dispatchId,
    unitId: unitId.present ? unitId.value : this.unitId,
    variantId: variantId ?? this.variantId,
    batchId: batchId.present ? batchId.value : this.batchId,
    quantity: quantity ?? this.quantity,
    unitCost: unitCost ?? this.unitCost,
    agreedPrice: agreedPrice ?? this.agreedPrice,
    status: status ?? this.status,
  );
  DispatchItem copyWithCompanion(DispatchItemsCompanion data) {
    return DispatchItem(
      id: data.id.present ? data.id.value : this.id,
      dispatchId: data.dispatchId.present
          ? data.dispatchId.value
          : this.dispatchId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitCost: data.unitCost.present ? data.unitCost.value : this.unitCost,
      agreedPrice: data.agreedPrice.present
          ? data.agreedPrice.value
          : this.agreedPrice,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DispatchItem(')
          ..write('id: $id, ')
          ..write('dispatchId: $dispatchId, ')
          ..write('unitId: $unitId, ')
          ..write('variantId: $variantId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('unitCost: $unitCost, ')
          ..write('agreedPrice: $agreedPrice, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dispatchId,
    unitId,
    variantId,
    batchId,
    quantity,
    unitCost,
    agreedPrice,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DispatchItem &&
          other.id == this.id &&
          other.dispatchId == this.dispatchId &&
          other.unitId == this.unitId &&
          other.variantId == this.variantId &&
          other.batchId == this.batchId &&
          other.quantity == this.quantity &&
          other.unitCost == this.unitCost &&
          other.agreedPrice == this.agreedPrice &&
          other.status == this.status);
}

class DispatchItemsCompanion extends UpdateCompanion<DispatchItem> {
  final Value<String> id;
  final Value<String> dispatchId;
  final Value<String?> unitId;
  final Value<String> variantId;
  final Value<String?> batchId;
  final Value<int> quantity;
  final Value<int> unitCost;
  final Value<int> agreedPrice;
  final Value<String> status;
  final Value<int> rowid;
  const DispatchItemsCompanion({
    this.id = const Value.absent(),
    this.dispatchId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.batchId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitCost = const Value.absent(),
    this.agreedPrice = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DispatchItemsCompanion.insert({
    required String id,
    required String dispatchId,
    this.unitId = const Value.absent(),
    required String variantId,
    this.batchId = const Value.absent(),
    required int quantity,
    required int unitCost,
    required int agreedPrice,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dispatchId = Value(dispatchId),
       variantId = Value(variantId),
       quantity = Value(quantity),
       unitCost = Value(unitCost),
       agreedPrice = Value(agreedPrice);
  static Insertable<DispatchItem> custom({
    Expression<String>? id,
    Expression<String>? dispatchId,
    Expression<String>? unitId,
    Expression<String>? variantId,
    Expression<String>? batchId,
    Expression<int>? quantity,
    Expression<int>? unitCost,
    Expression<int>? agreedPrice,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dispatchId != null) 'dispatch_id': dispatchId,
      if (unitId != null) 'unit_id': unitId,
      if (variantId != null) 'variant_id': variantId,
      if (batchId != null) 'batch_id': batchId,
      if (quantity != null) 'quantity': quantity,
      if (unitCost != null) 'unit_cost': unitCost,
      if (agreedPrice != null) 'agreed_price': agreedPrice,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DispatchItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? dispatchId,
    Value<String?>? unitId,
    Value<String>? variantId,
    Value<String?>? batchId,
    Value<int>? quantity,
    Value<int>? unitCost,
    Value<int>? agreedPrice,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return DispatchItemsCompanion(
      id: id ?? this.id,
      dispatchId: dispatchId ?? this.dispatchId,
      unitId: unitId ?? this.unitId,
      variantId: variantId ?? this.variantId,
      batchId: batchId ?? this.batchId,
      quantity: quantity ?? this.quantity,
      unitCost: unitCost ?? this.unitCost,
      agreedPrice: agreedPrice ?? this.agreedPrice,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dispatchId.present) {
      map['dispatch_id'] = Variable<String>(dispatchId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<String>(variantId.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitCost.present) {
      map['unit_cost'] = Variable<int>(unitCost.value);
    }
    if (agreedPrice.present) {
      map['agreed_price'] = Variable<int>(agreedPrice.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DispatchItemsCompanion(')
          ..write('id: $id, ')
          ..write('dispatchId: $dispatchId, ')
          ..write('unitId: $unitId, ')
          ..write('variantId: $variantId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('unitCost: $unitCost, ')
          ..write('agreedPrice: $agreedPrice, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConsignmentSalesTable extends ConsignmentSales
    with TableInfo<$ConsignmentSalesTable, ConsignmentSale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConsignmentSalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dispatchItemIdMeta = const VerificationMeta(
    'dispatchItemId',
  );
  @override
  late final GeneratedColumn<String> dispatchItemId = GeneratedColumn<String>(
    'dispatch_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salePriceMeta = const VerificationMeta(
    'salePrice',
  );
  @override
  late final GeneratedColumn<int> salePrice = GeneratedColumn<int>(
    'sale_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountReceivedMeta = const VerificationMeta(
    'amountReceived',
  );
  @override
  late final GeneratedColumn<int> amountReceived = GeneratedColumn<int>(
    'amount_received',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dispatchItemId,
    quantity,
    salePrice,
    amountReceived,
    date,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'consignment_sales';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConsignmentSale> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('dispatch_item_id')) {
      context.handle(
        _dispatchItemIdMeta,
        dispatchItemId.isAcceptableOrUnknown(
          data['dispatch_item_id']!,
          _dispatchItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dispatchItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('sale_price')) {
      context.handle(
        _salePriceMeta,
        salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta),
      );
    } else if (isInserting) {
      context.missing(_salePriceMeta);
    }
    if (data.containsKey('amount_received')) {
      context.handle(
        _amountReceivedMeta,
        amountReceived.isAcceptableOrUnknown(
          data['amount_received']!,
          _amountReceivedMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConsignmentSale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConsignmentSale(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dispatchItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dispatch_item_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      salePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sale_price'],
      )!,
      amountReceived: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_received'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ConsignmentSalesTable createAlias(String alias) {
    return $ConsignmentSalesTable(attachedDatabase, alias);
  }
}

class ConsignmentSale extends DataClass implements Insertable<ConsignmentSale> {
  final String id;
  final String dispatchItemId;
  final int quantity;
  final int salePrice;
  final int amountReceived;
  final int date;
  final int createdAt;
  const ConsignmentSale({
    required this.id,
    required this.dispatchItemId,
    required this.quantity,
    required this.salePrice,
    required this.amountReceived,
    required this.date,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['dispatch_item_id'] = Variable<String>(dispatchItemId);
    map['quantity'] = Variable<int>(quantity);
    map['sale_price'] = Variable<int>(salePrice);
    map['amount_received'] = Variable<int>(amountReceived);
    map['date'] = Variable<int>(date);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ConsignmentSalesCompanion toCompanion(bool nullToAbsent) {
    return ConsignmentSalesCompanion(
      id: Value(id),
      dispatchItemId: Value(dispatchItemId),
      quantity: Value(quantity),
      salePrice: Value(salePrice),
      amountReceived: Value(amountReceived),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory ConsignmentSale.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConsignmentSale(
      id: serializer.fromJson<String>(json['id']),
      dispatchItemId: serializer.fromJson<String>(json['dispatchItemId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      salePrice: serializer.fromJson<int>(json['salePrice']),
      amountReceived: serializer.fromJson<int>(json['amountReceived']),
      date: serializer.fromJson<int>(json['date']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dispatchItemId': serializer.toJson<String>(dispatchItemId),
      'quantity': serializer.toJson<int>(quantity),
      'salePrice': serializer.toJson<int>(salePrice),
      'amountReceived': serializer.toJson<int>(amountReceived),
      'date': serializer.toJson<int>(date),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  ConsignmentSale copyWith({
    String? id,
    String? dispatchItemId,
    int? quantity,
    int? salePrice,
    int? amountReceived,
    int? date,
    int? createdAt,
  }) => ConsignmentSale(
    id: id ?? this.id,
    dispatchItemId: dispatchItemId ?? this.dispatchItemId,
    quantity: quantity ?? this.quantity,
    salePrice: salePrice ?? this.salePrice,
    amountReceived: amountReceived ?? this.amountReceived,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
  );
  ConsignmentSale copyWithCompanion(ConsignmentSalesCompanion data) {
    return ConsignmentSale(
      id: data.id.present ? data.id.value : this.id,
      dispatchItemId: data.dispatchItemId.present
          ? data.dispatchItemId.value
          : this.dispatchItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      amountReceived: data.amountReceived.present
          ? data.amountReceived.value
          : this.amountReceived,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConsignmentSale(')
          ..write('id: $id, ')
          ..write('dispatchItemId: $dispatchItemId, ')
          ..write('quantity: $quantity, ')
          ..write('salePrice: $salePrice, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dispatchItemId,
    quantity,
    salePrice,
    amountReceived,
    date,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConsignmentSale &&
          other.id == this.id &&
          other.dispatchItemId == this.dispatchItemId &&
          other.quantity == this.quantity &&
          other.salePrice == this.salePrice &&
          other.amountReceived == this.amountReceived &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class ConsignmentSalesCompanion extends UpdateCompanion<ConsignmentSale> {
  final Value<String> id;
  final Value<String> dispatchItemId;
  final Value<int> quantity;
  final Value<int> salePrice;
  final Value<int> amountReceived;
  final Value<int> date;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ConsignmentSalesCompanion({
    this.id = const Value.absent(),
    this.dispatchItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.amountReceived = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConsignmentSalesCompanion.insert({
    required String id,
    required String dispatchItemId,
    required int quantity,
    required int salePrice,
    this.amountReceived = const Value.absent(),
    required int date,
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dispatchItemId = Value(dispatchItemId),
       quantity = Value(quantity),
       salePrice = Value(salePrice),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<ConsignmentSale> custom({
    Expression<String>? id,
    Expression<String>? dispatchItemId,
    Expression<int>? quantity,
    Expression<int>? salePrice,
    Expression<int>? amountReceived,
    Expression<int>? date,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dispatchItemId != null) 'dispatch_item_id': dispatchItemId,
      if (quantity != null) 'quantity': quantity,
      if (salePrice != null) 'sale_price': salePrice,
      if (amountReceived != null) 'amount_received': amountReceived,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConsignmentSalesCompanion copyWith({
    Value<String>? id,
    Value<String>? dispatchItemId,
    Value<int>? quantity,
    Value<int>? salePrice,
    Value<int>? amountReceived,
    Value<int>? date,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ConsignmentSalesCompanion(
      id: id ?? this.id,
      dispatchItemId: dispatchItemId ?? this.dispatchItemId,
      quantity: quantity ?? this.quantity,
      salePrice: salePrice ?? this.salePrice,
      amountReceived: amountReceived ?? this.amountReceived,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dispatchItemId.present) {
      map['dispatch_item_id'] = Variable<String>(dispatchItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<int>(salePrice.value);
    }
    if (amountReceived.present) {
      map['amount_received'] = Variable<int>(amountReceived.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsignmentSalesCompanion(')
          ..write('id: $id, ')
          ..write('dispatchItemId: $dispatchItemId, ')
          ..write('quantity: $quantity, ')
          ..write('salePrice: $salePrice, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductReturnsTable extends ProductReturns
    with TableInfo<$ProductReturnsTable, ProductReturn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductReturnsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
    'sale_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<String> variantId = GeneratedColumn<String>(
    'variant_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _batchIdMeta = const VerificationMeta(
    'batchId',
  );
  @override
  late final GeneratedColumn<String> batchId = GeneratedColumn<String>(
    'batch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _refundAmountMeta = const VerificationMeta(
    'refundAmount',
  );
  @override
  late final GeneratedColumn<int> refundAmount = GeneratedColumn<int>(
    'refund_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _restockMeta = const VerificationMeta(
    'restock',
  );
  @override
  late final GeneratedColumn<int> restock = GeneratedColumn<int>(
    'restock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    saleId,
    unitId,
    variantId,
    batchId,
    quantity,
    refundAmount,
    reason,
    restock,
    date,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_returns';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductReturn> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sale_id')) {
      context.handle(
        _saleIdMeta,
        saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta),
      );
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    }
    if (data.containsKey('batch_id')) {
      context.handle(
        _batchIdMeta,
        batchId.isAcceptableOrUnknown(data['batch_id']!, _batchIdMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('refund_amount')) {
      context.handle(
        _refundAmountMeta,
        refundAmount.isAcceptableOrUnknown(
          data['refund_amount']!,
          _refundAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_refundAmountMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    if (data.containsKey('restock')) {
      context.handle(
        _restockMeta,
        restock.isAcceptableOrUnknown(data['restock']!, _restockMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductReturn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductReturn(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      saleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_id'],
      ),
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      ),
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_id'],
      ),
      batchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_id'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      refundAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}refund_amount'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      restock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}restock'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductReturnsTable createAlias(String alias) {
    return $ProductReturnsTable(attachedDatabase, alias);
  }
}

class ProductReturn extends DataClass implements Insertable<ProductReturn> {
  final String id;
  final String? saleId;
  final String? unitId;
  final String? variantId;
  final String? batchId;
  final int quantity;
  final int refundAmount;
  final String reason;
  final int restock;
  final int date;
  final int createdAt;
  const ProductReturn({
    required this.id,
    this.saleId,
    this.unitId,
    this.variantId,
    this.batchId,
    required this.quantity,
    required this.refundAmount,
    required this.reason,
    required this.restock,
    required this.date,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || saleId != null) {
      map['sale_id'] = Variable<String>(saleId);
    }
    if (!nullToAbsent || unitId != null) {
      map['unit_id'] = Variable<String>(unitId);
    }
    if (!nullToAbsent || variantId != null) {
      map['variant_id'] = Variable<String>(variantId);
    }
    if (!nullToAbsent || batchId != null) {
      map['batch_id'] = Variable<String>(batchId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['refund_amount'] = Variable<int>(refundAmount);
    map['reason'] = Variable<String>(reason);
    map['restock'] = Variable<int>(restock);
    map['date'] = Variable<int>(date);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ProductReturnsCompanion toCompanion(bool nullToAbsent) {
    return ProductReturnsCompanion(
      id: Value(id),
      saleId: saleId == null && nullToAbsent
          ? const Value.absent()
          : Value(saleId),
      unitId: unitId == null && nullToAbsent
          ? const Value.absent()
          : Value(unitId),
      variantId: variantId == null && nullToAbsent
          ? const Value.absent()
          : Value(variantId),
      batchId: batchId == null && nullToAbsent
          ? const Value.absent()
          : Value(batchId),
      quantity: Value(quantity),
      refundAmount: Value(refundAmount),
      reason: Value(reason),
      restock: Value(restock),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory ProductReturn.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductReturn(
      id: serializer.fromJson<String>(json['id']),
      saleId: serializer.fromJson<String?>(json['saleId']),
      unitId: serializer.fromJson<String?>(json['unitId']),
      variantId: serializer.fromJson<String?>(json['variantId']),
      batchId: serializer.fromJson<String?>(json['batchId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      refundAmount: serializer.fromJson<int>(json['refundAmount']),
      reason: serializer.fromJson<String>(json['reason']),
      restock: serializer.fromJson<int>(json['restock']),
      date: serializer.fromJson<int>(json['date']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'saleId': serializer.toJson<String?>(saleId),
      'unitId': serializer.toJson<String?>(unitId),
      'variantId': serializer.toJson<String?>(variantId),
      'batchId': serializer.toJson<String?>(batchId),
      'quantity': serializer.toJson<int>(quantity),
      'refundAmount': serializer.toJson<int>(refundAmount),
      'reason': serializer.toJson<String>(reason),
      'restock': serializer.toJson<int>(restock),
      'date': serializer.toJson<int>(date),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  ProductReturn copyWith({
    String? id,
    Value<String?> saleId = const Value.absent(),
    Value<String?> unitId = const Value.absent(),
    Value<String?> variantId = const Value.absent(),
    Value<String?> batchId = const Value.absent(),
    int? quantity,
    int? refundAmount,
    String? reason,
    int? restock,
    int? date,
    int? createdAt,
  }) => ProductReturn(
    id: id ?? this.id,
    saleId: saleId.present ? saleId.value : this.saleId,
    unitId: unitId.present ? unitId.value : this.unitId,
    variantId: variantId.present ? variantId.value : this.variantId,
    batchId: batchId.present ? batchId.value : this.batchId,
    quantity: quantity ?? this.quantity,
    refundAmount: refundAmount ?? this.refundAmount,
    reason: reason ?? this.reason,
    restock: restock ?? this.restock,
    date: date ?? this.date,
    createdAt: createdAt ?? this.createdAt,
  );
  ProductReturn copyWithCompanion(ProductReturnsCompanion data) {
    return ProductReturn(
      id: data.id.present ? data.id.value : this.id,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
      batchId: data.batchId.present ? data.batchId.value : this.batchId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      refundAmount: data.refundAmount.present
          ? data.refundAmount.value
          : this.refundAmount,
      reason: data.reason.present ? data.reason.value : this.reason,
      restock: data.restock.present ? data.restock.value : this.restock,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductReturn(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('unitId: $unitId, ')
          ..write('variantId: $variantId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('refundAmount: $refundAmount, ')
          ..write('reason: $reason, ')
          ..write('restock: $restock, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    saleId,
    unitId,
    variantId,
    batchId,
    quantity,
    refundAmount,
    reason,
    restock,
    date,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductReturn &&
          other.id == this.id &&
          other.saleId == this.saleId &&
          other.unitId == this.unitId &&
          other.variantId == this.variantId &&
          other.batchId == this.batchId &&
          other.quantity == this.quantity &&
          other.refundAmount == this.refundAmount &&
          other.reason == this.reason &&
          other.restock == this.restock &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class ProductReturnsCompanion extends UpdateCompanion<ProductReturn> {
  final Value<String> id;
  final Value<String?> saleId;
  final Value<String?> unitId;
  final Value<String?> variantId;
  final Value<String?> batchId;
  final Value<int> quantity;
  final Value<int> refundAmount;
  final Value<String> reason;
  final Value<int> restock;
  final Value<int> date;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ProductReturnsCompanion({
    this.id = const Value.absent(),
    this.saleId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.batchId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.refundAmount = const Value.absent(),
    this.reason = const Value.absent(),
    this.restock = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductReturnsCompanion.insert({
    required String id,
    this.saleId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.batchId = const Value.absent(),
    required int quantity,
    required int refundAmount,
    this.reason = const Value.absent(),
    this.restock = const Value.absent(),
    required int date,
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       quantity = Value(quantity),
       refundAmount = Value(refundAmount),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<ProductReturn> custom({
    Expression<String>? id,
    Expression<String>? saleId,
    Expression<String>? unitId,
    Expression<String>? variantId,
    Expression<String>? batchId,
    Expression<int>? quantity,
    Expression<int>? refundAmount,
    Expression<String>? reason,
    Expression<int>? restock,
    Expression<int>? date,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleId != null) 'sale_id': saleId,
      if (unitId != null) 'unit_id': unitId,
      if (variantId != null) 'variant_id': variantId,
      if (batchId != null) 'batch_id': batchId,
      if (quantity != null) 'quantity': quantity,
      if (refundAmount != null) 'refund_amount': refundAmount,
      if (reason != null) 'reason': reason,
      if (restock != null) 'restock': restock,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductReturnsCompanion copyWith({
    Value<String>? id,
    Value<String?>? saleId,
    Value<String?>? unitId,
    Value<String?>? variantId,
    Value<String?>? batchId,
    Value<int>? quantity,
    Value<int>? refundAmount,
    Value<String>? reason,
    Value<int>? restock,
    Value<int>? date,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ProductReturnsCompanion(
      id: id ?? this.id,
      saleId: saleId ?? this.saleId,
      unitId: unitId ?? this.unitId,
      variantId: variantId ?? this.variantId,
      batchId: batchId ?? this.batchId,
      quantity: quantity ?? this.quantity,
      refundAmount: refundAmount ?? this.refundAmount,
      reason: reason ?? this.reason,
      restock: restock ?? this.restock,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<String>(variantId.value);
    }
    if (batchId.present) {
      map['batch_id'] = Variable<String>(batchId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (refundAmount.present) {
      map['refund_amount'] = Variable<int>(refundAmount.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (restock.present) {
      map['restock'] = Variable<int>(restock.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductReturnsCompanion(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('unitId: $unitId, ')
          ..write('variantId: $variantId, ')
          ..write('batchId: $batchId, ')
          ..write('quantity: $quantity, ')
          ..write('refundAmount: $refundAmount, ')
          ..write('reason: $reason, ')
          ..write('restock: $restock, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RefundsTable extends Refunds with TableInfo<$RefundsTable, Refund> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RefundsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _returnIdMeta = const VerificationMeta(
    'returnId',
  );
  @override
  late final GeneratedColumn<String> returnId = GeneratedColumn<String>(
    'return_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    returnId,
    amount,
    date,
    method,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'refunds';
  @override
  VerificationContext validateIntegrity(
    Insertable<Refund> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('return_id')) {
      context.handle(
        _returnIdMeta,
        returnId.isAcceptableOrUnknown(data['return_id']!, _returnIdMeta),
      );
    } else if (isInserting) {
      context.missing(_returnIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Refund map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Refund(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      returnId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RefundsTable createAlias(String alias) {
    return $RefundsTable(attachedDatabase, alias);
  }
}

class Refund extends DataClass implements Insertable<Refund> {
  final String id;
  final String returnId;
  final int amount;
  final int date;
  final String method;
  final int createdAt;
  const Refund({
    required this.id,
    required this.returnId,
    required this.amount,
    required this.date,
    required this.method,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['return_id'] = Variable<String>(returnId);
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<int>(date);
    map['method'] = Variable<String>(method);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  RefundsCompanion toCompanion(bool nullToAbsent) {
    return RefundsCompanion(
      id: Value(id),
      returnId: Value(returnId),
      amount: Value(amount),
      date: Value(date),
      method: Value(method),
      createdAt: Value(createdAt),
    );
  }

  factory Refund.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Refund(
      id: serializer.fromJson<String>(json['id']),
      returnId: serializer.fromJson<String>(json['returnId']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<int>(json['date']),
      method: serializer.fromJson<String>(json['method']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'returnId': serializer.toJson<String>(returnId),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<int>(date),
      'method': serializer.toJson<String>(method),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Refund copyWith({
    String? id,
    String? returnId,
    int? amount,
    int? date,
    String? method,
    int? createdAt,
  }) => Refund(
    id: id ?? this.id,
    returnId: returnId ?? this.returnId,
    amount: amount ?? this.amount,
    date: date ?? this.date,
    method: method ?? this.method,
    createdAt: createdAt ?? this.createdAt,
  );
  Refund copyWithCompanion(RefundsCompanion data) {
    return Refund(
      id: data.id.present ? data.id.value : this.id,
      returnId: data.returnId.present ? data.returnId.value : this.returnId,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
      method: data.method.present ? data.method.value : this.method,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Refund(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, returnId, amount, date, method, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Refund &&
          other.id == this.id &&
          other.returnId == this.returnId &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.method == this.method &&
          other.createdAt == this.createdAt);
}

class RefundsCompanion extends UpdateCompanion<Refund> {
  final Value<String> id;
  final Value<String> returnId;
  final Value<int> amount;
  final Value<int> date;
  final Value<String> method;
  final Value<int> createdAt;
  final Value<int> rowid;
  const RefundsCompanion({
    this.id = const Value.absent(),
    this.returnId = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.method = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RefundsCompanion.insert({
    required String id,
    required String returnId,
    required int amount,
    required int date,
    this.method = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       returnId = Value(returnId),
       amount = Value(amount),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<Refund> custom({
    Expression<String>? id,
    Expression<String>? returnId,
    Expression<int>? amount,
    Expression<int>? date,
    Expression<String>? method,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (returnId != null) 'return_id': returnId,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (method != null) 'method': method,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RefundsCompanion copyWith({
    Value<String>? id,
    Value<String>? returnId,
    Value<int>? amount,
    Value<int>? date,
    Value<String>? method,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return RefundsCompanion(
      id: id ?? this.id,
      returnId: returnId ?? this.returnId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      method: method ?? this.method,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (returnId.present) {
      map['return_id'] = Variable<String>(returnId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefundsCompanion(')
          ..write('id: $id, ')
          ..write('returnId: $returnId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('method: $method, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpenseCategoriesTable extends ExpenseCategories
    with TableInfo<$ExpenseCategoriesTable, ExpenseCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $ExpenseCategoriesTable createAlias(String alias) {
    return $ExpenseCategoriesTable(attachedDatabase, alias);
  }
}

class ExpenseCategory extends DataClass implements Insertable<ExpenseCategory> {
  final String id;
  final String name;
  const ExpenseCategory({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ExpenseCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory ExpenseCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseCategory(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ExpenseCategory copyWith({String? id, String? name}) =>
      ExpenseCategory(id: id ?? this.id, name: name ?? this.name);
  ExpenseCategory copyWithCompanion(ExpenseCategoriesCompanion data) {
    return ExpenseCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategory(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseCategory &&
          other.id == this.id &&
          other.name == this.name);
}

class ExpenseCategoriesCompanion extends UpdateCompanion<ExpenseCategory> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const ExpenseCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpenseCategoriesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<ExpenseCategory> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpenseCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return ExpenseCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    description,
    date,
    amount,
    method,
    reference,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final String id;
  final String categoryId;
  final String description;
  final int date;
  final int amount;
  final String method;
  final String reference;
  final String notes;
  final int createdAt;
  const Expense({
    required this.id,
    required this.categoryId,
    required this.description,
    required this.date,
    required this.amount,
    required this.method,
    required this.reference,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category_id'] = Variable<String>(categoryId);
    map['description'] = Variable<String>(description);
    map['date'] = Variable<int>(date);
    map['amount'] = Variable<int>(amount);
    map['method'] = Variable<String>(method);
    map['reference'] = Variable<String>(reference);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      description: Value(description),
      date: Value(date),
      amount: Value(amount),
      method: Value(method),
      reference: Value(reference),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<String>(json['id']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      description: serializer.fromJson<String>(json['description']),
      date: serializer.fromJson<int>(json['date']),
      amount: serializer.fromJson<int>(json['amount']),
      method: serializer.fromJson<String>(json['method']),
      reference: serializer.fromJson<String>(json['reference']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'categoryId': serializer.toJson<String>(categoryId),
      'description': serializer.toJson<String>(description),
      'date': serializer.toJson<int>(date),
      'amount': serializer.toJson<int>(amount),
      'method': serializer.toJson<String>(method),
      'reference': serializer.toJson<String>(reference),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Expense copyWith({
    String? id,
    String? categoryId,
    String? description,
    int? date,
    int? amount,
    String? method,
    String? reference,
    String? notes,
    int? createdAt,
  }) => Expense(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    description: description ?? this.description,
    date: date ?? this.date,
    amount: amount ?? this.amount,
    method: method ?? this.method,
    reference: reference ?? this.reference,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      description: data.description.present
          ? data.description.value
          : this.description,
      date: data.date.present ? data.date.value : this.date,
      amount: data.amount.present ? data.amount.value : this.amount,
      method: data.method.present ? data.method.value : this.method,
      reference: data.reference.present ? data.reference.value : this.reference,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('method: $method, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    categoryId,
    description,
    date,
    amount,
    method,
    reference,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.description == this.description &&
          other.date == this.date &&
          other.amount == this.amount &&
          other.method == this.method &&
          other.reference == this.reference &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<String> id;
  final Value<String> categoryId;
  final Value<String> description;
  final Value<int> date;
  final Value<int> amount;
  final Value<String> method;
  final Value<String> reference;
  final Value<String> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.method = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesCompanion.insert({
    required String id,
    required String categoryId,
    required String description,
    required int date,
    required int amount,
    this.method = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       categoryId = Value(categoryId),
       description = Value(description),
       date = Value(date),
       amount = Value(amount),
       createdAt = Value(createdAt);
  static Insertable<Expense> custom({
    Expression<String>? id,
    Expression<String>? categoryId,
    Expression<String>? description,
    Expression<int>? date,
    Expression<int>? amount,
    Expression<String>? method,
    Expression<String>? reference,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
      if (method != null) 'method': method,
      if (reference != null) 'reference': reference,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesCompanion copyWith({
    Value<String>? id,
    Value<String>? categoryId,
    Value<String>? description,
    Value<int>? date,
    Value<int>? amount,
    Value<String>? method,
    Value<String>? reference,
    Value<String>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ExpensesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      method: method ?? this.method,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('method: $method, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupMetadataTable extends BackupMetadata
    with TableInfo<$BackupMetadataTable, BackupMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _appVersionMeta = const VerificationMeta(
    'appVersion',
  );
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
    'app_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('1.0.0'),
  );
  static const VerificationMeta _dbVersionMeta = const VerificationMeta(
    'dbVersion',
  );
  @override
  late final GeneratedColumn<int> dbVersion = GeneratedColumn<int>(
    'db_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fileName,
    createdAt,
    sizeBytes,
    appVersion,
    dbVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    }
    if (data.containsKey('app_version')) {
      context.handle(
        _appVersionMeta,
        appVersion.isAcceptableOrUnknown(data['app_version']!, _appVersionMeta),
      );
    }
    if (data.containsKey('db_version')) {
      context.handle(
        _dbVersionMeta,
        dbVersion.isAcceptableOrUnknown(data['db_version']!, _dbVersionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupMetadataData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      )!,
      appVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_version'],
      )!,
      dbVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}db_version'],
      )!,
    );
  }

  @override
  $BackupMetadataTable createAlias(String alias) {
    return $BackupMetadataTable(attachedDatabase, alias);
  }
}

class BackupMetadataData extends DataClass
    implements Insertable<BackupMetadataData> {
  final int id;
  final String fileName;
  final int createdAt;
  final int sizeBytes;
  final String appVersion;
  final int dbVersion;
  const BackupMetadataData({
    required this.id,
    required this.fileName,
    required this.createdAt,
    required this.sizeBytes,
    required this.appVersion,
    required this.dbVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_name'] = Variable<String>(fileName);
    map['created_at'] = Variable<int>(createdAt);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['app_version'] = Variable<String>(appVersion);
    map['db_version'] = Variable<int>(dbVersion);
    return map;
  }

  BackupMetadataCompanion toCompanion(bool nullToAbsent) {
    return BackupMetadataCompanion(
      id: Value(id),
      fileName: Value(fileName),
      createdAt: Value(createdAt),
      sizeBytes: Value(sizeBytes),
      appVersion: Value(appVersion),
      dbVersion: Value(dbVersion),
    );
  }

  factory BackupMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupMetadataData(
      id: serializer.fromJson<int>(json['id']),
      fileName: serializer.fromJson<String>(json['fileName']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      appVersion: serializer.fromJson<String>(json['appVersion']),
      dbVersion: serializer.fromJson<int>(json['dbVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fileName': serializer.toJson<String>(fileName),
      'createdAt': serializer.toJson<int>(createdAt),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'appVersion': serializer.toJson<String>(appVersion),
      'dbVersion': serializer.toJson<int>(dbVersion),
    };
  }

  BackupMetadataData copyWith({
    int? id,
    String? fileName,
    int? createdAt,
    int? sizeBytes,
    String? appVersion,
    int? dbVersion,
  }) => BackupMetadataData(
    id: id ?? this.id,
    fileName: fileName ?? this.fileName,
    createdAt: createdAt ?? this.createdAt,
    sizeBytes: sizeBytes ?? this.sizeBytes,
    appVersion: appVersion ?? this.appVersion,
    dbVersion: dbVersion ?? this.dbVersion,
  );
  BackupMetadataData copyWithCompanion(BackupMetadataCompanion data) {
    return BackupMetadataData(
      id: data.id.present ? data.id.value : this.id,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      appVersion: data.appVersion.present
          ? data.appVersion.value
          : this.appVersion,
      dbVersion: data.dbVersion.present ? data.dbVersion.value : this.dbVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupMetadataData(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('createdAt: $createdAt, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('appVersion: $appVersion, ')
          ..write('dbVersion: $dbVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fileName, createdAt, sizeBytes, appVersion, dbVersion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupMetadataData &&
          other.id == this.id &&
          other.fileName == this.fileName &&
          other.createdAt == this.createdAt &&
          other.sizeBytes == this.sizeBytes &&
          other.appVersion == this.appVersion &&
          other.dbVersion == this.dbVersion);
}

class BackupMetadataCompanion extends UpdateCompanion<BackupMetadataData> {
  final Value<int> id;
  final Value<String> fileName;
  final Value<int> createdAt;
  final Value<int> sizeBytes;
  final Value<String> appVersion;
  final Value<int> dbVersion;
  const BackupMetadataCompanion({
    this.id = const Value.absent(),
    this.fileName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.dbVersion = const Value.absent(),
  });
  BackupMetadataCompanion.insert({
    this.id = const Value.absent(),
    required String fileName,
    required int createdAt,
    this.sizeBytes = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.dbVersion = const Value.absent(),
  }) : fileName = Value(fileName),
       createdAt = Value(createdAt);
  static Insertable<BackupMetadataData> custom({
    Expression<int>? id,
    Expression<String>? fileName,
    Expression<int>? createdAt,
    Expression<int>? sizeBytes,
    Expression<String>? appVersion,
    Expression<int>? dbVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileName != null) 'file_name': fileName,
      if (createdAt != null) 'created_at': createdAt,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (appVersion != null) 'app_version': appVersion,
      if (dbVersion != null) 'db_version': dbVersion,
    });
  }

  BackupMetadataCompanion copyWith({
    Value<int>? id,
    Value<String>? fileName,
    Value<int>? createdAt,
    Value<int>? sizeBytes,
    Value<String>? appVersion,
    Value<int>? dbVersion,
  }) {
    return BackupMetadataCompanion(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      createdAt: createdAt ?? this.createdAt,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      appVersion: appVersion ?? this.appVersion,
      dbVersion: dbVersion ?? this.dbVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    if (dbVersion.present) {
      map['db_version'] = Variable<int>(dbVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupMetadataCompanion(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('createdAt: $createdAt, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('appVersion: $appVersion, ')
          ..write('dbVersion: $dbVersion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ShopSettingsTable shopSettings = $ShopSettingsTable(this);
  late final $AppMetadataTable appMetadata = $AppMetadataTable(this);
  late final $LocalUsersTable localUsers = $LocalUsersTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final $BrandsTable brands = $BrandsTable(this);
  late final $ProductModelsTable productModels = $ProductModelsTable(this);
  late final $ProductVariantsTable productVariants = $ProductVariantsTable(
    this,
  );
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $InventoryUnitsTable inventoryUnits = $InventoryUnitsTable(this);
  late final $StockBatchesTable stockBatches = $StockBatchesTable(this);
  late final $StockMovementsTable stockMovements = $StockMovementsTable(this);
  late final $PurchaseInvoicesTable purchaseInvoices = $PurchaseInvoicesTable(
    this,
  );
  late final $PurchaseItemsTable purchaseItems = $PurchaseItemsTable(this);
  late final $SupplierPaymentsTable supplierPayments = $SupplierPaymentsTable(
    this,
  );
  late final $CustomersTable customers = $CustomersTable(this);
  late final $SalesInvoicesTable salesInvoices = $SalesInvoicesTable(this);
  late final $SalesItemsTable salesItems = $SalesItemsTable(this);
  late final $CustomerPaymentsTable customerPayments = $CustomerPaymentsTable(
    this,
  );
  late final $PaymentAllocationsTable paymentAllocations =
      $PaymentAllocationsTable(this);
  late final $CreditAdjustmentsTable creditAdjustments =
      $CreditAdjustmentsTable(this);
  late final $DispatchesTable dispatches = $DispatchesTable(this);
  late final $DispatchItemsTable dispatchItems = $DispatchItemsTable(this);
  late final $ConsignmentSalesTable consignmentSales = $ConsignmentSalesTable(
    this,
  );
  late final $ProductReturnsTable productReturns = $ProductReturnsTable(this);
  late final $RefundsTable refunds = $RefundsTable(this);
  late final $ExpenseCategoriesTable expenseCategories =
      $ExpenseCategoriesTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $BackupMetadataTable backupMetadata = $BackupMetadataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    shopSettings,
    appMetadata,
    localUsers,
    auditLogs,
    brands,
    productModels,
    productVariants,
    suppliers,
    inventoryUnits,
    stockBatches,
    stockMovements,
    purchaseInvoices,
    purchaseItems,
    supplierPayments,
    customers,
    salesInvoices,
    salesItems,
    customerPayments,
    paymentAllocations,
    creditAdjustments,
    dispatches,
    dispatchItems,
    consignmentSales,
    productReturns,
    refunds,
    expenseCategories,
    expenses,
    backupMetadata,
  ];
}

typedef $$ShopSettingsTableCreateCompanionBuilder =
    ShopSettingsCompanion Function({
      Value<int> id,
      Value<String> shopName,
      Value<String> subtitle,
      Value<String> contactNumber,
      Value<String> address,
      Value<String> invoiceFooter,
      Value<String> currency,
      Value<String> themeMode,
      Value<String> invoiceFormat,
      Value<int> lowStockThreshold,
      Value<String> dateFormat,
      Value<int> setupDone,
      Value<String> whatsappTemplate,
    });
typedef $$ShopSettingsTableUpdateCompanionBuilder =
    ShopSettingsCompanion Function({
      Value<int> id,
      Value<String> shopName,
      Value<String> subtitle,
      Value<String> contactNumber,
      Value<String> address,
      Value<String> invoiceFooter,
      Value<String> currency,
      Value<String> themeMode,
      Value<String> invoiceFormat,
      Value<int> lowStockThreshold,
      Value<String> dateFormat,
      Value<int> setupDone,
      Value<String> whatsappTemplate,
    });

class $$ShopSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $ShopSettingsTable> {
  $$ShopSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shopName => $composableBuilder(
    column: $table.shopName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceFooter => $composableBuilder(
    column: $table.invoiceFooter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceFormat => $composableBuilder(
    column: $table.invoiceFormat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lowStockThreshold => $composableBuilder(
    column: $table.lowStockThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateFormat => $composableBuilder(
    column: $table.dateFormat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setupDone => $composableBuilder(
    column: $table.setupDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsappTemplate => $composableBuilder(
    column: $table.whatsappTemplate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShopSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShopSettingsTable> {
  $$ShopSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shopName => $composableBuilder(
    column: $table.shopName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceFooter => $composableBuilder(
    column: $table.invoiceFooter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceFormat => $composableBuilder(
    column: $table.invoiceFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lowStockThreshold => $composableBuilder(
    column: $table.lowStockThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateFormat => $composableBuilder(
    column: $table.dateFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setupDone => $composableBuilder(
    column: $table.setupDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsappTemplate => $composableBuilder(
    column: $table.whatsappTemplate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShopSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShopSettingsTable> {
  $$ShopSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shopName =>
      $composableBuilder(column: $table.shopName, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get invoiceFooter => $composableBuilder(
    column: $table.invoiceFooter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get invoiceFormat => $composableBuilder(
    column: $table.invoiceFormat,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lowStockThreshold => $composableBuilder(
    column: $table.lowStockThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dateFormat => $composableBuilder(
    column: $table.dateFormat,
    builder: (column) => column,
  );

  GeneratedColumn<int> get setupDone =>
      $composableBuilder(column: $table.setupDone, builder: (column) => column);

  GeneratedColumn<String> get whatsappTemplate => $composableBuilder(
    column: $table.whatsappTemplate,
    builder: (column) => column,
  );
}

class $$ShopSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShopSettingsTable,
          ShopSetting,
          $$ShopSettingsTableFilterComposer,
          $$ShopSettingsTableOrderingComposer,
          $$ShopSettingsTableAnnotationComposer,
          $$ShopSettingsTableCreateCompanionBuilder,
          $$ShopSettingsTableUpdateCompanionBuilder,
          (
            ShopSetting,
            BaseReferences<_$AppDatabase, $ShopSettingsTable, ShopSetting>,
          ),
          ShopSetting,
          PrefetchHooks Function()
        > {
  $$ShopSettingsTableTableManager(_$AppDatabase db, $ShopSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> shopName = const Value.absent(),
                Value<String> subtitle = const Value.absent(),
                Value<String> contactNumber = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> invoiceFooter = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> invoiceFormat = const Value.absent(),
                Value<int> lowStockThreshold = const Value.absent(),
                Value<String> dateFormat = const Value.absent(),
                Value<int> setupDone = const Value.absent(),
                Value<String> whatsappTemplate = const Value.absent(),
              }) => ShopSettingsCompanion(
                id: id,
                shopName: shopName,
                subtitle: subtitle,
                contactNumber: contactNumber,
                address: address,
                invoiceFooter: invoiceFooter,
                currency: currency,
                themeMode: themeMode,
                invoiceFormat: invoiceFormat,
                lowStockThreshold: lowStockThreshold,
                dateFormat: dateFormat,
                setupDone: setupDone,
                whatsappTemplate: whatsappTemplate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> shopName = const Value.absent(),
                Value<String> subtitle = const Value.absent(),
                Value<String> contactNumber = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> invoiceFooter = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> invoiceFormat = const Value.absent(),
                Value<int> lowStockThreshold = const Value.absent(),
                Value<String> dateFormat = const Value.absent(),
                Value<int> setupDone = const Value.absent(),
                Value<String> whatsappTemplate = const Value.absent(),
              }) => ShopSettingsCompanion.insert(
                id: id,
                shopName: shopName,
                subtitle: subtitle,
                contactNumber: contactNumber,
                address: address,
                invoiceFooter: invoiceFooter,
                currency: currency,
                themeMode: themeMode,
                invoiceFormat: invoiceFormat,
                lowStockThreshold: lowStockThreshold,
                dateFormat: dateFormat,
                setupDone: setupDone,
                whatsappTemplate: whatsappTemplate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShopSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShopSettingsTable,
      ShopSetting,
      $$ShopSettingsTableFilterComposer,
      $$ShopSettingsTableOrderingComposer,
      $$ShopSettingsTableAnnotationComposer,
      $$ShopSettingsTableCreateCompanionBuilder,
      $$ShopSettingsTableUpdateCompanionBuilder,
      (
        ShopSetting,
        BaseReferences<_$AppDatabase, $ShopSettingsTable, ShopSetting>,
      ),
      ShopSetting,
      PrefetchHooks Function()
    >;
typedef $$AppMetadataTableCreateCompanionBuilder =
    AppMetadataCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppMetadataTableUpdateCompanionBuilder =
    AppMetadataCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $AppMetadataTable> {
  $$AppMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $AppMetadataTable> {
  $$AppMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppMetadataTable> {
  $$AppMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppMetadataTable,
          AppMetadataData,
          $$AppMetadataTableFilterComposer,
          $$AppMetadataTableOrderingComposer,
          $$AppMetadataTableAnnotationComposer,
          $$AppMetadataTableCreateCompanionBuilder,
          $$AppMetadataTableUpdateCompanionBuilder,
          (
            AppMetadataData,
            BaseReferences<_$AppDatabase, $AppMetadataTable, AppMetadataData>,
          ),
          AppMetadataData,
          PrefetchHooks Function()
        > {
  $$AppMetadataTableTableManager(_$AppDatabase db, $AppMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppMetadataCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AppMetadataCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppMetadataTable,
      AppMetadataData,
      $$AppMetadataTableFilterComposer,
      $$AppMetadataTableOrderingComposer,
      $$AppMetadataTableAnnotationComposer,
      $$AppMetadataTableCreateCompanionBuilder,
      $$AppMetadataTableUpdateCompanionBuilder,
      (
        AppMetadataData,
        BaseReferences<_$AppDatabase, $AppMetadataTable, AppMetadataData>,
      ),
      AppMetadataData,
      PrefetchHooks Function()
    >;
typedef $$LocalUsersTableCreateCompanionBuilder =
    LocalUsersCompanion Function({
      required String id,
      required String name,
      required String pinHash,
      required String pinSalt,
      required String role,
      Value<int> isActive,
      Value<int> useBiometrics,
      Value<String?> firebaseUid,
      Value<String?> email,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$LocalUsersTableUpdateCompanionBuilder =
    LocalUsersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> pinHash,
      Value<String> pinSalt,
      Value<String> role,
      Value<int> isActive,
      Value<int> useBiometrics,
      Value<String?> firebaseUid,
      Value<String?> email,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$LocalUsersTableFilterComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinSalt => $composableBuilder(
    column: $table.pinSalt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get useBiometrics => $composableBuilder(
    column: $table.useBiometrics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinSalt => $composableBuilder(
    column: $table.pinSalt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get useBiometrics => $composableBuilder(
    column: $table.useBiometrics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalUsersTable> {
  $$LocalUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get pinHash =>
      $composableBuilder(column: $table.pinHash, builder: (column) => column);

  GeneratedColumn<String> get pinSalt =>
      $composableBuilder(column: $table.pinSalt, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get useBiometrics => $composableBuilder(
    column: $table.useBiometrics,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalUsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalUsersTable,
          LocalUser,
          $$LocalUsersTableFilterComposer,
          $$LocalUsersTableOrderingComposer,
          $$LocalUsersTableAnnotationComposer,
          $$LocalUsersTableCreateCompanionBuilder,
          $$LocalUsersTableUpdateCompanionBuilder,
          (
            LocalUser,
            BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>,
          ),
          LocalUser,
          PrefetchHooks Function()
        > {
  $$LocalUsersTableTableManager(_$AppDatabase db, $LocalUsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> pinHash = const Value.absent(),
                Value<String> pinSalt = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<int> isActive = const Value.absent(),
                Value<int> useBiometrics = const Value.absent(),
                Value<String?> firebaseUid = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalUsersCompanion(
                id: id,
                name: name,
                pinHash: pinHash,
                pinSalt: pinSalt,
                role: role,
                isActive: isActive,
                useBiometrics: useBiometrics,
                firebaseUid: firebaseUid,
                email: email,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String pinHash,
                required String pinSalt,
                required String role,
                Value<int> isActive = const Value.absent(),
                Value<int> useBiometrics = const Value.absent(),
                Value<String?> firebaseUid = const Value.absent(),
                Value<String?> email = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalUsersCompanion.insert(
                id: id,
                name: name,
                pinHash: pinHash,
                pinSalt: pinSalt,
                role: role,
                isActive: isActive,
                useBiometrics: useBiometrics,
                firebaseUid: firebaseUid,
                email: email,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalUsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalUsersTable,
      LocalUser,
      $$LocalUsersTableFilterComposer,
      $$LocalUsersTableOrderingComposer,
      $$LocalUsersTableAnnotationComposer,
      $$LocalUsersTableCreateCompanionBuilder,
      $$LocalUsersTableUpdateCompanionBuilder,
      (LocalUser, BaseReferences<_$AppDatabase, $LocalUsersTable, LocalUser>),
      LocalUser,
      PrefetchHooks Function()
    >;
typedef $$AuditLogsTableCreateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<String?> userId,
      required String action,
      Value<String?> entityType,
      Value<String?> entityId,
      Value<String?> details,
      required int createdAt,
    });
typedef $$AuditLogsTableUpdateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<String?> userId,
      Value<String> action,
      Value<String?> entityType,
      Value<String?> entityId,
      Value<String?> details,
      Value<int> createdAt,
    });

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTable,
          AuditLog,
          $$AuditLogsTableFilterComposer,
          $$AuditLogsTableOrderingComposer,
          $$AuditLogsTableAnnotationComposer,
          $$AuditLogsTableCreateCompanionBuilder,
          $$AuditLogsTableUpdateCompanionBuilder,
          (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
          AuditLog,
          PrefetchHooks Function()
        > {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String?> entityType = const Value.absent(),
                Value<String?> entityId = const Value.absent(),
                Value<String?> details = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => AuditLogsCompanion(
                id: id,
                userId: userId,
                action: action,
                entityType: entityType,
                entityId: entityId,
                details: details,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                required String action,
                Value<String?> entityType = const Value.absent(),
                Value<String?> entityId = const Value.absent(),
                Value<String?> details = const Value.absent(),
                required int createdAt,
              }) => AuditLogsCompanion.insert(
                id: id,
                userId: userId,
                action: action,
                entityType: entityType,
                entityId: entityId,
                details: details,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTable,
      AuditLog,
      $$AuditLogsTableFilterComposer,
      $$AuditLogsTableOrderingComposer,
      $$AuditLogsTableAnnotationComposer,
      $$AuditLogsTableCreateCompanionBuilder,
      $$AuditLogsTableUpdateCompanionBuilder,
      (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
      AuditLog,
      PrefetchHooks Function()
    >;
typedef $$BrandsTableCreateCompanionBuilder =
    BrandsCompanion Function({
      required String id,
      required String name,
      Value<int> isArchived,
      Value<int> sortOrder,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$BrandsTableUpdateCompanionBuilder =
    BrandsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> isArchived,
      Value<int> sortOrder,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$BrandsTableFilterComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BrandsTableOrderingComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BrandsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BrandsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BrandsTable,
          Brand,
          $$BrandsTableFilterComposer,
          $$BrandsTableOrderingComposer,
          $$BrandsTableAnnotationComposer,
          $$BrandsTableCreateCompanionBuilder,
          $$BrandsTableUpdateCompanionBuilder,
          (Brand, BaseReferences<_$AppDatabase, $BrandsTable, Brand>),
          Brand,
          PrefetchHooks Function()
        > {
  $$BrandsTableTableManager(_$AppDatabase db, $BrandsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BrandsCompanion(
                id: id,
                name: name,
                isArchived: isArchived,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => BrandsCompanion.insert(
                id: id,
                name: name,
                isArchived: isArchived,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BrandsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BrandsTable,
      Brand,
      $$BrandsTableFilterComposer,
      $$BrandsTableOrderingComposer,
      $$BrandsTableAnnotationComposer,
      $$BrandsTableCreateCompanionBuilder,
      $$BrandsTableUpdateCompanionBuilder,
      (Brand, BaseReferences<_$AppDatabase, $BrandsTable, Brand>),
      Brand,
      PrefetchHooks Function()
    >;
typedef $$ProductModelsTableCreateCompanionBuilder =
    ProductModelsCompanion Function({
      required String id,
      required String brandId,
      required String name,
      Value<String?> photoPath,
      Value<int> isArchived,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ProductModelsTableUpdateCompanionBuilder =
    ProductModelsCompanion Function({
      Value<String> id,
      Value<String> brandId,
      Value<String> name,
      Value<String?> photoPath,
      Value<int> isArchived,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$ProductModelsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductModelsTable> {
  $$ProductModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brandId => $composableBuilder(
    column: $table.brandId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductModelsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductModelsTable> {
  $$ProductModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brandId => $composableBuilder(
    column: $table.brandId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductModelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductModelsTable> {
  $$ProductModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get brandId =>
      $composableBuilder(column: $table.brandId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<int> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductModelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductModelsTable,
          ProductModel,
          $$ProductModelsTableFilterComposer,
          $$ProductModelsTableOrderingComposer,
          $$ProductModelsTableAnnotationComposer,
          $$ProductModelsTableCreateCompanionBuilder,
          $$ProductModelsTableUpdateCompanionBuilder,
          (
            ProductModel,
            BaseReferences<_$AppDatabase, $ProductModelsTable, ProductModel>,
          ),
          ProductModel,
          PrefetchHooks Function()
        > {
  $$ProductModelsTableTableManager(_$AppDatabase db, $ProductModelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> brandId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<int> isArchived = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductModelsCompanion(
                id: id,
                brandId: brandId,
                name: name,
                photoPath: photoPath,
                isArchived: isArchived,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String brandId,
                required String name,
                Value<String?> photoPath = const Value.absent(),
                Value<int> isArchived = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProductModelsCompanion.insert(
                id: id,
                brandId: brandId,
                name: name,
                photoPath: photoPath,
                isArchived: isArchived,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductModelsTable,
      ProductModel,
      $$ProductModelsTableFilterComposer,
      $$ProductModelsTableOrderingComposer,
      $$ProductModelsTableAnnotationComposer,
      $$ProductModelsTableCreateCompanionBuilder,
      $$ProductModelsTableUpdateCompanionBuilder,
      (
        ProductModel,
        BaseReferences<_$AppDatabase, $ProductModelsTable, ProductModel>,
      ),
      ProductModel,
      PrefetchHooks Function()
    >;
typedef $$ProductVariantsTableCreateCompanionBuilder =
    ProductVariantsCompanion Function({
      required String id,
      required String modelId,
      Value<String> ram,
      Value<String> storage,
      Value<String> color,
      Value<String> condition,
      Value<int> rowid,
    });
typedef $$ProductVariantsTableUpdateCompanionBuilder =
    ProductVariantsCompanion Function({
      Value<String> id,
      Value<String> modelId,
      Value<String> ram,
      Value<String> storage,
      Value<String> color,
      Value<String> condition,
      Value<int> rowid,
    });

class $$ProductVariantsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductVariantsTable> {
  $$ProductVariantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ram => $composableBuilder(
    column: $table.ram,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storage => $composableBuilder(
    column: $table.storage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductVariantsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductVariantsTable> {
  $$ProductVariantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ram => $composableBuilder(
    column: $table.ram,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storage => $composableBuilder(
    column: $table.storage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductVariantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductVariantsTable> {
  $$ProductVariantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get modelId =>
      $composableBuilder(column: $table.modelId, builder: (column) => column);

  GeneratedColumn<String> get ram =>
      $composableBuilder(column: $table.ram, builder: (column) => column);

  GeneratedColumn<String> get storage =>
      $composableBuilder(column: $table.storage, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);
}

class $$ProductVariantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductVariantsTable,
          ProductVariant,
          $$ProductVariantsTableFilterComposer,
          $$ProductVariantsTableOrderingComposer,
          $$ProductVariantsTableAnnotationComposer,
          $$ProductVariantsTableCreateCompanionBuilder,
          $$ProductVariantsTableUpdateCompanionBuilder,
          (
            ProductVariant,
            BaseReferences<
              _$AppDatabase,
              $ProductVariantsTable,
              ProductVariant
            >,
          ),
          ProductVariant,
          PrefetchHooks Function()
        > {
  $$ProductVariantsTableTableManager(
    _$AppDatabase db,
    $ProductVariantsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductVariantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductVariantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductVariantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> modelId = const Value.absent(),
                Value<String> ram = const Value.absent(),
                Value<String> storage = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductVariantsCompanion(
                id: id,
                modelId: modelId,
                ram: ram,
                storage: storage,
                color: color,
                condition: condition,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String modelId,
                Value<String> ram = const Value.absent(),
                Value<String> storage = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductVariantsCompanion.insert(
                id: id,
                modelId: modelId,
                ram: ram,
                storage: storage,
                color: color,
                condition: condition,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductVariantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductVariantsTable,
      ProductVariant,
      $$ProductVariantsTableFilterComposer,
      $$ProductVariantsTableOrderingComposer,
      $$ProductVariantsTableAnnotationComposer,
      $$ProductVariantsTableCreateCompanionBuilder,
      $$ProductVariantsTableUpdateCompanionBuilder,
      (
        ProductVariant,
        BaseReferences<_$AppDatabase, $ProductVariantsTable, ProductVariant>,
      ),
      ProductVariant,
      PrefetchHooks Function()
    >;
typedef $$SuppliersTableCreateCompanionBuilder =
    SuppliersCompanion Function({
      required String id,
      required String name,
      Value<String> phone,
      Value<String> address,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$SuppliersTableUpdateCompanionBuilder =
    SuppliersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> phone,
      Value<String> address,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SuppliersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SuppliersTable,
          Supplier,
          $$SuppliersTableFilterComposer,
          $$SuppliersTableOrderingComposer,
          $$SuppliersTableAnnotationComposer,
          $$SuppliersTableCreateCompanionBuilder,
          $$SuppliersTableUpdateCompanionBuilder,
          (Supplier, BaseReferences<_$AppDatabase, $SuppliersTable, Supplier>),
          Supplier,
          PrefetchHooks Function()
        > {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SuppliersCompanion(
                id: id,
                name: name,
                phone: phone,
                address: address,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> phone = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SuppliersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                address: address,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SuppliersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SuppliersTable,
      Supplier,
      $$SuppliersTableFilterComposer,
      $$SuppliersTableOrderingComposer,
      $$SuppliersTableAnnotationComposer,
      $$SuppliersTableCreateCompanionBuilder,
      $$SuppliersTableUpdateCompanionBuilder,
      (Supplier, BaseReferences<_$AppDatabase, $SuppliersTable, Supplier>),
      Supplier,
      PrefetchHooks Function()
    >;
typedef $$InventoryUnitsTableCreateCompanionBuilder =
    InventoryUnitsCompanion Function({
      required String id,
      required String variantId,
      Value<String?> imei1,
      Value<String?> imei2,
      Value<String?> serial,
      Value<String> ptaStatus,
      required int purchasePrice,
      required int salePrice,
      Value<String?> supplierId,
      Value<int?> purchaseDate,
      Value<String> warranty,
      Value<String> notes,
      Value<String?> photoPath,
      Value<String> status,
      Value<String?> batchId,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$InventoryUnitsTableUpdateCompanionBuilder =
    InventoryUnitsCompanion Function({
      Value<String> id,
      Value<String> variantId,
      Value<String?> imei1,
      Value<String?> imei2,
      Value<String?> serial,
      Value<String> ptaStatus,
      Value<int> purchasePrice,
      Value<int> salePrice,
      Value<String?> supplierId,
      Value<int?> purchaseDate,
      Value<String> warranty,
      Value<String> notes,
      Value<String?> photoPath,
      Value<String> status,
      Value<String?> batchId,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

class $$InventoryUnitsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryUnitsTable> {
  $$InventoryUnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imei1 => $composableBuilder(
    column: $table.imei1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imei2 => $composableBuilder(
    column: $table.imei2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ptaStatus => $composableBuilder(
    column: $table.ptaStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warranty => $composableBuilder(
    column: $table.warranty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InventoryUnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryUnitsTable> {
  $$InventoryUnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imei1 => $composableBuilder(
    column: $table.imei1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imei2 => $composableBuilder(
    column: $table.imei2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ptaStatus => $composableBuilder(
    column: $table.ptaStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warranty => $composableBuilder(
    column: $table.warranty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InventoryUnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryUnitsTable> {
  $$InventoryUnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);

  GeneratedColumn<String> get imei1 =>
      $composableBuilder(column: $table.imei1, builder: (column) => column);

  GeneratedColumn<String> get imei2 =>
      $composableBuilder(column: $table.imei2, builder: (column) => column);

  GeneratedColumn<String> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get ptaStatus =>
      $composableBuilder(column: $table.ptaStatus, builder: (column) => column);

  GeneratedColumn<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warranty =>
      $composableBuilder(column: $table.warranty, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$InventoryUnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryUnitsTable,
          InventoryUnit,
          $$InventoryUnitsTableFilterComposer,
          $$InventoryUnitsTableOrderingComposer,
          $$InventoryUnitsTableAnnotationComposer,
          $$InventoryUnitsTableCreateCompanionBuilder,
          $$InventoryUnitsTableUpdateCompanionBuilder,
          (
            InventoryUnit,
            BaseReferences<_$AppDatabase, $InventoryUnitsTable, InventoryUnit>,
          ),
          InventoryUnit,
          PrefetchHooks Function()
        > {
  $$InventoryUnitsTableTableManager(
    _$AppDatabase db,
    $InventoryUnitsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryUnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryUnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryUnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> variantId = const Value.absent(),
                Value<String?> imei1 = const Value.absent(),
                Value<String?> imei2 = const Value.absent(),
                Value<String?> serial = const Value.absent(),
                Value<String> ptaStatus = const Value.absent(),
                Value<int> purchasePrice = const Value.absent(),
                Value<int> salePrice = const Value.absent(),
                Value<String?> supplierId = const Value.absent(),
                Value<int?> purchaseDate = const Value.absent(),
                Value<String> warranty = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventoryUnitsCompanion(
                id: id,
                variantId: variantId,
                imei1: imei1,
                imei2: imei2,
                serial: serial,
                ptaStatus: ptaStatus,
                purchasePrice: purchasePrice,
                salePrice: salePrice,
                supplierId: supplierId,
                purchaseDate: purchaseDate,
                warranty: warranty,
                notes: notes,
                photoPath: photoPath,
                status: status,
                batchId: batchId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String variantId,
                Value<String?> imei1 = const Value.absent(),
                Value<String?> imei2 = const Value.absent(),
                Value<String?> serial = const Value.absent(),
                Value<String> ptaStatus = const Value.absent(),
                required int purchasePrice,
                required int salePrice,
                Value<String?> supplierId = const Value.absent(),
                Value<int?> purchaseDate = const Value.absent(),
                Value<String> warranty = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => InventoryUnitsCompanion.insert(
                id: id,
                variantId: variantId,
                imei1: imei1,
                imei2: imei2,
                serial: serial,
                ptaStatus: ptaStatus,
                purchasePrice: purchasePrice,
                salePrice: salePrice,
                supplierId: supplierId,
                purchaseDate: purchaseDate,
                warranty: warranty,
                notes: notes,
                photoPath: photoPath,
                status: status,
                batchId: batchId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InventoryUnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryUnitsTable,
      InventoryUnit,
      $$InventoryUnitsTableFilterComposer,
      $$InventoryUnitsTableOrderingComposer,
      $$InventoryUnitsTableAnnotationComposer,
      $$InventoryUnitsTableCreateCompanionBuilder,
      $$InventoryUnitsTableUpdateCompanionBuilder,
      (
        InventoryUnit,
        BaseReferences<_$AppDatabase, $InventoryUnitsTable, InventoryUnit>,
      ),
      InventoryUnit,
      PrefetchHooks Function()
    >;
typedef $$StockBatchesTableCreateCompanionBuilder =
    StockBatchesCompanion Function({
      required String id,
      required String variantId,
      required int quantity,
      required int purchasePrice,
      Value<String?> supplierId,
      Value<int?> purchaseDate,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$StockBatchesTableUpdateCompanionBuilder =
    StockBatchesCompanion Function({
      Value<String> id,
      Value<String> variantId,
      Value<int> quantity,
      Value<int> purchasePrice,
      Value<String?> supplierId,
      Value<int?> purchaseDate,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$StockBatchesTableFilterComposer
    extends Composer<_$AppDatabase, $StockBatchesTable> {
  $$StockBatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StockBatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $StockBatchesTable> {
  $$StockBatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StockBatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockBatchesTable> {
  $$StockBatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StockBatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StockBatchesTable,
          StockBatche,
          $$StockBatchesTableFilterComposer,
          $$StockBatchesTableOrderingComposer,
          $$StockBatchesTableAnnotationComposer,
          $$StockBatchesTableCreateCompanionBuilder,
          $$StockBatchesTableUpdateCompanionBuilder,
          (
            StockBatche,
            BaseReferences<_$AppDatabase, $StockBatchesTable, StockBatche>,
          ),
          StockBatche,
          PrefetchHooks Function()
        > {
  $$StockBatchesTableTableManager(_$AppDatabase db, $StockBatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockBatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockBatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockBatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> variantId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> purchasePrice = const Value.absent(),
                Value<String?> supplierId = const Value.absent(),
                Value<int?> purchaseDate = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StockBatchesCompanion(
                id: id,
                variantId: variantId,
                quantity: quantity,
                purchasePrice: purchasePrice,
                supplierId: supplierId,
                purchaseDate: purchaseDate,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String variantId,
                required int quantity,
                required int purchasePrice,
                Value<String?> supplierId = const Value.absent(),
                Value<int?> purchaseDate = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => StockBatchesCompanion.insert(
                id: id,
                variantId: variantId,
                quantity: quantity,
                purchasePrice: purchasePrice,
                supplierId: supplierId,
                purchaseDate: purchaseDate,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StockBatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StockBatchesTable,
      StockBatche,
      $$StockBatchesTableFilterComposer,
      $$StockBatchesTableOrderingComposer,
      $$StockBatchesTableAnnotationComposer,
      $$StockBatchesTableCreateCompanionBuilder,
      $$StockBatchesTableUpdateCompanionBuilder,
      (
        StockBatche,
        BaseReferences<_$AppDatabase, $StockBatchesTable, StockBatche>,
      ),
      StockBatche,
      PrefetchHooks Function()
    >;
typedef $$StockMovementsTableCreateCompanionBuilder =
    StockMovementsCompanion Function({
      Value<int> id,
      Value<String?> unitId,
      Value<String?> batchId,
      required int quantityDelta,
      Value<String?> fromStatus,
      required String toStatus,
      required String reason,
      Value<String?> refType,
      Value<String?> refId,
      Value<String?> userId,
      required int createdAt,
    });
typedef $$StockMovementsTableUpdateCompanionBuilder =
    StockMovementsCompanion Function({
      Value<int> id,
      Value<String?> unitId,
      Value<String?> batchId,
      Value<int> quantityDelta,
      Value<String?> fromStatus,
      Value<String> toStatus,
      Value<String> reason,
      Value<String?> refType,
      Value<String?> refId,
      Value<String?> userId,
      Value<int> createdAt,
    });

class $$StockMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantityDelta => $composableBuilder(
    column: $table.quantityDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromStatus => $composableBuilder(
    column: $table.fromStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toStatus => $composableBuilder(
    column: $table.toStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StockMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantityDelta => $composableBuilder(
    column: $table.quantityDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromStatus => $composableBuilder(
    column: $table.fromStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toStatus => $composableBuilder(
    column: $table.toStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refType => $composableBuilder(
    column: $table.refType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StockMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StockMovementsTable> {
  $$StockMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<int> get quantityDelta => $composableBuilder(
    column: $table.quantityDelta,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fromStatus => $composableBuilder(
    column: $table.fromStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get toStatus =>
      $composableBuilder(column: $table.toStatus, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get refType =>
      $composableBuilder(column: $table.refType, builder: (column) => column);

  GeneratedColumn<String> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StockMovementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StockMovementsTable,
          StockMovement,
          $$StockMovementsTableFilterComposer,
          $$StockMovementsTableOrderingComposer,
          $$StockMovementsTableAnnotationComposer,
          $$StockMovementsTableCreateCompanionBuilder,
          $$StockMovementsTableUpdateCompanionBuilder,
          (
            StockMovement,
            BaseReferences<_$AppDatabase, $StockMovementsTable, StockMovement>,
          ),
          StockMovement,
          PrefetchHooks Function()
        > {
  $$StockMovementsTableTableManager(
    _$AppDatabase db,
    $StockMovementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockMovementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                Value<int> quantityDelta = const Value.absent(),
                Value<String?> fromStatus = const Value.absent(),
                Value<String> toStatus = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String?> refType = const Value.absent(),
                Value<String?> refId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => StockMovementsCompanion(
                id: id,
                unitId: unitId,
                batchId: batchId,
                quantityDelta: quantityDelta,
                fromStatus: fromStatus,
                toStatus: toStatus,
                reason: reason,
                refType: refType,
                refId: refId,
                userId: userId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                required int quantityDelta,
                Value<String?> fromStatus = const Value.absent(),
                required String toStatus,
                required String reason,
                Value<String?> refType = const Value.absent(),
                Value<String?> refId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                required int createdAt,
              }) => StockMovementsCompanion.insert(
                id: id,
                unitId: unitId,
                batchId: batchId,
                quantityDelta: quantityDelta,
                fromStatus: fromStatus,
                toStatus: toStatus,
                reason: reason,
                refType: refType,
                refId: refId,
                userId: userId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StockMovementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StockMovementsTable,
      StockMovement,
      $$StockMovementsTableFilterComposer,
      $$StockMovementsTableOrderingComposer,
      $$StockMovementsTableAnnotationComposer,
      $$StockMovementsTableCreateCompanionBuilder,
      $$StockMovementsTableUpdateCompanionBuilder,
      (
        StockMovement,
        BaseReferences<_$AppDatabase, $StockMovementsTable, StockMovement>,
      ),
      StockMovement,
      PrefetchHooks Function()
    >;
typedef $$PurchaseInvoicesTableCreateCompanionBuilder =
    PurchaseInvoicesCompanion Function({
      required String id,
      required String refNo,
      required String supplierId,
      Value<String?> userId,
      required int purchaseDate,
      required int subtotal,
      Value<int> discount,
      Value<int> expenses,
      required int total,
      Value<int> paid,
      Value<String> paymentMethod,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$PurchaseInvoicesTableUpdateCompanionBuilder =
    PurchaseInvoicesCompanion Function({
      Value<String> id,
      Value<String> refNo,
      Value<String> supplierId,
      Value<String?> userId,
      Value<int> purchaseDate,
      Value<int> subtotal,
      Value<int> discount,
      Value<int> expenses,
      Value<int> total,
      Value<int> paid,
      Value<String> paymentMethod,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$PurchaseInvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refNo => $composableBuilder(
    column: $table.refNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expenses => $composableBuilder(
    column: $table.expenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PurchaseInvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refNo => $composableBuilder(
    column: $table.refNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expenses => $composableBuilder(
    column: $table.expenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchaseInvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get refNo =>
      $composableBuilder(column: $table.refNo, builder: (column) => column);

  GeneratedColumn<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<int> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<int> get expenses =>
      $composableBuilder(column: $table.expenses, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<int> get paid =>
      $composableBuilder(column: $table.paid, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PurchaseInvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseInvoicesTable,
          PurchaseInvoice,
          $$PurchaseInvoicesTableFilterComposer,
          $$PurchaseInvoicesTableOrderingComposer,
          $$PurchaseInvoicesTableAnnotationComposer,
          $$PurchaseInvoicesTableCreateCompanionBuilder,
          $$PurchaseInvoicesTableUpdateCompanionBuilder,
          (
            PurchaseInvoice,
            BaseReferences<
              _$AppDatabase,
              $PurchaseInvoicesTable,
              PurchaseInvoice
            >,
          ),
          PurchaseInvoice,
          PrefetchHooks Function()
        > {
  $$PurchaseInvoicesTableTableManager(
    _$AppDatabase db,
    $PurchaseInvoicesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseInvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseInvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseInvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> refNo = const Value.absent(),
                Value<String> supplierId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<int> purchaseDate = const Value.absent(),
                Value<int> subtotal = const Value.absent(),
                Value<int> discount = const Value.absent(),
                Value<int> expenses = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<int> paid = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseInvoicesCompanion(
                id: id,
                refNo: refNo,
                supplierId: supplierId,
                userId: userId,
                purchaseDate: purchaseDate,
                subtotal: subtotal,
                discount: discount,
                expenses: expenses,
                total: total,
                paid: paid,
                paymentMethod: paymentMethod,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String refNo,
                required String supplierId,
                Value<String?> userId = const Value.absent(),
                required int purchaseDate,
                required int subtotal,
                Value<int> discount = const Value.absent(),
                Value<int> expenses = const Value.absent(),
                required int total,
                Value<int> paid = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PurchaseInvoicesCompanion.insert(
                id: id,
                refNo: refNo,
                supplierId: supplierId,
                userId: userId,
                purchaseDate: purchaseDate,
                subtotal: subtotal,
                discount: discount,
                expenses: expenses,
                total: total,
                paid: paid,
                paymentMethod: paymentMethod,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PurchaseInvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseInvoicesTable,
      PurchaseInvoice,
      $$PurchaseInvoicesTableFilterComposer,
      $$PurchaseInvoicesTableOrderingComposer,
      $$PurchaseInvoicesTableAnnotationComposer,
      $$PurchaseInvoicesTableCreateCompanionBuilder,
      $$PurchaseInvoicesTableUpdateCompanionBuilder,
      (
        PurchaseInvoice,
        BaseReferences<_$AppDatabase, $PurchaseInvoicesTable, PurchaseInvoice>,
      ),
      PurchaseInvoice,
      PrefetchHooks Function()
    >;
typedef $$PurchaseItemsTableCreateCompanionBuilder =
    PurchaseItemsCompanion Function({
      required String id,
      required String purchaseId,
      required String variantId,
      Value<String?> unitId,
      Value<String?> batchId,
      required int quantity,
      required int unitCost,
      Value<int> rowid,
    });
typedef $$PurchaseItemsTableUpdateCompanionBuilder =
    PurchaseItemsCompanion Function({
      Value<String> id,
      Value<String> purchaseId,
      Value<String> variantId,
      Value<String?> unitId,
      Value<String?> batchId,
      Value<int> quantity,
      Value<int> unitCost,
      Value<int> rowid,
    });

class $$PurchaseItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PurchaseItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchaseItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);
}

class $$PurchaseItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseItemsTable,
          PurchaseItem,
          $$PurchaseItemsTableFilterComposer,
          $$PurchaseItemsTableOrderingComposer,
          $$PurchaseItemsTableAnnotationComposer,
          $$PurchaseItemsTableCreateCompanionBuilder,
          $$PurchaseItemsTableUpdateCompanionBuilder,
          (
            PurchaseItem,
            BaseReferences<_$AppDatabase, $PurchaseItemsTable, PurchaseItem>,
          ),
          PurchaseItem,
          PrefetchHooks Function()
        > {
  $$PurchaseItemsTableTableManager(_$AppDatabase db, $PurchaseItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> purchaseId = const Value.absent(),
                Value<String> variantId = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitCost = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseItemsCompanion(
                id: id,
                purchaseId: purchaseId,
                variantId: variantId,
                unitId: unitId,
                batchId: batchId,
                quantity: quantity,
                unitCost: unitCost,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String purchaseId,
                required String variantId,
                Value<String?> unitId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                required int quantity,
                required int unitCost,
                Value<int> rowid = const Value.absent(),
              }) => PurchaseItemsCompanion.insert(
                id: id,
                purchaseId: purchaseId,
                variantId: variantId,
                unitId: unitId,
                batchId: batchId,
                quantity: quantity,
                unitCost: unitCost,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PurchaseItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseItemsTable,
      PurchaseItem,
      $$PurchaseItemsTableFilterComposer,
      $$PurchaseItemsTableOrderingComposer,
      $$PurchaseItemsTableAnnotationComposer,
      $$PurchaseItemsTableCreateCompanionBuilder,
      $$PurchaseItemsTableUpdateCompanionBuilder,
      (
        PurchaseItem,
        BaseReferences<_$AppDatabase, $PurchaseItemsTable, PurchaseItem>,
      ),
      PurchaseItem,
      PrefetchHooks Function()
    >;
typedef $$SupplierPaymentsTableCreateCompanionBuilder =
    SupplierPaymentsCompanion Function({
      required String id,
      required String supplierId,
      Value<String?> purchaseId,
      required int amount,
      required int date,
      Value<String> method,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$SupplierPaymentsTableUpdateCompanionBuilder =
    SupplierPaymentsCompanion Function({
      Value<String> id,
      Value<String> supplierId,
      Value<String?> purchaseId,
      Value<int> amount,
      Value<int> date,
      Value<String> method,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$SupplierPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierPaymentsTable> {
  $$SupplierPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SupplierPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierPaymentsTable> {
  $$SupplierPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SupplierPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierPaymentsTable> {
  $$SupplierPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SupplierPaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplierPaymentsTable,
          SupplierPayment,
          $$SupplierPaymentsTableFilterComposer,
          $$SupplierPaymentsTableOrderingComposer,
          $$SupplierPaymentsTableAnnotationComposer,
          $$SupplierPaymentsTableCreateCompanionBuilder,
          $$SupplierPaymentsTableUpdateCompanionBuilder,
          (
            SupplierPayment,
            BaseReferences<
              _$AppDatabase,
              $SupplierPaymentsTable,
              SupplierPayment
            >,
          ),
          SupplierPayment,
          PrefetchHooks Function()
        > {
  $$SupplierPaymentsTableTableManager(
    _$AppDatabase db,
    $SupplierPaymentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> supplierId = const Value.absent(),
                Value<String?> purchaseId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SupplierPaymentsCompanion(
                id: id,
                supplierId: supplierId,
                purchaseId: purchaseId,
                amount: amount,
                date: date,
                method: method,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String supplierId,
                Value<String?> purchaseId = const Value.absent(),
                required int amount,
                required int date,
                Value<String> method = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SupplierPaymentsCompanion.insert(
                id: id,
                supplierId: supplierId,
                purchaseId: purchaseId,
                amount: amount,
                date: date,
                method: method,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SupplierPaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplierPaymentsTable,
      SupplierPayment,
      $$SupplierPaymentsTableFilterComposer,
      $$SupplierPaymentsTableOrderingComposer,
      $$SupplierPaymentsTableAnnotationComposer,
      $$SupplierPaymentsTableCreateCompanionBuilder,
      $$SupplierPaymentsTableUpdateCompanionBuilder,
      (
        SupplierPayment,
        BaseReferences<_$AppDatabase, $SupplierPaymentsTable, SupplierPayment>,
      ),
      SupplierPayment,
      PrefetchHooks Function()
    >;
typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      required String id,
      required String name,
      Value<String> phone,
      Value<String> address,
      Value<String> notes,
      Value<int> openingBalance,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> phone,
      Value<String> address,
      Value<String> notes,
      Value<int> openingBalance,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get openingBalance => $composableBuilder(
    column: $table.openingBalance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
          Customer,
          PrefetchHooks Function()
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                name: name,
                phone: phone,
                address: address,
                notes: notes,
                openingBalance: openingBalance,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> phone = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> openingBalance = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                address: address,
                notes: notes,
                openingBalance: openingBalance,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
      Customer,
      PrefetchHooks Function()
    >;
typedef $$SalesInvoicesTableCreateCompanionBuilder =
    SalesInvoicesCompanion Function({
      required String id,
      required String invoiceNo,
      required int saleDate,
      required String customerId,
      required int subtotal,
      Value<int> discount,
      Value<int> tax,
      required int total,
      Value<int> paid,
      required String paymentType,
      Value<String> paymentMethod,
      Value<String> status,
      required String idempotencyKey,
      Value<String> notes,
      Value<String> warranty,
      Value<String?> userId,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$SalesInvoicesTableUpdateCompanionBuilder =
    SalesInvoicesCompanion Function({
      Value<String> id,
      Value<String> invoiceNo,
      Value<int> saleDate,
      Value<String> customerId,
      Value<int> subtotal,
      Value<int> discount,
      Value<int> tax,
      Value<int> total,
      Value<int> paid,
      Value<String> paymentType,
      Value<String> paymentMethod,
      Value<String> status,
      Value<String> idempotencyKey,
      Value<String> notes,
      Value<String> warranty,
      Value<String?> userId,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$SalesInvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $SalesInvoicesTable> {
  $$SalesInvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get saleDate => $composableBuilder(
    column: $table.saleDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warranty => $composableBuilder(
    column: $table.warranty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SalesInvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesInvoicesTable> {
  $$SalesInvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get saleDate => $composableBuilder(
    column: $table.saleDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discount => $composableBuilder(
    column: $table.discount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tax => $composableBuilder(
    column: $table.tax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warranty => $composableBuilder(
    column: $table.warranty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalesInvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesInvoicesTable> {
  $$SalesInvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNo =>
      $composableBuilder(column: $table.invoiceNo, builder: (column) => column);

  GeneratedColumn<int> get saleDate =>
      $composableBuilder(column: $table.saleDate, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<int> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<int> get tax =>
      $composableBuilder(column: $table.tax, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<int> get paid =>
      $composableBuilder(column: $table.paid, builder: (column) => column);

  GeneratedColumn<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get warranty =>
      $composableBuilder(column: $table.warranty, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SalesInvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesInvoicesTable,
          SalesInvoice,
          $$SalesInvoicesTableFilterComposer,
          $$SalesInvoicesTableOrderingComposer,
          $$SalesInvoicesTableAnnotationComposer,
          $$SalesInvoicesTableCreateCompanionBuilder,
          $$SalesInvoicesTableUpdateCompanionBuilder,
          (
            SalesInvoice,
            BaseReferences<_$AppDatabase, $SalesInvoicesTable, SalesInvoice>,
          ),
          SalesInvoice,
          PrefetchHooks Function()
        > {
  $$SalesInvoicesTableTableManager(_$AppDatabase db, $SalesInvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesInvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesInvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesInvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> invoiceNo = const Value.absent(),
                Value<int> saleDate = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<int> subtotal = const Value.absent(),
                Value<int> discount = const Value.absent(),
                Value<int> tax = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<int> paid = const Value.absent(),
                Value<String> paymentType = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> idempotencyKey = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> warranty = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SalesInvoicesCompanion(
                id: id,
                invoiceNo: invoiceNo,
                saleDate: saleDate,
                customerId: customerId,
                subtotal: subtotal,
                discount: discount,
                tax: tax,
                total: total,
                paid: paid,
                paymentType: paymentType,
                paymentMethod: paymentMethod,
                status: status,
                idempotencyKey: idempotencyKey,
                notes: notes,
                warranty: warranty,
                userId: userId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String invoiceNo,
                required int saleDate,
                required String customerId,
                required int subtotal,
                Value<int> discount = const Value.absent(),
                Value<int> tax = const Value.absent(),
                required int total,
                Value<int> paid = const Value.absent(),
                required String paymentType,
                Value<String> paymentMethod = const Value.absent(),
                Value<String> status = const Value.absent(),
                required String idempotencyKey,
                Value<String> notes = const Value.absent(),
                Value<String> warranty = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SalesInvoicesCompanion.insert(
                id: id,
                invoiceNo: invoiceNo,
                saleDate: saleDate,
                customerId: customerId,
                subtotal: subtotal,
                discount: discount,
                tax: tax,
                total: total,
                paid: paid,
                paymentType: paymentType,
                paymentMethod: paymentMethod,
                status: status,
                idempotencyKey: idempotencyKey,
                notes: notes,
                warranty: warranty,
                userId: userId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SalesInvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesInvoicesTable,
      SalesInvoice,
      $$SalesInvoicesTableFilterComposer,
      $$SalesInvoicesTableOrderingComposer,
      $$SalesInvoicesTableAnnotationComposer,
      $$SalesInvoicesTableCreateCompanionBuilder,
      $$SalesInvoicesTableUpdateCompanionBuilder,
      (
        SalesInvoice,
        BaseReferences<_$AppDatabase, $SalesInvoicesTable, SalesInvoice>,
      ),
      SalesInvoice,
      PrefetchHooks Function()
    >;
typedef $$SalesItemsTableCreateCompanionBuilder =
    SalesItemsCompanion Function({
      required String id,
      required String saleId,
      required String variantId,
      Value<String?> unitId,
      Value<String?> batchId,
      required int quantity,
      required int unitPrice,
      required int unitCost,
      Value<int> rowid,
    });
typedef $$SalesItemsTableUpdateCompanionBuilder =
    SalesItemsCompanion Function({
      Value<String> id,
      Value<String> saleId,
      Value<String> variantId,
      Value<String?> unitId,
      Value<String?> batchId,
      Value<int> quantity,
      Value<int> unitPrice,
      Value<int> unitCost,
      Value<int> rowid,
    });

class $$SalesItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SalesItemsTable> {
  $$SalesItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SalesItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesItemsTable> {
  $$SalesItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalesItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesItemsTable> {
  $$SalesItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get saleId =>
      $composableBuilder(column: $table.saleId, builder: (column) => column);

  GeneratedColumn<String> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<int> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);
}

class $$SalesItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesItemsTable,
          SalesItem,
          $$SalesItemsTableFilterComposer,
          $$SalesItemsTableOrderingComposer,
          $$SalesItemsTableAnnotationComposer,
          $$SalesItemsTableCreateCompanionBuilder,
          $$SalesItemsTableUpdateCompanionBuilder,
          (
            SalesItem,
            BaseReferences<_$AppDatabase, $SalesItemsTable, SalesItem>,
          ),
          SalesItem,
          PrefetchHooks Function()
        > {
  $$SalesItemsTableTableManager(_$AppDatabase db, $SalesItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> saleId = const Value.absent(),
                Value<String> variantId = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<int> unitCost = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SalesItemsCompanion(
                id: id,
                saleId: saleId,
                variantId: variantId,
                unitId: unitId,
                batchId: batchId,
                quantity: quantity,
                unitPrice: unitPrice,
                unitCost: unitCost,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String saleId,
                required String variantId,
                Value<String?> unitId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                required int quantity,
                required int unitPrice,
                required int unitCost,
                Value<int> rowid = const Value.absent(),
              }) => SalesItemsCompanion.insert(
                id: id,
                saleId: saleId,
                variantId: variantId,
                unitId: unitId,
                batchId: batchId,
                quantity: quantity,
                unitPrice: unitPrice,
                unitCost: unitCost,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SalesItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesItemsTable,
      SalesItem,
      $$SalesItemsTableFilterComposer,
      $$SalesItemsTableOrderingComposer,
      $$SalesItemsTableAnnotationComposer,
      $$SalesItemsTableCreateCompanionBuilder,
      $$SalesItemsTableUpdateCompanionBuilder,
      (SalesItem, BaseReferences<_$AppDatabase, $SalesItemsTable, SalesItem>),
      SalesItem,
      PrefetchHooks Function()
    >;
typedef $$CustomerPaymentsTableCreateCompanionBuilder =
    CustomerPaymentsCompanion Function({
      required String id,
      required String customerId,
      Value<String?> saleId,
      required int amount,
      required int date,
      Value<String> method,
      Value<int?> dueDate,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$CustomerPaymentsTableUpdateCompanionBuilder =
    CustomerPaymentsCompanion Function({
      Value<String> id,
      Value<String> customerId,
      Value<String?> saleId,
      Value<int> amount,
      Value<int> date,
      Value<String> method,
      Value<int?> dueDate,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$CustomerPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerPaymentsTable> {
  $$CustomerPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomerPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerPaymentsTable> {
  $$CustomerPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomerPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerPaymentsTable> {
  $$CustomerPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get saleId =>
      $composableBuilder(column: $table.saleId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<int> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CustomerPaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomerPaymentsTable,
          CustomerPayment,
          $$CustomerPaymentsTableFilterComposer,
          $$CustomerPaymentsTableOrderingComposer,
          $$CustomerPaymentsTableAnnotationComposer,
          $$CustomerPaymentsTableCreateCompanionBuilder,
          $$CustomerPaymentsTableUpdateCompanionBuilder,
          (
            CustomerPayment,
            BaseReferences<
              _$AppDatabase,
              $CustomerPaymentsTable,
              CustomerPayment
            >,
          ),
          CustomerPayment,
          PrefetchHooks Function()
        > {
  $$CustomerPaymentsTableTableManager(
    _$AppDatabase db,
    $CustomerPaymentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<String?> saleId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<int?> dueDate = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomerPaymentsCompanion(
                id: id,
                customerId: customerId,
                saleId: saleId,
                amount: amount,
                date: date,
                method: method,
                dueDate: dueDate,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String customerId,
                Value<String?> saleId = const Value.absent(),
                required int amount,
                required int date,
                Value<String> method = const Value.absent(),
                Value<int?> dueDate = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CustomerPaymentsCompanion.insert(
                id: id,
                customerId: customerId,
                saleId: saleId,
                amount: amount,
                date: date,
                method: method,
                dueDate: dueDate,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomerPaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomerPaymentsTable,
      CustomerPayment,
      $$CustomerPaymentsTableFilterComposer,
      $$CustomerPaymentsTableOrderingComposer,
      $$CustomerPaymentsTableAnnotationComposer,
      $$CustomerPaymentsTableCreateCompanionBuilder,
      $$CustomerPaymentsTableUpdateCompanionBuilder,
      (
        CustomerPayment,
        BaseReferences<_$AppDatabase, $CustomerPaymentsTable, CustomerPayment>,
      ),
      CustomerPayment,
      PrefetchHooks Function()
    >;
typedef $$PaymentAllocationsTableCreateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      required String id,
      required String paymentId,
      required String saleId,
      required int amount,
      Value<int> rowid,
    });
typedef $$PaymentAllocationsTableUpdateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<String> id,
      Value<String> paymentId,
      Value<String> saleId,
      Value<int> amount,
      Value<int> rowid,
    });

class $$PaymentAllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentAllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentId => $composableBuilder(
    column: $table.paymentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentAllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get paymentId =>
      $composableBuilder(column: $table.paymentId, builder: (column) => column);

  GeneratedColumn<String> get saleId =>
      $composableBuilder(column: $table.saleId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
}

class $$PaymentAllocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation,
          $$PaymentAllocationsTableFilterComposer,
          $$PaymentAllocationsTableOrderingComposer,
          $$PaymentAllocationsTableAnnotationComposer,
          $$PaymentAllocationsTableCreateCompanionBuilder,
          $$PaymentAllocationsTableUpdateCompanionBuilder,
          (
            PaymentAllocation,
            BaseReferences<
              _$AppDatabase,
              $PaymentAllocationsTable,
              PaymentAllocation
            >,
          ),
          PaymentAllocation,
          PrefetchHooks Function()
        > {
  $$PaymentAllocationsTableTableManager(
    _$AppDatabase db,
    $PaymentAllocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentAllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentAllocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentAllocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> paymentId = const Value.absent(),
                Value<String> saleId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentAllocationsCompanion(
                id: id,
                paymentId: paymentId,
                saleId: saleId,
                amount: amount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String paymentId,
                required String saleId,
                required int amount,
                Value<int> rowid = const Value.absent(),
              }) => PaymentAllocationsCompanion.insert(
                id: id,
                paymentId: paymentId,
                saleId: saleId,
                amount: amount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentAllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentAllocationsTable,
      PaymentAllocation,
      $$PaymentAllocationsTableFilterComposer,
      $$PaymentAllocationsTableOrderingComposer,
      $$PaymentAllocationsTableAnnotationComposer,
      $$PaymentAllocationsTableCreateCompanionBuilder,
      $$PaymentAllocationsTableUpdateCompanionBuilder,
      (
        PaymentAllocation,
        BaseReferences<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation
        >,
      ),
      PaymentAllocation,
      PrefetchHooks Function()
    >;
typedef $$CreditAdjustmentsTableCreateCompanionBuilder =
    CreditAdjustmentsCompanion Function({
      required String id,
      required String customerId,
      required int amount,
      required String reason,
      required int date,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$CreditAdjustmentsTableUpdateCompanionBuilder =
    CreditAdjustmentsCompanion Function({
      Value<String> id,
      Value<String> customerId,
      Value<int> amount,
      Value<String> reason,
      Value<int> date,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$CreditAdjustmentsTableFilterComposer
    extends Composer<_$AppDatabase, $CreditAdjustmentsTable> {
  $$CreditAdjustmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CreditAdjustmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CreditAdjustmentsTable> {
  $$CreditAdjustmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CreditAdjustmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreditAdjustmentsTable> {
  $$CreditAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CreditAdjustmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CreditAdjustmentsTable,
          CreditAdjustment,
          $$CreditAdjustmentsTableFilterComposer,
          $$CreditAdjustmentsTableOrderingComposer,
          $$CreditAdjustmentsTableAnnotationComposer,
          $$CreditAdjustmentsTableCreateCompanionBuilder,
          $$CreditAdjustmentsTableUpdateCompanionBuilder,
          (
            CreditAdjustment,
            BaseReferences<
              _$AppDatabase,
              $CreditAdjustmentsTable,
              CreditAdjustment
            >,
          ),
          CreditAdjustment,
          PrefetchHooks Function()
        > {
  $$CreditAdjustmentsTableTableManager(
    _$AppDatabase db,
    $CreditAdjustmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditAdjustmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditAdjustmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditAdjustmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CreditAdjustmentsCompanion(
                id: id,
                customerId: customerId,
                amount: amount,
                reason: reason,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String customerId,
                required int amount,
                required String reason,
                required int date,
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CreditAdjustmentsCompanion.insert(
                id: id,
                customerId: customerId,
                amount: amount,
                reason: reason,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CreditAdjustmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CreditAdjustmentsTable,
      CreditAdjustment,
      $$CreditAdjustmentsTableFilterComposer,
      $$CreditAdjustmentsTableOrderingComposer,
      $$CreditAdjustmentsTableAnnotationComposer,
      $$CreditAdjustmentsTableCreateCompanionBuilder,
      $$CreditAdjustmentsTableUpdateCompanionBuilder,
      (
        CreditAdjustment,
        BaseReferences<
          _$AppDatabase,
          $CreditAdjustmentsTable,
          CreditAdjustment
        >,
      ),
      CreditAdjustment,
      PrefetchHooks Function()
    >;
typedef $$DispatchesTableCreateCompanionBuilder =
    DispatchesCompanion Function({
      required String id,
      required String refNo,
      required String recipientName,
      Value<String> recipientPhone,
      Value<String> recipientAddress,
      required int dispatchDate,
      Value<int> agreedPrice,
      Value<String> status,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$DispatchesTableUpdateCompanionBuilder =
    DispatchesCompanion Function({
      Value<String> id,
      Value<String> refNo,
      Value<String> recipientName,
      Value<String> recipientPhone,
      Value<String> recipientAddress,
      Value<int> dispatchDate,
      Value<int> agreedPrice,
      Value<String> status,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$DispatchesTableFilterComposer
    extends Composer<_$AppDatabase, $DispatchesTable> {
  $$DispatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refNo => $composableBuilder(
    column: $table.refNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientPhone => $composableBuilder(
    column: $table.recipientPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientAddress => $composableBuilder(
    column: $table.recipientAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dispatchDate => $composableBuilder(
    column: $table.dispatchDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agreedPrice => $composableBuilder(
    column: $table.agreedPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DispatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $DispatchesTable> {
  $$DispatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refNo => $composableBuilder(
    column: $table.refNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientPhone => $composableBuilder(
    column: $table.recipientPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientAddress => $composableBuilder(
    column: $table.recipientAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dispatchDate => $composableBuilder(
    column: $table.dispatchDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agreedPrice => $composableBuilder(
    column: $table.agreedPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DispatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DispatchesTable> {
  $$DispatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get refNo =>
      $composableBuilder(column: $table.refNo, builder: (column) => column);

  GeneratedColumn<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientPhone => $composableBuilder(
    column: $table.recipientPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientAddress => $composableBuilder(
    column: $table.recipientAddress,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dispatchDate => $composableBuilder(
    column: $table.dispatchDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get agreedPrice => $composableBuilder(
    column: $table.agreedPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DispatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DispatchesTable,
          Dispatche,
          $$DispatchesTableFilterComposer,
          $$DispatchesTableOrderingComposer,
          $$DispatchesTableAnnotationComposer,
          $$DispatchesTableCreateCompanionBuilder,
          $$DispatchesTableUpdateCompanionBuilder,
          (
            Dispatche,
            BaseReferences<_$AppDatabase, $DispatchesTable, Dispatche>,
          ),
          Dispatche,
          PrefetchHooks Function()
        > {
  $$DispatchesTableTableManager(_$AppDatabase db, $DispatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DispatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DispatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DispatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> refNo = const Value.absent(),
                Value<String> recipientName = const Value.absent(),
                Value<String> recipientPhone = const Value.absent(),
                Value<String> recipientAddress = const Value.absent(),
                Value<int> dispatchDate = const Value.absent(),
                Value<int> agreedPrice = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DispatchesCompanion(
                id: id,
                refNo: refNo,
                recipientName: recipientName,
                recipientPhone: recipientPhone,
                recipientAddress: recipientAddress,
                dispatchDate: dispatchDate,
                agreedPrice: agreedPrice,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String refNo,
                required String recipientName,
                Value<String> recipientPhone = const Value.absent(),
                Value<String> recipientAddress = const Value.absent(),
                required int dispatchDate,
                Value<int> agreedPrice = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DispatchesCompanion.insert(
                id: id,
                refNo: refNo,
                recipientName: recipientName,
                recipientPhone: recipientPhone,
                recipientAddress: recipientAddress,
                dispatchDate: dispatchDate,
                agreedPrice: agreedPrice,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DispatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DispatchesTable,
      Dispatche,
      $$DispatchesTableFilterComposer,
      $$DispatchesTableOrderingComposer,
      $$DispatchesTableAnnotationComposer,
      $$DispatchesTableCreateCompanionBuilder,
      $$DispatchesTableUpdateCompanionBuilder,
      (Dispatche, BaseReferences<_$AppDatabase, $DispatchesTable, Dispatche>),
      Dispatche,
      PrefetchHooks Function()
    >;
typedef $$DispatchItemsTableCreateCompanionBuilder =
    DispatchItemsCompanion Function({
      required String id,
      required String dispatchId,
      Value<String?> unitId,
      required String variantId,
      Value<String?> batchId,
      required int quantity,
      required int unitCost,
      required int agreedPrice,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$DispatchItemsTableUpdateCompanionBuilder =
    DispatchItemsCompanion Function({
      Value<String> id,
      Value<String> dispatchId,
      Value<String?> unitId,
      Value<String> variantId,
      Value<String?> batchId,
      Value<int> quantity,
      Value<int> unitCost,
      Value<int> agreedPrice,
      Value<String> status,
      Value<int> rowid,
    });

class $$DispatchItemsTableFilterComposer
    extends Composer<_$AppDatabase, $DispatchItemsTable> {
  $$DispatchItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dispatchId => $composableBuilder(
    column: $table.dispatchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agreedPrice => $composableBuilder(
    column: $table.agreedPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DispatchItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $DispatchItemsTable> {
  $$DispatchItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dispatchId => $composableBuilder(
    column: $table.dispatchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCost => $composableBuilder(
    column: $table.unitCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agreedPrice => $composableBuilder(
    column: $table.agreedPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DispatchItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DispatchItemsTable> {
  $$DispatchItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dispatchId => $composableBuilder(
    column: $table.dispatchId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitCost =>
      $composableBuilder(column: $table.unitCost, builder: (column) => column);

  GeneratedColumn<int> get agreedPrice => $composableBuilder(
    column: $table.agreedPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$DispatchItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DispatchItemsTable,
          DispatchItem,
          $$DispatchItemsTableFilterComposer,
          $$DispatchItemsTableOrderingComposer,
          $$DispatchItemsTableAnnotationComposer,
          $$DispatchItemsTableCreateCompanionBuilder,
          $$DispatchItemsTableUpdateCompanionBuilder,
          (
            DispatchItem,
            BaseReferences<_$AppDatabase, $DispatchItemsTable, DispatchItem>,
          ),
          DispatchItem,
          PrefetchHooks Function()
        > {
  $$DispatchItemsTableTableManager(_$AppDatabase db, $DispatchItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DispatchItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DispatchItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DispatchItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dispatchId = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String> variantId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitCost = const Value.absent(),
                Value<int> agreedPrice = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DispatchItemsCompanion(
                id: id,
                dispatchId: dispatchId,
                unitId: unitId,
                variantId: variantId,
                batchId: batchId,
                quantity: quantity,
                unitCost: unitCost,
                agreedPrice: agreedPrice,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dispatchId,
                Value<String?> unitId = const Value.absent(),
                required String variantId,
                Value<String?> batchId = const Value.absent(),
                required int quantity,
                required int unitCost,
                required int agreedPrice,
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DispatchItemsCompanion.insert(
                id: id,
                dispatchId: dispatchId,
                unitId: unitId,
                variantId: variantId,
                batchId: batchId,
                quantity: quantity,
                unitCost: unitCost,
                agreedPrice: agreedPrice,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DispatchItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DispatchItemsTable,
      DispatchItem,
      $$DispatchItemsTableFilterComposer,
      $$DispatchItemsTableOrderingComposer,
      $$DispatchItemsTableAnnotationComposer,
      $$DispatchItemsTableCreateCompanionBuilder,
      $$DispatchItemsTableUpdateCompanionBuilder,
      (
        DispatchItem,
        BaseReferences<_$AppDatabase, $DispatchItemsTable, DispatchItem>,
      ),
      DispatchItem,
      PrefetchHooks Function()
    >;
typedef $$ConsignmentSalesTableCreateCompanionBuilder =
    ConsignmentSalesCompanion Function({
      required String id,
      required String dispatchItemId,
      required int quantity,
      required int salePrice,
      Value<int> amountReceived,
      required int date,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ConsignmentSalesTableUpdateCompanionBuilder =
    ConsignmentSalesCompanion Function({
      Value<String> id,
      Value<String> dispatchItemId,
      Value<int> quantity,
      Value<int> salePrice,
      Value<int> amountReceived,
      Value<int> date,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$ConsignmentSalesTableFilterComposer
    extends Composer<_$AppDatabase, $ConsignmentSalesTable> {
  $$ConsignmentSalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dispatchItemId => $composableBuilder(
    column: $table.dispatchItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountReceived => $composableBuilder(
    column: $table.amountReceived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConsignmentSalesTableOrderingComposer
    extends Composer<_$AppDatabase, $ConsignmentSalesTable> {
  $$ConsignmentSalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dispatchItemId => $composableBuilder(
    column: $table.dispatchItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountReceived => $composableBuilder(
    column: $table.amountReceived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConsignmentSalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConsignmentSalesTable> {
  $$ConsignmentSalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dispatchItemId => $composableBuilder(
    column: $table.dispatchItemId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<int> get amountReceived => $composableBuilder(
    column: $table.amountReceived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ConsignmentSalesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConsignmentSalesTable,
          ConsignmentSale,
          $$ConsignmentSalesTableFilterComposer,
          $$ConsignmentSalesTableOrderingComposer,
          $$ConsignmentSalesTableAnnotationComposer,
          $$ConsignmentSalesTableCreateCompanionBuilder,
          $$ConsignmentSalesTableUpdateCompanionBuilder,
          (
            ConsignmentSale,
            BaseReferences<
              _$AppDatabase,
              $ConsignmentSalesTable,
              ConsignmentSale
            >,
          ),
          ConsignmentSale,
          PrefetchHooks Function()
        > {
  $$ConsignmentSalesTableTableManager(
    _$AppDatabase db,
    $ConsignmentSalesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConsignmentSalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConsignmentSalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConsignmentSalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> dispatchItemId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> salePrice = const Value.absent(),
                Value<int> amountReceived = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConsignmentSalesCompanion(
                id: id,
                dispatchItemId: dispatchItemId,
                quantity: quantity,
                salePrice: salePrice,
                amountReceived: amountReceived,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dispatchItemId,
                required int quantity,
                required int salePrice,
                Value<int> amountReceived = const Value.absent(),
                required int date,
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ConsignmentSalesCompanion.insert(
                id: id,
                dispatchItemId: dispatchItemId,
                quantity: quantity,
                salePrice: salePrice,
                amountReceived: amountReceived,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConsignmentSalesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConsignmentSalesTable,
      ConsignmentSale,
      $$ConsignmentSalesTableFilterComposer,
      $$ConsignmentSalesTableOrderingComposer,
      $$ConsignmentSalesTableAnnotationComposer,
      $$ConsignmentSalesTableCreateCompanionBuilder,
      $$ConsignmentSalesTableUpdateCompanionBuilder,
      (
        ConsignmentSale,
        BaseReferences<_$AppDatabase, $ConsignmentSalesTable, ConsignmentSale>,
      ),
      ConsignmentSale,
      PrefetchHooks Function()
    >;
typedef $$ProductReturnsTableCreateCompanionBuilder =
    ProductReturnsCompanion Function({
      required String id,
      Value<String?> saleId,
      Value<String?> unitId,
      Value<String?> variantId,
      Value<String?> batchId,
      required int quantity,
      required int refundAmount,
      Value<String> reason,
      Value<int> restock,
      required int date,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ProductReturnsTableUpdateCompanionBuilder =
    ProductReturnsCompanion Function({
      Value<String> id,
      Value<String?> saleId,
      Value<String?> unitId,
      Value<String?> variantId,
      Value<String?> batchId,
      Value<int> quantity,
      Value<int> refundAmount,
      Value<String> reason,
      Value<int> restock,
      Value<int> date,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$ProductReturnsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductReturnsTable> {
  $$ProductReturnsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get refundAmount => $composableBuilder(
    column: $table.refundAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restock => $composableBuilder(
    column: $table.restock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductReturnsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductReturnsTable> {
  $$ProductReturnsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saleId => $composableBuilder(
    column: $table.saleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchId => $composableBuilder(
    column: $table.batchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get refundAmount => $composableBuilder(
    column: $table.refundAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restock => $composableBuilder(
    column: $table.restock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductReturnsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductReturnsTable> {
  $$ProductReturnsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get saleId =>
      $composableBuilder(column: $table.saleId, builder: (column) => column);

  GeneratedColumn<String> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);

  GeneratedColumn<String> get batchId =>
      $composableBuilder(column: $table.batchId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get refundAmount => $composableBuilder(
    column: $table.refundAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<int> get restock =>
      $composableBuilder(column: $table.restock, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductReturnsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductReturnsTable,
          ProductReturn,
          $$ProductReturnsTableFilterComposer,
          $$ProductReturnsTableOrderingComposer,
          $$ProductReturnsTableAnnotationComposer,
          $$ProductReturnsTableCreateCompanionBuilder,
          $$ProductReturnsTableUpdateCompanionBuilder,
          (
            ProductReturn,
            BaseReferences<_$AppDatabase, $ProductReturnsTable, ProductReturn>,
          ),
          ProductReturn,
          PrefetchHooks Function()
        > {
  $$ProductReturnsTableTableManager(
    _$AppDatabase db,
    $ProductReturnsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductReturnsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductReturnsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductReturnsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> saleId = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> variantId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> refundAmount = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<int> restock = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductReturnsCompanion(
                id: id,
                saleId: saleId,
                unitId: unitId,
                variantId: variantId,
                batchId: batchId,
                quantity: quantity,
                refundAmount: refundAmount,
                reason: reason,
                restock: restock,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> saleId = const Value.absent(),
                Value<String?> unitId = const Value.absent(),
                Value<String?> variantId = const Value.absent(),
                Value<String?> batchId = const Value.absent(),
                required int quantity,
                required int refundAmount,
                Value<String> reason = const Value.absent(),
                Value<int> restock = const Value.absent(),
                required int date,
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProductReturnsCompanion.insert(
                id: id,
                saleId: saleId,
                unitId: unitId,
                variantId: variantId,
                batchId: batchId,
                quantity: quantity,
                refundAmount: refundAmount,
                reason: reason,
                restock: restock,
                date: date,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductReturnsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductReturnsTable,
      ProductReturn,
      $$ProductReturnsTableFilterComposer,
      $$ProductReturnsTableOrderingComposer,
      $$ProductReturnsTableAnnotationComposer,
      $$ProductReturnsTableCreateCompanionBuilder,
      $$ProductReturnsTableUpdateCompanionBuilder,
      (
        ProductReturn,
        BaseReferences<_$AppDatabase, $ProductReturnsTable, ProductReturn>,
      ),
      ProductReturn,
      PrefetchHooks Function()
    >;
typedef $$RefundsTableCreateCompanionBuilder =
    RefundsCompanion Function({
      required String id,
      required String returnId,
      required int amount,
      required int date,
      Value<String> method,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$RefundsTableUpdateCompanionBuilder =
    RefundsCompanion Function({
      Value<String> id,
      Value<String> returnId,
      Value<int> amount,
      Value<int> date,
      Value<String> method,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$RefundsTableFilterComposer
    extends Composer<_$AppDatabase, $RefundsTable> {
  $$RefundsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get returnId => $composableBuilder(
    column: $table.returnId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RefundsTableOrderingComposer
    extends Composer<_$AppDatabase, $RefundsTable> {
  $$RefundsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get returnId => $composableBuilder(
    column: $table.returnId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RefundsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RefundsTable> {
  $$RefundsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get returnId =>
      $composableBuilder(column: $table.returnId, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RefundsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RefundsTable,
          Refund,
          $$RefundsTableFilterComposer,
          $$RefundsTableOrderingComposer,
          $$RefundsTableAnnotationComposer,
          $$RefundsTableCreateCompanionBuilder,
          $$RefundsTableUpdateCompanionBuilder,
          (Refund, BaseReferences<_$AppDatabase, $RefundsTable, Refund>),
          Refund,
          PrefetchHooks Function()
        > {
  $$RefundsTableTableManager(_$AppDatabase db, $RefundsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RefundsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RefundsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RefundsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> returnId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RefundsCompanion(
                id: id,
                returnId: returnId,
                amount: amount,
                date: date,
                method: method,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String returnId,
                required int amount,
                required int date,
                Value<String> method = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RefundsCompanion.insert(
                id: id,
                returnId: returnId,
                amount: amount,
                date: date,
                method: method,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RefundsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RefundsTable,
      Refund,
      $$RefundsTableFilterComposer,
      $$RefundsTableOrderingComposer,
      $$RefundsTableAnnotationComposer,
      $$RefundsTableCreateCompanionBuilder,
      $$RefundsTableUpdateCompanionBuilder,
      (Refund, BaseReferences<_$AppDatabase, $RefundsTable, Refund>),
      Refund,
      PrefetchHooks Function()
    >;
typedef $$ExpenseCategoriesTableCreateCompanionBuilder =
    ExpenseCategoriesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$ExpenseCategoriesTableUpdateCompanionBuilder =
    ExpenseCategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

class $$ExpenseCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpenseCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpenseCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$ExpenseCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpenseCategoriesTable,
          ExpenseCategory,
          $$ExpenseCategoriesTableFilterComposer,
          $$ExpenseCategoriesTableOrderingComposer,
          $$ExpenseCategoriesTableAnnotationComposer,
          $$ExpenseCategoriesTableCreateCompanionBuilder,
          $$ExpenseCategoriesTableUpdateCompanionBuilder,
          (
            ExpenseCategory,
            BaseReferences<
              _$AppDatabase,
              $ExpenseCategoriesTable,
              ExpenseCategory
            >,
          ),
          ExpenseCategory,
          PrefetchHooks Function()
        > {
  $$ExpenseCategoriesTableTableManager(
    _$AppDatabase db,
    $ExpenseCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  ExpenseCategoriesCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => ExpenseCategoriesCompanion.insert(
                id: id,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpenseCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpenseCategoriesTable,
      ExpenseCategory,
      $$ExpenseCategoriesTableFilterComposer,
      $$ExpenseCategoriesTableOrderingComposer,
      $$ExpenseCategoriesTableAnnotationComposer,
      $$ExpenseCategoriesTableCreateCompanionBuilder,
      $$ExpenseCategoriesTableUpdateCompanionBuilder,
      (
        ExpenseCategory,
        BaseReferences<_$AppDatabase, $ExpenseCategoriesTable, ExpenseCategory>,
      ),
      ExpenseCategory,
      PrefetchHooks Function()
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      required String id,
      required String categoryId,
      required String description,
      required int date,
      required int amount,
      Value<String> method,
      Value<String> reference,
      Value<String> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<String> id,
      Value<String> categoryId,
      Value<String> description,
      Value<int> date,
      Value<int> amount,
      Value<String> method,
      Value<String> reference,
      Value<String> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
          Expense,
          PrefetchHooks Function()
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion(
                id: id,
                categoryId: categoryId,
                description: description,
                date: date,
                amount: amount,
                method: method,
                reference: reference,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String categoryId,
                required String description,
                required int date,
                required int amount,
                Value<String> method = const Value.absent(),
                Value<String> reference = const Value.absent(),
                Value<String> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion.insert(
                id: id,
                categoryId: categoryId,
                description: description,
                date: date,
                amount: amount,
                method: method,
                reference: reference,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
      Expense,
      PrefetchHooks Function()
    >;
typedef $$BackupMetadataTableCreateCompanionBuilder =
    BackupMetadataCompanion Function({
      Value<int> id,
      required String fileName,
      required int createdAt,
      Value<int> sizeBytes,
      Value<String> appVersion,
      Value<int> dbVersion,
    });
typedef $$BackupMetadataTableUpdateCompanionBuilder =
    BackupMetadataCompanion Function({
      Value<int> id,
      Value<String> fileName,
      Value<int> createdAt,
      Value<int> sizeBytes,
      Value<String> appVersion,
      Value<int> dbVersion,
    });

class $$BackupMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $BackupMetadataTable> {
  $$BackupMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dbVersion => $composableBuilder(
    column: $table.dbVersion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BackupMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupMetadataTable> {
  $$BackupMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dbVersion => $composableBuilder(
    column: $table.dbVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BackupMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupMetadataTable> {
  $$BackupMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
    column: $table.appVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dbVersion =>
      $composableBuilder(column: $table.dbVersion, builder: (column) => column);
}

class $$BackupMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupMetadataTable,
          BackupMetadataData,
          $$BackupMetadataTableFilterComposer,
          $$BackupMetadataTableOrderingComposer,
          $$BackupMetadataTableAnnotationComposer,
          $$BackupMetadataTableCreateCompanionBuilder,
          $$BackupMetadataTableUpdateCompanionBuilder,
          (
            BackupMetadataData,
            BaseReferences<
              _$AppDatabase,
              $BackupMetadataTable,
              BackupMetadataData
            >,
          ),
          BackupMetadataData,
          PrefetchHooks Function()
        > {
  $$BackupMetadataTableTableManager(
    _$AppDatabase db,
    $BackupMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<String> appVersion = const Value.absent(),
                Value<int> dbVersion = const Value.absent(),
              }) => BackupMetadataCompanion(
                id: id,
                fileName: fileName,
                createdAt: createdAt,
                sizeBytes: sizeBytes,
                appVersion: appVersion,
                dbVersion: dbVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fileName,
                required int createdAt,
                Value<int> sizeBytes = const Value.absent(),
                Value<String> appVersion = const Value.absent(),
                Value<int> dbVersion = const Value.absent(),
              }) => BackupMetadataCompanion.insert(
                id: id,
                fileName: fileName,
                createdAt: createdAt,
                sizeBytes: sizeBytes,
                appVersion: appVersion,
                dbVersion: dbVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BackupMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupMetadataTable,
      BackupMetadataData,
      $$BackupMetadataTableFilterComposer,
      $$BackupMetadataTableOrderingComposer,
      $$BackupMetadataTableAnnotationComposer,
      $$BackupMetadataTableCreateCompanionBuilder,
      $$BackupMetadataTableUpdateCompanionBuilder,
      (
        BackupMetadataData,
        BaseReferences<_$AppDatabase, $BackupMetadataTable, BackupMetadataData>,
      ),
      BackupMetadataData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ShopSettingsTableTableManager get shopSettings =>
      $$ShopSettingsTableTableManager(_db, _db.shopSettings);
  $$AppMetadataTableTableManager get appMetadata =>
      $$AppMetadataTableTableManager(_db, _db.appMetadata);
  $$LocalUsersTableTableManager get localUsers =>
      $$LocalUsersTableTableManager(_db, _db.localUsers);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db, _db.brands);
  $$ProductModelsTableTableManager get productModels =>
      $$ProductModelsTableTableManager(_db, _db.productModels);
  $$ProductVariantsTableTableManager get productVariants =>
      $$ProductVariantsTableTableManager(_db, _db.productVariants);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$InventoryUnitsTableTableManager get inventoryUnits =>
      $$InventoryUnitsTableTableManager(_db, _db.inventoryUnits);
  $$StockBatchesTableTableManager get stockBatches =>
      $$StockBatchesTableTableManager(_db, _db.stockBatches);
  $$StockMovementsTableTableManager get stockMovements =>
      $$StockMovementsTableTableManager(_db, _db.stockMovements);
  $$PurchaseInvoicesTableTableManager get purchaseInvoices =>
      $$PurchaseInvoicesTableTableManager(_db, _db.purchaseInvoices);
  $$PurchaseItemsTableTableManager get purchaseItems =>
      $$PurchaseItemsTableTableManager(_db, _db.purchaseItems);
  $$SupplierPaymentsTableTableManager get supplierPayments =>
      $$SupplierPaymentsTableTableManager(_db, _db.supplierPayments);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$SalesInvoicesTableTableManager get salesInvoices =>
      $$SalesInvoicesTableTableManager(_db, _db.salesInvoices);
  $$SalesItemsTableTableManager get salesItems =>
      $$SalesItemsTableTableManager(_db, _db.salesItems);
  $$CustomerPaymentsTableTableManager get customerPayments =>
      $$CustomerPaymentsTableTableManager(_db, _db.customerPayments);
  $$PaymentAllocationsTableTableManager get paymentAllocations =>
      $$PaymentAllocationsTableTableManager(_db, _db.paymentAllocations);
  $$CreditAdjustmentsTableTableManager get creditAdjustments =>
      $$CreditAdjustmentsTableTableManager(_db, _db.creditAdjustments);
  $$DispatchesTableTableManager get dispatches =>
      $$DispatchesTableTableManager(_db, _db.dispatches);
  $$DispatchItemsTableTableManager get dispatchItems =>
      $$DispatchItemsTableTableManager(_db, _db.dispatchItems);
  $$ConsignmentSalesTableTableManager get consignmentSales =>
      $$ConsignmentSalesTableTableManager(_db, _db.consignmentSales);
  $$ProductReturnsTableTableManager get productReturns =>
      $$ProductReturnsTableTableManager(_db, _db.productReturns);
  $$RefundsTableTableManager get refunds =>
      $$RefundsTableTableManager(_db, _db.refunds);
  $$ExpenseCategoriesTableTableManager get expenseCategories =>
      $$ExpenseCategoriesTableTableManager(_db, _db.expenseCategories);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$BackupMetadataTableTableManager get backupMetadata =>
      $$BackupMetadataTableTableManager(_db, _db.backupMetadata);
}
