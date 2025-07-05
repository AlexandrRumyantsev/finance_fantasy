import 'package:injectable/injectable.dart';

import '../../../utils/either.dart';
import '../../entities/error.dart';
import '../../repositories/transactions.dart';
import '../use_case.dart';

@injectable
class DeleteTransactionUseCase implements UseCase<BaseError, void, int> {
  DeleteTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  @override
  Future<Either<BaseError, void>> call(int params) async {
    return _repository.deleteTransaction(transactionId: params);
  }
}
