import '../../domain/entities/account_extended.dart';
import '../../domain/entities/error.dart';
import '../../domain/repositories/bank_account.dart';
import '../../utils/either.dart';
import '../data_source/rest/accounts.dart';
import '../mappers/account.dart';
import '../models/request/account_create_request.dart';
import '../models/request/account_update_request.dart';
import '../models/response/account_history_response.dart';

class BankAccountRepositoryImpl implements BankAccountRepository {
  BankAccountRepositoryImpl(this._client);
  final AccountsClient _client;

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
  Future<Either<BaseError, List<AccountExtended>>> getBankAccounts() async {
    try {
      final response = await _client.getAccounts();
      return Right(response.map((e) => e.toDomainExtended()).toList());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
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
