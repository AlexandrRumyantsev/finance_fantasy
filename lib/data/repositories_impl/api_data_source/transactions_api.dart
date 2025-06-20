import 'package:finance_fantasy/data/models/request/transaction_request.dart';
import 'package:finance_fantasy/domain/entities/error.dart';
import 'package:finance_fantasy/domain/entities/transaction_extended.dart';
import 'package:finance_fantasy/domain/entities/transaction_short.dart';
import 'package:finance_fantasy/domain/repositories/transactions.dart';
import 'package:finance_fantasy/utils/either.dart';

class TransactionsApiRepository implements TransactionRepository {
  @override
  Future<Either<BaseError, TransactionBrief>> createTransaction({
    required TransactionRequest transaction,
  }) {
    // TODO: implement createTransaction
    throw UnimplementedError();
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
  }) async {
    return const Right([]);
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
