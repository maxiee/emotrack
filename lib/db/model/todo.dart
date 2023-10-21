import 'package:drift/drift.dart';

class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  BoolColumn get finish => boolean().withDefault(const Constant(false))();
  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}