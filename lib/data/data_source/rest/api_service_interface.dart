import 'package:injectable/injectable.dart';

import '../../models/request/account_create_request.dart';
import '../../models/request/account_update_request.dart';
import '../../models/request/transaction_request.dart';
import '../../models/response/account_history_response.dart';
import '../../models/response/account_response.dart';
import '../../models/response/transaction_response.dart';
import '../../models/shared/account.dart';
import '../../models/shared/category.dart';
import '../../models/shared/transaction.dart';
import 'api_client.dart';
import 'api_service.dart' show ApiServiceImpl;

@injectable
abstract interface class ApiService {
  @factoryMethod
  factory ApiService(ApiClient client) => ApiServiceImpl(client);

  // Account methods
  Future<List<AccountDto>> getAccounts();
  Future<AccountDto> createAccount(AccountCreateRequest account);
  Future<void> deleteAccount(int id);
  Future<AccountDto> updateAccount(int id, AccountUpdateRequest account);
  Future<AccountResponse> getAccountById(int id);
  Future<AccountHistoryResponse> getAccountHistory(int id);

  // Transaction methods
  Future<TransactionDto> createTransaction(TransactionRequest transaction);
  Future<TransactionResponse> getTransactionById(int id);
  Future<TransactionResponse> updateTransaction(
      int id, TransactionRequest transaction);
  Future<void> deleteTransaction(int id);
  Future<List<TransactionResponse>> getTransactionsByPeriod(
      int accountId, String? from, String? to);

  // Category methods
  Future<List<CategoryDto>> getCategories();
  Future<List<CategoryDto>> getCategoriesByType(bool isIncome);
}
