import 'package:drift/drift.dart';

class EmoScore extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get hourTimestamp => dateTime().unique()();
  IntColumn get score => integer()();
}
