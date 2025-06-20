import 'package:finance_fantasy/data/models/response/account_history_response.dart';
import '../../data/models/request/account_create_request.dart';
import '../../data/models/request/account_update_request.dart';
import '../../utils/either.dart';
import '../entities/account_extended.dart';
import '../entities/error.dart';

/// TODO: Заменить AccountHistoryResponse на entity
abstract interface class BankAccountRepository {
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
