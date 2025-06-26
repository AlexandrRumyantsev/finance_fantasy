import 'package:drift/drift.dart';

class Transactions extends Table {
  IntColumn get id => integer().withDefault(const Constant(0))();
  IntColumn get categoryId => integer().withDefault(const Constant(0))();
  IntColumn get accountId => integer().withDefault(const Constant(0))();
  IntColumn get amount => integer().withDefault(const Constant(0))();
  DateTimeColumn get transactionDate =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get comment => text().nullable()();
}
