import 'package:drift/drift.dart';

import 'tables/transactions.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Transactions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);
  
  @override
  int get schemaVersion => 1;
}
