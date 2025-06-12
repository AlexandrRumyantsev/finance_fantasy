import 'package:finance_fantasy/data/models/response/account_history_response.dart';
import '../../data/models/request/account_create_request.dart';
import '../../data/models/request/account_update_request.dart';
import '../../data/models/shared/account.dart';
import '../../utils/either.dart';
import '../entities/error.dart';

/// TODO: Заменить AccountDto на Account(Entity) когда появится domain слой
abstract class BankAccountRepository {
  Future<Either<BaseError, List<AccountDto>>> getBankAccounts();

  Future<Either<BaseError, AccountDto>> createBankAccount({
    required AccountCreateRequest account,
  });

  Future<Either<BaseError, AccountDto>> updateBankAccount({
    required AccountUpdateRequest account,
    required int accountId,
  });

  Future<Either<BaseError, AccountDto>> getBankAccountById({
    required int accountId,
  });

  Future<Either<BaseError, AccountHistoryResponse>> getAccountHistory({
    required int accountId,
  });
}
