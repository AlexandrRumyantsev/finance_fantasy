import 'package:finance_fantasy/domain/entities/account_fields.dart';

import '../../data/models/shared/account.dart';
import '../../utils/either.dart';
import '../entities/error.dart';

/// TODO: Заменить AccountDto на Account(Entity) когда появится domain слой
abstract class BankAccountRepository {
  Future<Either<BaseError, List<AccountDto>>> getBankAccounts();

  Future<Either<BaseError, AccountDto>> createBankAccount(
    AccountFields account,
  );

  Future<Either<BaseError, AccountDto>> updateBankAccount(
    AccountFields account,
    int accountId,
  );

  Future<Either<BaseError, AccountDto>> getBankAccountById(
    int accountId,
  );
}
