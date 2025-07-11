import 'package:intl/intl.dart';

import '../../../domain/entities/error.dart';
import '../../../domain/entities/transaction_extended.dart';
import '../../../domain/entities/transaction_short.dart';
import '../../../domain/repositories/transactions.dart';
import '../../../utils/either.dart';
import '../../domain/entities/transaction_params.dart';
import '../data_source/rest/api_client.dart';
import '../mappers/transaction.dart';
import '../models/request/transaction_request.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<Either<BaseError, TransactionBrief>> createTransaction({
    required TransactionParams transaction,
  }) async {
    try {
      final request = TransactionRequest(
        accountId: transaction.accountId,
        categoryId: transaction.categoryId,
        amount: transaction.amount.toString(),
        transactionDate: transaction.transactionDate,
        comment: transaction.comment,
      );
      final response = await _client.createTransaction(request);
      return Right(response.toDomain());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<BaseError, bool>> deleteTransaction({
    required int transactionId,
  }) async {
    try {
      await _client.deleteTransaction(transactionId);
      return const Right(true);
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<BaseError, TransactionExtended>> getTransactionById({
    required int transactionId,
  }) async {
    try {
      final response = await _client.getTransactionById(transactionId);
      return Right(response.toDomain());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
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
    required TransactionParams transaction,
    required int transactionId,
  }) async {
    try {
      final request = TransactionRequest(
        accountId: transaction.accountId,
        categoryId: transaction.categoryId,
        amount: transaction.amount.toString(),
        transactionDate: transaction.transactionDate,
        comment: transaction.comment,
      );
      final response = await _client.updateTransaction(
        transactionId,
        request,
      );
      return Right(response.toDomain());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }
}
