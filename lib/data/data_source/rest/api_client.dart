import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/request/account_create_request.dart';
import '../../models/request/account_update_request.dart';
import '../../models/request/transaction_request.dart';
import '../../models/response/account_history_response.dart';
import '../../models/response/account_response.dart';
import '../../models/response/transaction_response.dart';
import '../../models/shared/account.dart';
import '../../models/shared/category.dart';
import '../../models/shared/transaction.dart';

part 'api_client.g.dart';

/// Универсальный API клиент для всех эндпоинтов
@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) => _ApiClient(dio);

  /// Получить все аккаунты
  @GET('/accounts')
  Future<List<AccountDto>> getAccounts();

  /// Создать новый аккаунт
  @POST('/accounts')
  Future<AccountDto> createAccount(@Body() AccountCreateRequest account);

  /// Удалить аккаунт по ID
  @DELETE('/accounts/{id}')
  Future<HttpResponse> deleteAccount(@Path('id') int id);

  /// Обновить аккаунт по ID
  @PUT('/accounts/{id}')
  Future<AccountDto> updateAccount(
    @Path('id') int id,
    @Body() AccountUpdateRequest account,
  );

  /// Получить аккаунт по ID
  @GET('/accounts/{id}')
  Future<AccountResponse> getAccountById(@Path('id') int id);

  /// Получить историю аккаунта по ID
  @GET('/accounts/{id}/history')
  Future<AccountHistoryResponse> getAccountHistory(@Path('id') int id);

  /// Создать новую транзакцию
  @POST('/transactions')
  Future<TransactionDto> createTransaction(
    @Body() TransactionRequest transaction,
  );

  /// Получить транзакцию по ID
  @GET('/transactions/{id}')
  Future<TransactionResponse> getTransactionById(@Path('id') int id);

  /// Обновить транзакцию по ID
  @PUT('/transactions/{id}')
  Future<TransactionResponse> updateTransaction(
    @Path('id') int id,
    @Body() TransactionRequest transaction,
  );

  /// Удалить транзакцию по ID
  @DELETE('/transactions/{id}')
  Future<void> deleteTransaction(@Path('id') int id);

  /// Получить транзакции по периоду для аккаунта
  @GET('/transactions/account/{accountId}/period')
  Future<List<TransactionResponse>> getTransactionsByPeriod(
    @Path('accountId') int accountId,
    @Query('startDate') String? from,
    @Query('endDate') String? to,
  );

  /// Получить все категории
  @GET('/categories')
  Future<List<CategoryDto>> getCategories();

  /// Получить категории по типу (доход/расход)
  @GET('/categories/type/{isIncome}')
  Future<List<CategoryDto>> getCategoriesByType(@Path() bool isIncome);
}
