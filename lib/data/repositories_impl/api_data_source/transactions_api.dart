import 'package:finance_fantasy/data/mappers/transaction.dart';
import 'package:finance_fantasy/data/models/request/transaction_request.dart';
import 'package:finance_fantasy/domain/entities/error.dart';
import 'package:finance_fantasy/domain/entities/transaction_extended.dart';
import 'package:finance_fantasy/domain/entities/transaction_short.dart';
import 'package:finance_fantasy/domain/repositories/transactions.dart';
import 'package:finance_fantasy/utils/either.dart';
import 'package:intl/intl.dart';

import '../../../infrastructure/base/api.dart';
import '../../rest/transactions.dart';

class TransactionsApiRepository implements TransactionRepository {
  final _client = TransactionsClient(API.dio);

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
