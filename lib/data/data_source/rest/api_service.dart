import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../infrastructure/base/deserializer.dart';
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
import 'api_service_interface.dart';

@injectable
class ApiServiceImpl implements ApiService {
  ApiServiceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<AccountDto>> getAccounts() async {
    final response = await _apiClient.getAccounts();
    return deserializeList<AccountDto>(response.data, AccountDto.fromJson);
  }

  @override
  Future<AccountDto> createAccount(AccountCreateRequest account) async {
    final response = await _apiClient.createAccount(account);
    return deserialize<AccountDto>(response.data, AccountDto.fromJson);
  }

  @override
  Future<HttpResponse<dynamic>> deleteAccount(int id) async {
    return _apiClient.deleteAccount(id);
  }

  @override
  Future<AccountDto> updateAccount(int id, AccountUpdateRequest account) async {
    final response = await _apiClient.updateAccount(id, account);
    return deserialize<AccountDto>(response.data, AccountDto.fromJson);
  }

  @override
  Future<AccountResponse> getAccountById(int id) async {
    final response = await _apiClient.getAccountById(id);
    return deserialize<AccountResponse>(
      response.data,
      AccountResponse.fromJson,
    );
  }

  @override
  Future<AccountHistoryResponse> getAccountHistory(int id) async {
    final response = await _apiClient.getAccountHistory(id);
    return deserialize<AccountHistoryResponse>(
      response.data,
      AccountHistoryResponse.fromJson,
    );
  }

  @override
  Future<TransactionDto> createTransaction(
    TransactionRequest transaction,
  ) async {
    final response = await _apiClient.createTransaction(transaction);
    return deserialize<TransactionDto>(response.data, TransactionDto.fromJson);
  }

  @override
  Future<TransactionResponse> getTransactionById(int id) async {
    final response = await _apiClient.getTransactionById(id);
    return deserialize<TransactionResponse>(
      response.data,
      TransactionResponse.fromJson,
    );
  }

  @override
  Future<TransactionResponse> updateTransaction(
    int id,
    TransactionRequest transaction,
  ) async {
    final response = await _apiClient.updateTransaction(id, transaction);
    return deserialize<TransactionResponse>(
      response.data,
      TransactionResponse.fromJson,
    );
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final response = await _apiClient.deleteTransaction(id);
    if (response.response.statusCode != 200 &&
        response.response.statusCode != 204) {
      throw Exception('Failed to delete transaction');
    }
  }

  @override
  Future<List<TransactionResponse>> getTransactionsByPeriod(
    int accountId,
    String? from,
    String? to,
  ) async {
    final response =
        await _apiClient.getTransactionsByPeriod(accountId, from, to);
    return deserializeList<TransactionResponse>(
      response.data,
      TransactionResponse.fromJson,
    );
  }

  @override
  Future<List<CategoryDto>> getCategories() async {
    final response = await _apiClient.getCategories();
    return deserializeList<CategoryDto>(response.data, CategoryDto.fromJson);
  }

  @override
  Future<List<CategoryDto>> getCategoriesByType(bool isIncome) async {
    final response = await _apiClient.getCategoriesByType(isIncome);
    return deserializeList<CategoryDto>(response.data, CategoryDto.fromJson);
  }
}
