import 'package:injectable/injectable.dart';

import '../../../utils/either.dart';
import '../../entities/error.dart';
import '../../entities/transaction_extended.dart';
import '../../entities/transaction_params.dart';
import '../../repositories/transactions.dart';
import '../use_case.dart';

@injectable
class UpdateTransactionUseCase
    implements
        UseCase<BaseError, TransactionExtended, (TransactionParams, int)> {
  UpdateTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  @override
  Future<Either<BaseError, TransactionExtended>> call(
    (TransactionParams, int) params,
  ) async {
    return _repository.updateTransaction(
      transaction: params.$1,
      transactionId: params.$2,
    );
  }
}
