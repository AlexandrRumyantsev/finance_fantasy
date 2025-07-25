import 'package:injectable/injectable.dart';

import '../../data/data_source/rest/api_service_interface.dart';
import '../../data/models/request/account_create_request.dart';
import '../../data/models/request/account_update_request.dart';
import '../../data/models/response/account_history_response.dart';
import '../../data/repositories_impl/bank_account.dart';
import '../../utils/either.dart';
import '../entities/account_extended.dart';
import '../entities/error.dart';

@singleton
abstract interface class BankAccountRepository {
  @factoryMethod
  factory BankAccountRepository(ApiService client) =>
      BankAccountRepositoryImpl(client);

  Future<Either<BaseError, List<AccountExtended>>> getBankAccounts();

  Future<Either<BaseError, AccountExtended>> createBankAccount({
    required AccountCreateRequest account,
  });

  Future<Either<BaseError, AccountExtended>> updateBankAccount({
    required AccountUpdateRequest account,
    required int accountId,
  });

  Future<Either<BaseError, AccountExtended>> getBankAccountById({
    required int accountId,
  });

  Future<Either<BaseError, AccountHistoryResponse>> getAccountHistory({
    required int accountId,
  });
}
