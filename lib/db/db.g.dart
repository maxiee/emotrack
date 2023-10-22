// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $TodoTable extends Todo with TableInfo<$TodoTable, TodoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<bool> finish = GeneratedColumn<bool>(
      'finish', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("finish" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, finish, created];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo';
  @override
  VerificationContext validateIntegrity(Insertable<TodoData> instance,
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
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}finish'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
    );
  }

  @override
  $TodoTable createAlias(String alias) {
    return $TodoTable(attachedDatabase, alias);
  }
}

class TodoData extends DataClass implements Insertable<TodoData> {
  final int id;
  final String title;
  final String? content;
  final bool finish;
  final DateTime created;
  const TodoData(
      {required this.id,
      required this.title,
      this.content,
      required this.finish,
      required this.created});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['finish'] = Variable<bool>(finish);
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  TodoCompanion toCompanion(bool nullToAbsent) {
    return TodoCompanion(
      id: Value(id),
      title: Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      finish: Value(finish),
      created: Value(created),
    );
  }

  factory TodoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      finish: serializer.fromJson<bool>(json['finish']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String?>(content),
      'finish': serializer.toJson<bool>(finish),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  TodoData copyWith(
          {int? id,
          String? title,
          Value<String?> content = const Value.absent(),
          bool? finish,
          DateTime? created}) =>
      TodoData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content.present ? content.value : this.content,
        finish: finish ?? this.finish,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('TodoData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('finish: $finish, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, finish, created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.finish == this.finish &&
          other.created == this.created);
}

class TodoCompanion extends UpdateCompanion<TodoData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> content;
  final Value<bool> finish;
  final Value<DateTime> created;
  const TodoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.finish = const Value.absent(),
    this.created = const Value.absent(),
  });
  TodoCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.content = const Value.absent(),
    this.finish = const Value.absent(),
    this.created = const Value.absent(),
  }) : title = Value(title);
  static Insertable<TodoData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<bool>? finish,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (finish != null) 'finish': finish,
      if (created != null) 'created': created,
    });
  }

  TodoCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? content,
      Value<bool>? finish,
      Value<DateTime>? created}) {
    return TodoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      finish: finish ?? this.finish,
      created: created ?? this.created,
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
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (finish.present) {
      map['finish'] = Variable<bool>(finish.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('finish: $finish, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $EmoScoreTable extends EmoScore
    with TableInfo<$EmoScoreTable, EmoScoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmoScoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hourTimestampMeta =
      const VerificationMeta('hourTimestamp');
  @override
  late final GeneratedColumn<DateTime> hourTimestamp =
      GeneratedColumn<DateTime>('hour_timestamp', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, hourTimestamp, score];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emo_score';
  @override
  VerificationContext validateIntegrity(Insertable<EmoScoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hour_timestamp')) {
      context.handle(
          _hourTimestampMeta,
          hourTimestamp.isAcceptableOrUnknown(
              data['hour_timestamp']!, _hourTimestampMeta));
    } else if (isInserting) {
      context.missing(_hourTimestampMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmoScoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmoScoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hourTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}hour_timestamp'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
    );
  }

  @override
  $EmoScoreTable createAlias(String alias) {
    return $EmoScoreTable(attachedDatabase, alias);
  }
}

class EmoScoreData extends DataClass implements Insertable<EmoScoreData> {
  final int id;
  final DateTime hourTimestamp;
  final int score;
  const EmoScoreData(
      {required this.id, required this.hourTimestamp, required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hour_timestamp'] = Variable<DateTime>(hourTimestamp);
    map['score'] = Variable<int>(score);
    return map;
  }

  EmoScoreCompanion toCompanion(bool nullToAbsent) {
    return EmoScoreCompanion(
      id: Value(id),
      hourTimestamp: Value(hourTimestamp),
      score: Value(score),
    );
  }

  factory EmoScoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmoScoreData(
      id: serializer.fromJson<int>(json['id']),
      hourTimestamp: serializer.fromJson<DateTime>(json['hourTimestamp']),
      score: serializer.fromJson<int>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hourTimestamp': serializer.toJson<DateTime>(hourTimestamp),
      'score': serializer.toJson<int>(score),
    };
  }

  EmoScoreData copyWith({int? id, DateTime? hourTimestamp, int? score}) =>
      EmoScoreData(
        id: id ?? this.id,
        hourTimestamp: hourTimestamp ?? this.hourTimestamp,
        score: score ?? this.score,
      );
  @override
  String toString() {
    return (StringBuffer('EmoScoreData(')
          ..write('id: $id, ')
          ..write('hourTimestamp: $hourTimestamp, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hourTimestamp, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmoScoreData &&
          other.id == this.id &&
          other.hourTimestamp == this.hourTimestamp &&
          other.score == this.score);
}

class EmoScoreCompanion extends UpdateCompanion<EmoScoreData> {
  final Value<int> id;
  final Value<DateTime> hourTimestamp;
  final Value<int> score;
  const EmoScoreCompanion({
    this.id = const Value.absent(),
    this.hourTimestamp = const Value.absent(),
    this.score = const Value.absent(),
  });
  EmoScoreCompanion.insert({
    this.id = const Value.absent(),
    required DateTime hourTimestamp,
    required int score,
  })  : hourTimestamp = Value(hourTimestamp),
        score = Value(score);
  static Insertable<EmoScoreData> custom({
    Expression<int>? id,
    Expression<DateTime>? hourTimestamp,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hourTimestamp != null) 'hour_timestamp': hourTimestamp,
      if (score != null) 'score': score,
    });
  }

  EmoScoreCompanion copyWith(
      {Value<int>? id, Value<DateTime>? hourTimestamp, Value<int>? score}) {
    return EmoScoreCompanion(
      id: id ?? this.id,
      hourTimestamp: hourTimestamp ?? this.hourTimestamp,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hourTimestamp.present) {
      map['hour_timestamp'] = Variable<DateTime>(hourTimestamp.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmoScoreCompanion(')
          ..write('id: $id, ')
          ..write('hourTimestamp: $hourTimestamp, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TodoTable todo = $TodoTable(this);
  late final $EmoScoreTable emoScore = $EmoScoreTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todo, emoScore];
}
