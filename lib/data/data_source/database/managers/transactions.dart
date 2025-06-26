import 'package:finance_fantasy/data/data_source/database/database.dart';

class TransactionsDatabaseManager {
  TransactionsDatabaseManager(this.database);

  final AppDatabase database;

  $TransactionsTable get table => database.transactions;

  Future<void> insert(TransactionsCompanion companion) async {
    await database.into(table).insert(companion);
  }

  Future<List<Transaction>> getAll() {
    return database.select(table).get();
  }

  Future<void> delete(int id) async {
    await database.delete(table).go();
  }

  Future<void> update(TransactionsCompanion companion) async {
    await database.update(table).replace(companion);
  }
}
