import 'package:injectable/injectable.dart';

import '../../../utils/either.dart';
import '../../entities/error.dart';
import '../../entities/transaction_params.dart';
import '../../entities/transaction_short.dart';
import '../../repositories/transactions.dart';
import '../use_case.dart';

@injectable
class CreateTransactionUseCase
    implements UseCase<BaseError, TransactionBrief, TransactionParams> {
  CreateTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  @override
  Future<Either<BaseError, TransactionBrief>> call(
    TransactionParams transaction,
  ) async {
    return _repository.createTransaction(transaction: transaction);
  }
}
