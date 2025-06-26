import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:finance_fantasy/data/data_source/database/database.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/error.dart';
import '../../../domain/entities/transaction_extended.dart';
import '../../../domain/entities/transaction_short.dart';
import '../../../domain/repositories/transactions.dart';
import '../../../utils/either.dart';
import '../../models/request/transaction_request.dart';

@injectable
class TransactionDatabaseRepository implements TransactionRepository {
  final AppDatabase _database;

  TransactionDatabaseRepository(this._database);

  @override
  Future<Either<BaseError, TransactionBrief>> createTransaction({
    required TransactionRequest transaction,
  }) {
    return Future.value(Right(TransactionBrief(
      id: 0,
      amount: double.parse(transaction.amount),
      categoryId: transaction.categoryId,
      accountId: transaction.accountId,
      transactionDate: transaction.transactionDate,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    )));
  }

  @override
  Future<Either<BaseError, bool>> deleteTransaction({
    required int transactionId,
  }) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TransactionExtended>> getTransactionById({
    required int transactionId,
  }) {
    // TODO: implement getTransactionById
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<TransactionExtended>>> getTransactionsByPeriod({
    required int accountId,
    DateTime? from,
    DateTime? to,
  }) {
    // TODO: implement getTransactionsByPeriod
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TransactionExtended>> updateTransaction({
    required TransactionRequest transaction,
    required int transactionId,
  }) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
