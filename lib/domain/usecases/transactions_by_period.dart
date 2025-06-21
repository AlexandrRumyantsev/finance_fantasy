import 'dart:async';

import '../../utils/either.dart';
import '../entities/error.dart';
import '../entities/transaction_extended.dart';
import '../repositories/transactions.dart';
import 'use_case.dart';

class GetTransactionsByPeriodUseCase
    implements
        UseCase<BaseError, List<TransactionExtended>,
            GetTransactionsByPeriodUseCaseParams> {
  const GetTransactionsByPeriodUseCase(this._transactionRepository);

  final TransactionRepository _transactionRepository;

  @override
  Future<Either<BaseError, List<TransactionExtended>>> call(
    GetTransactionsByPeriodUseCaseParams params,
  ) async {
    final result = await _transactionRepository.getTransactionsByPeriod(
      accountId: params.accountId,
      from: params.from,
      to: params.to,
    );
    return result.fold(
      Left.new,
      Right.new,
    );
  }
}

class GetTransactionsByPeriodUseCaseParams {
  const GetTransactionsByPeriodUseCaseParams({
    required this.accountId,
    this.from,
    this.to,
  });

  final int accountId;
  final DateTime? from;
  final DateTime? to;
}
