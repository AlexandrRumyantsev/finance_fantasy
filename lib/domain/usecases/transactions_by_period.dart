import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../utils/either.dart';
import '../entities/error.dart';
import '../entities/transaction_extended.dart';
import '../repositories/bank_account.dart';
import '../repositories/transactions.dart';
import 'use_case.dart';

@injectable
class GetTransactionsByPeriodUseCase
    implements
        UseCase<BaseError, List<TransactionExtended>,
            GetTransactionsByPeriodUseCaseParams> {
  const GetTransactionsByPeriodUseCase(
    this._transactionRepository,
    this._bankAccountRepository,
  );

  final TransactionRepository _transactionRepository;
  final BankAccountRepository _bankAccountRepository;

  @override
  Future<Either<BaseError, List<TransactionExtended>>> call(
    GetTransactionsByPeriodUseCaseParams params,
  ) async {
    final bankAccountsResponse = await _bankAccountRepository.getBankAccounts();
    if (bankAccountsResponse.isLeft) {
      return Left(bankAccountsResponse.asLeft?.value ?? BaseError.unknown());
    }
    final bankAccounts = bankAccountsResponse.asRight;
    late int accountId;
    if (bankAccounts != null && bankAccounts.value.isNotEmpty) {
      accountId = bankAccounts.value.first.id;
    }
    final result = await _transactionRepository.getTransactionsByPeriod(
      accountId: accountId,
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
    this.from,
    this.to,
  });

  final DateTime? from;
  final DateTime? to;
}
