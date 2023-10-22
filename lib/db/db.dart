import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:emotrack/db/model/emo_score.dart';
import 'package:emotrack/db/model/todo.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

@DriftDatabase(tables: [Todo, EmoScore])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  ///===================
  /// emoscore
  ///===================
  Future<EmoScoreData?> getSingleEmoScoreByTs(DateTime dt) =>
      (select(emoScore)..where((t) => t.hourTimestamp.equals(dt)))
          .getSingleOrNull();

  Future<int> createOrUpdateEmoScore(EmoScoreCompanion emoScoreData) =>
      into(emoScore).insertOnConflictUpdate(emoScoreData);

  ///===================
  /// todos
  ///===================

  Future<TodoData> getSingleTodo(int id) =>
      (select(todo)..where((t) => t.id.equals(id))).getSingle();

  Future<List<TodoData>> get allTodoItems => select(todo).get();

  Future<int> createOrUpdateTodo(TodoCompanion todoDate) {
    return into(todo).insertOnConflictUpdate(todoDate);
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      m.createAll();
    }, onUpgrade: (Migrator m, int from, int to) async {
      if (from < 3) {
        /// version 2
        await m.createTable(emoScore);
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
