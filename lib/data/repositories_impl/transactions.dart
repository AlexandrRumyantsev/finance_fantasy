import 'package:intl/intl.dart';

import '../../../domain/entities/error.dart';
import '../../../domain/entities/transaction_extended.dart';
import '../../../domain/entities/transaction_short.dart';
import '../../../domain/repositories/transactions.dart';
import '../../../utils/either.dart';
import '../../domain/entities/transaction_params.dart';
import '../data_source/rest/api_service.dart';
import '../mappers/transaction.dart';
import '../models/request/transaction_request.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._apiService);

  final ApiService _apiService;

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
      final response = await _apiService.createTransaction(request);
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
      await _apiService.deleteTransaction(transactionId);
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
      final response = await _apiService.getTransactionById(transactionId);
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
      final response = await _apiService.getTransactionsByPeriod(
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
      final response = await _apiService.updateTransaction(
        transactionId,
        request,
      );
      return Right(response.toDomain());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }
}
