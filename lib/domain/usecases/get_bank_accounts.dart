import 'package:injectable/injectable.dart';

import '../../utils/either.dart';
import '../entities/account_brief.dart';
import '../entities/error.dart';
import '../repositories/bank_account.dart';
import 'use_case.dart';

@injectable
class GetBankAccountsUseCase
    implements UseCase<BaseError, List<AccountBrief>, void> {
  GetBankAccountsUseCase(this.bankAccountRepository);

  final BankAccountRepository bankAccountRepository;

  @override
  Future<Either<BaseError, List<AccountBrief>>> call(_) async {
    return bankAccountRepository.getBankAccounts();
  }
}
