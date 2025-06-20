import 'package:finance_fantasy/data/models/request/account_create_request.dart';

import 'package:finance_fantasy/data/models/request/account_update_request.dart';

import 'package:finance_fantasy/data/models/response/account_history_response.dart';
import 'package:finance_fantasy/domain/entities/account_extended.dart';

import 'package:finance_fantasy/domain/entities/error.dart';

import 'package:finance_fantasy/utils/either.dart';

import '../../../domain/repositories/bank_account.dart';

class BankAccountApiRepository implements BankAccountRepository {
  @override
  Future<Either<BaseError, AccountExtended>> createBankAccount({
    required AccountCreateRequest account,
  }) {
    // TODO: implement createBankAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, AccountHistoryResponse>> getAccountHistory({
    required int accountId,
  }) {
    // TODO: implement getAccountHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, AccountExtended>> getBankAccountById({
    required int accountId,
  }) {
    // TODO: implement getBankAccountById
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<AccountExtended>>> getBankAccounts() {
    // TODO: implement getBankAccounts
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, AccountExtended>> updateBankAccount({
    required AccountUpdateRequest account,
    required int accountId,
  }) {
    // TODO: implement updateBankAccount
    throw UnimplementedError();
  }
}
