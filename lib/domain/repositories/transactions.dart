import 'package:injectable/injectable.dart';

import '../../data/data_source/rest/transactions.dart';
import '../../data/models/request/transaction_request.dart';
import '../../data/repositories_impl/transactions.dart';
import '../../utils/either.dart';
import '../entities/error.dart';
import '../entities/transaction_extended.dart';
import '../entities/transaction_short.dart';

@injectable
abstract interface class TransactionRepository {
  @factoryMethod
  factory TransactionRepository(TransactionsClient client) =>
      TransactionRepositoryImpl(client);

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
    DateTime? from,
    DateTime? to,
  });
}
