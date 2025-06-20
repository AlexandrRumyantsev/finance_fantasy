import 'dart:async';

import 'package:finance_fantasy/domain/entities/transaction_extended.dart';
import 'package:finance_fantasy/domain/usecases/use_case.dart';
import 'package:finance_fantasy/utils/either.dart';

import '../entities/error.dart';
import '../repositories/transactions.dart';

class GetTransactionsByPeriodUseCase
    implements
        UseCase<BaseError, List<TransactionExtended>,
            GetTransactionsByPeriodUseCaseParams> {
  const GetTransactionsByPeriodUseCase(this._transactionRepository);

  final TransactionRepository _transactionRepository;

  @override
  Future<Either<BaseError, List<TransactionExtended>>> call(params) async {
    final result = await _transactionRepository.getTransactionsByPeriod(
      accountId: params.accountId,
      from: params.from,
      to: params.to,
    );
    return result.fold(
      (error) => Left(error),
      (transactions) => Right(transactions),
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
