import 'package:intl/intl.dart';

import '../../../domain/entities/error.dart';
import '../../../domain/entities/transaction_extended.dart';
import '../../../domain/entities/transaction_short.dart';
import '../../../domain/repositories/transactions.dart';
import '../../../utils/either.dart';
import '../data_source/rest/transactions.dart';
import '../mappers/transaction.dart';
import '../models/request/transaction_request.dart';


class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._client);

  final TransactionsClient _client;

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
    try {
      final formatter = DateFormat('yyyy-MM-dd');
      final fromDate = from != null ? formatter.format(from) : null;
      final toDate = to != null ? formatter.format(to) : null;
      final response = await _client.getTransactionsByPeriod(
        accountId,
        fromDate,
        toDate,
      );
      return Right(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
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
