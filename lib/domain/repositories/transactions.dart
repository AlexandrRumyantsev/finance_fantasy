import 'package:finance_fantasy/data/models/request/transaction_request.dart';
import 'package:finance_fantasy/data/models/shared/transaction.dart';

import '../../data/models/response/transaction_response.dart';
import '../../utils/either.dart';
import '../entities/error.dart';

/// TODO: Заменить TransactionDto на Transaction(Entity) когда появится domain слой
abstract interface class TransactionRepository {
  Future<Either<BaseError, TransactionDto>> createTransaction(
    TransactionRequest transaction,
  );

  Future<Either<BaseError, TransactionResponse>> updateTransaction({
    required TransactionRequest transaction,
  });

  Future<Either<BaseError, bool>> deleteTransaction({
    required int transactionId,
  });

  Future<Either<BaseError, TransactionResponse>> getTransactionById({
    required int transactionId,
  });

  Future<Either<BaseError, List<TransactionResponse>>> getTransactionsByPeriod({
    required int accountId,
    DateTime from,
    DateTime to,
  });
}
