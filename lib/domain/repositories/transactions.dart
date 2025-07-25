import 'package:injectable/injectable.dart';

import '../../data/data_source/rest/api_service_interface.dart';
import '../../data/repositories_impl/transactions.dart';
import '../../utils/either.dart';
import '../entities/error.dart';
import '../entities/transaction_extended.dart';
import '../entities/transaction_params.dart';
import '../entities/transaction_short.dart';

@singleton
abstract interface class TransactionRepository {
  @factoryMethod
  factory TransactionRepository(ApiService client) =>
      TransactionRepositoryImpl(client);

  Future<Either<BaseError, TransactionBrief>> createTransaction({
    required TransactionParams transaction,
  });

  Future<Either<BaseError, TransactionExtended>> updateTransaction({
    required TransactionParams transaction,
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
