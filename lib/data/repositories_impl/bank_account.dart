import '../../domain/entities/account_extended.dart';
import '../../domain/entities/error.dart';
import '../../domain/repositories/bank_account.dart';
import '../../utils/either.dart';
import '../data_source/rest/api_service.dart';
import '../mappers/account.dart';
import '../models/request/account_create_request.dart';
import '../models/request/account_update_request.dart';
import '../models/response/account_history_response.dart';

class BankAccountRepositoryImpl implements BankAccountRepository {
  BankAccountRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<BaseError, AccountExtended>> createBankAccount({
    required AccountCreateRequest account,
  }) async {
    try {
      final response = await _apiService.createAccount(account);
      return Right(response.toDomainExtended());
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<BaseError, AccountHistoryResponse>> getAccountHistory({
    required int accountId,
  }) async {
    try {
      final response = await _apiService.getAccountHistory(accountId);
      return Right(response);
    } catch (e) {
      return Left(BaseError(message: e.toString()));
    }
  }

  @override
  Future<Either<BaseError, AccountExtended>> getBankAccountById({
    required int accountId,
  }) {
    // Не поддерживается в этой версии приложения
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<AccountExtended>>> getBankAccounts() async {
    try {
      final response = await _apiService.getAccounts();
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
    // Не поддерживается в этой версии приложения
    throw UnimplementedError();
  }
}
