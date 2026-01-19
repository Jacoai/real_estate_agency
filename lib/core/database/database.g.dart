// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class TenantTable extends Table with TableInfo<TenantTable, TenantTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TenantTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, email, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenant_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TenantTableData> instance, {
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
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TenantTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TenantTableData(
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
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
    );
  }

  @override
  TenantTable createAlias(String alias) {
    return TenantTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TenantTableData extends DataClass implements Insertable<TenantTableData> {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;
  const TenantTableData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['email'] = Variable<String>(email);
    map['address'] = Variable<String>(address);
    return map;
  }

  TenantTableCompanion toCompanion(bool nullToAbsent) {
    return TenantTableCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      email: Value(email),
      address: Value(address),
    );
  }

  factory TenantTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TenantTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
      'address': serializer.toJson<String>(address),
    };
  }

  TenantTableData copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
  }) => TenantTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    address: address ?? this.address,
  );
  TenantTableData copyWithCompanion(TenantTableCompanion data) {
    return TenantTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TenantTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, email, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenantTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address);
}

class TenantTableCompanion extends UpdateCompanion<TenantTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> email;
  final Value<String> address;
  final Value<int> rowid;
  const TenantTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TenantTableCompanion.insert({
    required String id,
    required String name,
    required String phone,
    required String email,
    required String address,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       phone = Value(phone),
       email = Value(email),
       address = Value(address);
  static Insertable<TenantTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TenantTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? email,
    Value<String>? address,
    Value<int>? rowid,
  }) {
    return TenantTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class LandlordTable extends Table
    with TableInfo<LandlordTable, LandlordTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LandlordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _adressMeta = const VerificationMeta('adress');
  late final GeneratedColumn<String> adress = GeneratedColumn<String>(
    'adress',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, email, adress];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'landlord_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LandlordTableData> instance, {
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
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('adress')) {
      context.handle(
        _adressMeta,
        adress.isAcceptableOrUnknown(data['adress']!, _adressMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LandlordTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LandlordTableData(
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
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      adress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adress'],
      ),
    );
  }

  @override
  LandlordTable createAlias(String alias) {
    return LandlordTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LandlordTableData extends DataClass
    implements Insertable<LandlordTableData> {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String? adress;
  const LandlordTableData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.adress,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || adress != null) {
      map['adress'] = Variable<String>(adress);
    }
    return map;
  }

  LandlordTableCompanion toCompanion(bool nullToAbsent) {
    return LandlordTableCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      email: Value(email),
      adress: adress == null && nullToAbsent
          ? const Value.absent()
          : Value(adress),
    );
  }

  factory LandlordTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LandlordTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      adress: serializer.fromJson<String?>(json['adress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
      'adress': serializer.toJson<String?>(adress),
    };
  }

  LandlordTableData copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    Value<String?> adress = const Value.absent(),
  }) => LandlordTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    adress: adress.present ? adress.value : this.adress,
  );
  LandlordTableData copyWithCompanion(LandlordTableCompanion data) {
    return LandlordTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      adress: data.adress.present ? data.adress.value : this.adress,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LandlordTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('adress: $adress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, email, adress);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LandlordTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.adress == this.adress);
}

class LandlordTableCompanion extends UpdateCompanion<LandlordTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> email;
  final Value<String?> adress;
  final Value<int> rowid;
  const LandlordTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.adress = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LandlordTableCompanion.insert({
    required String id,
    required String name,
    required String phone,
    required String email,
    this.adress = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       phone = Value(phone),
       email = Value(email);
  static Insertable<LandlordTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? adress,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (adress != null) 'adress': adress,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LandlordTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? phone,
    Value<String>? email,
    Value<String?>? adress,
    Value<int>? rowid,
  }) {
    return LandlordTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      adress: adress ?? this.adress,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (adress.present) {
      map['adress'] = Variable<String>(adress.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LandlordTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('adress: $adress, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class RealEstateTable extends Table
    with TableInfo<RealEstateTable, RealEstateTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  RealEstateTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _landlordIdMeta = const VerificationMeta(
    'landlordId',
  );
  late final GeneratedColumn<int> landlordId = GeneratedColumn<int>(
    'landlord_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  late final GeneratedColumn<double> area = GeneratedColumn<double>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    landlordId,
    title,
    address,
    type,
    area,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'real_estate_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RealEstateTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('landlord_id')) {
      context.handle(
        _landlordIdMeta,
        landlordId.isAcceptableOrUnknown(data['landlord_id']!, _landlordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landlordIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RealEstateTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RealEstateTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      landlordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}landlord_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}area'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  RealEstateTable createAlias(String alias) {
    return RealEstateTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(landlord_id)REFERENCES landlord_table(id)ON UPDATE CASCADE ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class RealEstateTableData extends DataClass
    implements Insertable<RealEstateTableData> {
  final String id;
  final int landlordId;
  final String title;
  final String address;
  final String type;
  final double area;
  final String status;
  const RealEstateTableData({
    required this.id,
    required this.landlordId,
    required this.title,
    required this.address,
    required this.type,
    required this.area,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['landlord_id'] = Variable<int>(landlordId);
    map['title'] = Variable<String>(title);
    map['address'] = Variable<String>(address);
    map['type'] = Variable<String>(type);
    map['area'] = Variable<double>(area);
    map['status'] = Variable<String>(status);
    return map;
  }

  RealEstateTableCompanion toCompanion(bool nullToAbsent) {
    return RealEstateTableCompanion(
      id: Value(id),
      landlordId: Value(landlordId),
      title: Value(title),
      address: Value(address),
      type: Value(type),
      area: Value(area),
      status: Value(status),
    );
  }

  factory RealEstateTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RealEstateTableData(
      id: serializer.fromJson<String>(json['id']),
      landlordId: serializer.fromJson<int>(json['landlord_id']),
      title: serializer.fromJson<String>(json['title']),
      address: serializer.fromJson<String>(json['address']),
      type: serializer.fromJson<String>(json['type']),
      area: serializer.fromJson<double>(json['area']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'landlord_id': serializer.toJson<int>(landlordId),
      'title': serializer.toJson<String>(title),
      'address': serializer.toJson<String>(address),
      'type': serializer.toJson<String>(type),
      'area': serializer.toJson<double>(area),
      'status': serializer.toJson<String>(status),
    };
  }

  RealEstateTableData copyWith({
    String? id,
    int? landlordId,
    String? title,
    String? address,
    String? type,
    double? area,
    String? status,
  }) => RealEstateTableData(
    id: id ?? this.id,
    landlordId: landlordId ?? this.landlordId,
    title: title ?? this.title,
    address: address ?? this.address,
    type: type ?? this.type,
    area: area ?? this.area,
    status: status ?? this.status,
  );
  RealEstateTableData copyWithCompanion(RealEstateTableCompanion data) {
    return RealEstateTableData(
      id: data.id.present ? data.id.value : this.id,
      landlordId: data.landlordId.present
          ? data.landlordId.value
          : this.landlordId,
      title: data.title.present ? data.title.value : this.title,
      address: data.address.present ? data.address.value : this.address,
      type: data.type.present ? data.type.value : this.type,
      area: data.area.present ? data.area.value : this.area,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RealEstateTableData(')
          ..write('id: $id, ')
          ..write('landlordId: $landlordId, ')
          ..write('title: $title, ')
          ..write('address: $address, ')
          ..write('type: $type, ')
          ..write('area: $area, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, landlordId, title, address, type, area, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RealEstateTableData &&
          other.id == this.id &&
          other.landlordId == this.landlordId &&
          other.title == this.title &&
          other.address == this.address &&
          other.type == this.type &&
          other.area == this.area &&
          other.status == this.status);
}

class RealEstateTableCompanion extends UpdateCompanion<RealEstateTableData> {
  final Value<String> id;
  final Value<int> landlordId;
  final Value<String> title;
  final Value<String> address;
  final Value<String> type;
  final Value<double> area;
  final Value<String> status;
  final Value<int> rowid;
  const RealEstateTableCompanion({
    this.id = const Value.absent(),
    this.landlordId = const Value.absent(),
    this.title = const Value.absent(),
    this.address = const Value.absent(),
    this.type = const Value.absent(),
    this.area = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RealEstateTableCompanion.insert({
    required String id,
    required int landlordId,
    required String title,
    required String address,
    required String type,
    required double area,
    required String status,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landlordId = Value(landlordId),
       title = Value(title),
       address = Value(address),
       type = Value(type),
       area = Value(area),
       status = Value(status);
  static Insertable<RealEstateTableData> custom({
    Expression<String>? id,
    Expression<int>? landlordId,
    Expression<String>? title,
    Expression<String>? address,
    Expression<String>? type,
    Expression<double>? area,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (landlordId != null) 'landlord_id': landlordId,
      if (title != null) 'title': title,
      if (address != null) 'address': address,
      if (type != null) 'type': type,
      if (area != null) 'area': area,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RealEstateTableCompanion copyWith({
    Value<String>? id,
    Value<int>? landlordId,
    Value<String>? title,
    Value<String>? address,
    Value<String>? type,
    Value<double>? area,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return RealEstateTableCompanion(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      title: title ?? this.title,
      address: address ?? this.address,
      type: type ?? this.type,
      area: area ?? this.area,
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
    if (landlordId.present) {
      map['landlord_id'] = Variable<int>(landlordId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (area.present) {
      map['area'] = Variable<double>(area.value);
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
    return (StringBuffer('RealEstateTableCompanion(')
          ..write('id: $id, ')
          ..write('landlordId: $landlordId, ')
          ..write('title: $title, ')
          ..write('address: $address, ')
          ..write('type: $type, ')
          ..write('area: $area, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final TenantTable tenantTable = TenantTable(this);
  late final LandlordTable landlordTable = LandlordTable(this);
  late final RealEstateTable realEstateTable = RealEstateTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tenantTable,
    landlordTable,
    realEstateTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'landlord_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('real_estate_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'landlord_table',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('real_estate_table', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $TenantTableCreateCompanionBuilder =
    TenantTableCompanion Function({
      required String id,
      required String name,
      required String phone,
      required String email,
      required String address,
      Value<int> rowid,
    });
typedef $TenantTableUpdateCompanionBuilder =
    TenantTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> phone,
      Value<String> email,
      Value<String> address,
      Value<int> rowid,
    });

class $TenantTableFilterComposer
    extends Composer<_$LocalDatabase, TenantTable> {
  $TenantTableFilterComposer({
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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );
}

class $TenantTableOrderingComposer
    extends Composer<_$LocalDatabase, TenantTable> {
  $TenantTableOrderingComposer({
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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );
}

class $TenantTableAnnotationComposer
    extends Composer<_$LocalDatabase, TenantTable> {
  $TenantTableAnnotationComposer({
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);
}

class $TenantTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          TenantTable,
          TenantTableData,
          $TenantTableFilterComposer,
          $TenantTableOrderingComposer,
          $TenantTableAnnotationComposer,
          $TenantTableCreateCompanionBuilder,
          $TenantTableUpdateCompanionBuilder,
          (
            TenantTableData,
            BaseReferences<_$LocalDatabase, TenantTable, TenantTableData>,
          ),
          TenantTableData,
          PrefetchHooks Function()
        > {
  $TenantTableTableManager(_$LocalDatabase db, TenantTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TenantTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TenantTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TenantTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TenantTableCompanion(
                id: id,
                name: name,
                phone: phone,
                email: email,
                address: address,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String phone,
                required String email,
                required String address,
                Value<int> rowid = const Value.absent(),
              }) => TenantTableCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                email: email,
                address: address,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TenantTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      TenantTable,
      TenantTableData,
      $TenantTableFilterComposer,
      $TenantTableOrderingComposer,
      $TenantTableAnnotationComposer,
      $TenantTableCreateCompanionBuilder,
      $TenantTableUpdateCompanionBuilder,
      (
        TenantTableData,
        BaseReferences<_$LocalDatabase, TenantTable, TenantTableData>,
      ),
      TenantTableData,
      PrefetchHooks Function()
    >;
typedef $LandlordTableCreateCompanionBuilder =
    LandlordTableCompanion Function({
      required String id,
      required String name,
      required String phone,
      required String email,
      Value<String?> adress,
      Value<int> rowid,
    });
typedef $LandlordTableUpdateCompanionBuilder =
    LandlordTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> phone,
      Value<String> email,
      Value<String?> adress,
      Value<int> rowid,
    });

class $LandlordTableFilterComposer
    extends Composer<_$LocalDatabase, LandlordTable> {
  $LandlordTableFilterComposer({
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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adress => $composableBuilder(
    column: $table.adress,
    builder: (column) => ColumnFilters(column),
  );
}

class $LandlordTableOrderingComposer
    extends Composer<_$LocalDatabase, LandlordTable> {
  $LandlordTableOrderingComposer({
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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adress => $composableBuilder(
    column: $table.adress,
    builder: (column) => ColumnOrderings(column),
  );
}

class $LandlordTableAnnotationComposer
    extends Composer<_$LocalDatabase, LandlordTable> {
  $LandlordTableAnnotationComposer({
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get adress =>
      $composableBuilder(column: $table.adress, builder: (column) => column);
}

class $LandlordTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          LandlordTable,
          LandlordTableData,
          $LandlordTableFilterComposer,
          $LandlordTableOrderingComposer,
          $LandlordTableAnnotationComposer,
          $LandlordTableCreateCompanionBuilder,
          $LandlordTableUpdateCompanionBuilder,
          (
            LandlordTableData,
            BaseReferences<_$LocalDatabase, LandlordTable, LandlordTableData>,
          ),
          LandlordTableData,
          PrefetchHooks Function()
        > {
  $LandlordTableTableManager(_$LocalDatabase db, LandlordTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $LandlordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $LandlordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $LandlordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> adress = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LandlordTableCompanion(
                id: id,
                name: name,
                phone: phone,
                email: email,
                adress: adress,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String phone,
                required String email,
                Value<String?> adress = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LandlordTableCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                email: email,
                adress: adress,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $LandlordTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      LandlordTable,
      LandlordTableData,
      $LandlordTableFilterComposer,
      $LandlordTableOrderingComposer,
      $LandlordTableAnnotationComposer,
      $LandlordTableCreateCompanionBuilder,
      $LandlordTableUpdateCompanionBuilder,
      (
        LandlordTableData,
        BaseReferences<_$LocalDatabase, LandlordTable, LandlordTableData>,
      ),
      LandlordTableData,
      PrefetchHooks Function()
    >;
typedef $RealEstateTableCreateCompanionBuilder =
    RealEstateTableCompanion Function({
      required String id,
      required int landlordId,
      required String title,
      required String address,
      required String type,
      required double area,
      required String status,
      Value<int> rowid,
    });
typedef $RealEstateTableUpdateCompanionBuilder =
    RealEstateTableCompanion Function({
      Value<String> id,
      Value<int> landlordId,
      Value<String> title,
      Value<String> address,
      Value<String> type,
      Value<double> area,
      Value<String> status,
      Value<int> rowid,
    });

class $RealEstateTableFilterComposer
    extends Composer<_$LocalDatabase, RealEstateTable> {
  $RealEstateTableFilterComposer({
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

  ColumnFilters<int> get landlordId => $composableBuilder(
    column: $table.landlordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $RealEstateTableOrderingComposer
    extends Composer<_$LocalDatabase, RealEstateTable> {
  $RealEstateTableOrderingComposer({
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

  ColumnOrderings<int> get landlordId => $composableBuilder(
    column: $table.landlordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $RealEstateTableAnnotationComposer
    extends Composer<_$LocalDatabase, RealEstateTable> {
  $RealEstateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get landlordId => $composableBuilder(
    column: $table.landlordId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $RealEstateTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          RealEstateTable,
          RealEstateTableData,
          $RealEstateTableFilterComposer,
          $RealEstateTableOrderingComposer,
          $RealEstateTableAnnotationComposer,
          $RealEstateTableCreateCompanionBuilder,
          $RealEstateTableUpdateCompanionBuilder,
          (
            RealEstateTableData,
            BaseReferences<
              _$LocalDatabase,
              RealEstateTable,
              RealEstateTableData
            >,
          ),
          RealEstateTableData,
          PrefetchHooks Function()
        > {
  $RealEstateTableTableManager(_$LocalDatabase db, RealEstateTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RealEstateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RealEstateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RealEstateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> landlordId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> area = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RealEstateTableCompanion(
                id: id,
                landlordId: landlordId,
                title: title,
                address: address,
                type: type,
                area: area,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int landlordId,
                required String title,
                required String address,
                required String type,
                required double area,
                required String status,
                Value<int> rowid = const Value.absent(),
              }) => RealEstateTableCompanion.insert(
                id: id,
                landlordId: landlordId,
                title: title,
                address: address,
                type: type,
                area: area,
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

typedef $RealEstateTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      RealEstateTable,
      RealEstateTableData,
      $RealEstateTableFilterComposer,
      $RealEstateTableOrderingComposer,
      $RealEstateTableAnnotationComposer,
      $RealEstateTableCreateCompanionBuilder,
      $RealEstateTableUpdateCompanionBuilder,
      (
        RealEstateTableData,
        BaseReferences<_$LocalDatabase, RealEstateTable, RealEstateTableData>,
      ),
      RealEstateTableData,
      PrefetchHooks Function()
    >;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $TenantTableTableManager get tenantTable =>
      $TenantTableTableManager(_db, _db.tenantTable);
  $LandlordTableTableManager get landlordTable =>
      $LandlordTableTableManager(_db, _db.landlordTable);
  $RealEstateTableTableManager get realEstateTable =>
      $RealEstateTableTableManager(_db, _db.realEstateTable);
}
