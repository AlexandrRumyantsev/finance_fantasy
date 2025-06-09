import '../../data/models/response/transaction_response.dart';
import '../../data/models/shared/transaction.dart';
import '../../utils/either.dart';
import '../entities/error.dart';

/// TODO: Заменить TransactionDto на Transaction(Entity) когда появится domain слой
abstract interface class TransactionRepository {
  Future<Either<BaseError, TransactionResponse>> createTransaction(
    TransactionDto transaction,
  );

  Future<Either<BaseError, TransactionResponse>> updateTransaction(
    TransactionDto transaction,
  );

  Future<Either<BaseError, TransactionResponse>> deleteTransaction(
    TransactionDto transaction,
  );

  Future<Either<BaseError, List<TransactionResponse>>> getTransactions();
}
