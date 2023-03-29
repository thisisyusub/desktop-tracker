// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'os_log.dart';

// ignore_for_file: type=lint
class $OsLogTable extends OsLog with TableInfo<$OsLogTable, OsLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OsLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _logDateMeta =
      const VerificationMeta('logDate');
  @override
  late final GeneratedColumn<String> logDate = GeneratedColumn<String>(
      'log_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, logDate];
  @override
  String get aliasedName => _alias ?? 'os_log';
  @override
  String get actualTableName => 'os_log';
  @override
  VerificationContext validateIntegrity(Insertable<OsLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('log_date')) {
      context.handle(_logDateMeta,
          logDate.isAcceptableOrUnknown(data['log_date']!, _logDateMeta));
    } else if (isInserting) {
      context.missing(_logDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OsLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OsLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      logDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}log_date'])!,
    );
  }

  @override
  $OsLogTable createAlias(String alias) {
    return $OsLogTable(attachedDatabase, alias);
  }
}

class OsLogData extends DataClass implements Insertable<OsLogData> {
  final int id;
  final String title;
  final String logDate;
  const OsLogData(
      {required this.id, required this.title, required this.logDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['log_date'] = Variable<String>(logDate);
    return map;
  }

  OsLogCompanion toCompanion(bool nullToAbsent) {
    return OsLogCompanion(
      id: Value(id),
      title: Value(title),
      logDate: Value(logDate),
    );
  }

  factory OsLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OsLogData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      logDate: serializer.fromJson<String>(json['logDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'logDate': serializer.toJson<String>(logDate),
    };
  }

  OsLogData copyWith({int? id, String? title, String? logDate}) => OsLogData(
        id: id ?? this.id,
        title: title ?? this.title,
        logDate: logDate ?? this.logDate,
      );
  @override
  String toString() {
    return (StringBuffer('OsLogData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('logDate: $logDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, logDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OsLogData &&
          other.id == this.id &&
          other.title == this.title &&
          other.logDate == this.logDate);
}

class OsLogCompanion extends UpdateCompanion<OsLogData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> logDate;
  const OsLogCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.logDate = const Value.absent(),
  });
  OsLogCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String logDate,
  })  : title = Value(title),
        logDate = Value(logDate);
  static Insertable<OsLogData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? logDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (logDate != null) 'log_date': logDate,
    });
  }

  OsLogCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? logDate}) {
    return OsLogCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      logDate: logDate ?? this.logDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (logDate.present) {
      map['log_date'] = Variable<String>(logDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OsLogCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('logDate: $logDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $OsLogTable osLog = $OsLogTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [osLog];
}
