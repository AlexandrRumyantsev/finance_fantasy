import 'package:finance_fantasy/data/models/request/transaction_request.dart';
import 'package:finance_fantasy/domain/entities/transaction_extended.dart';

import '../../utils/either.dart';
import '../entities/error.dart';
import '../entities/transaction_short.dart';

abstract interface class TransactionRepository {
  Future<Either<BaseError, TransactionBrief>> createTransaction({
    required TransactionRequest transaction,
  });

  Future<Either<BaseError, TransactionExtended>> updateTransaction({
    required TransactionRequest transaction,
    required int transactionId,
  });

  Future<Either<BaseError, bool>> deleteTransaction({
    required int transactionId,
  });

  Future<Either<BaseError, TransactionExtended>> getTransactionById({
    required int transactionId,
  });

  Future<Either<BaseError, List<TransactionExtended>>> getTransactionsByPeriod({
    required int accountId,
    DateTime from,
    DateTime to,
  });
}
