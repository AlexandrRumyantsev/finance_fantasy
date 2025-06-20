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
  FutureOr<Either<BaseError, List<TransactionExtended>>> call(params) {
    return const Right([]);
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
