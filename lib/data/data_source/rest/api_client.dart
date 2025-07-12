import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/request/account_create_request.dart';
import '../../models/request/account_update_request.dart';
import '../../models/request/transaction_request.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) => _ApiClient(dio);

  /// Получить все аккаунты
  @GET('/accounts')
  Future<HttpResponse<dynamic>> getAccounts();

  /// Создать новый аккаунт
  @POST('/accounts')
  Future<HttpResponse<dynamic>> createAccount(
    @Body() AccountCreateRequest account,
  );

  /// Удалить аккаунт по ID
  @DELETE('/accounts/{id}')
  Future<HttpResponse<dynamic>> deleteAccount(@Path('id') int id);

  /// Обновить аккаунт по ID
  @PUT('/accounts/{id}')
  Future<HttpResponse<dynamic>> updateAccount(
    @Path('id') int id,
    @Body() AccountUpdateRequest account,
  );

  /// Получить аккаунт по ID
  @GET('/accounts/{id}')
  Future<HttpResponse<dynamic>> getAccountById(@Path('id') int id);

  /// Получить историю аккаунта по ID
  @GET('/accounts/{id}/history')
  Future<HttpResponse<dynamic>> getAccountHistory(@Path('id') int id);

  /// Создать новую транзакцию
  @POST('/transactions')
  Future<HttpResponse<dynamic>> createTransaction(
    @Body() TransactionRequest transaction,
  );

  /// Получить транзакцию по ID
  @GET('/transactions/{id}')
  Future<HttpResponse<dynamic>> getTransactionById(@Path('id') int id);

  /// Обновить транзакцию по ID
  @PUT('/transactions/{id}')
  Future<HttpResponse<dynamic>> updateTransaction(
    @Path('id') int id,
    @Body() TransactionRequest transaction,
  );

  /// Удалить транзакцию по ID
  @DELETE('/transactions/{id}')
  Future<HttpResponse<dynamic>> deleteTransaction(@Path('id') int id);

  /// Получить транзакции по периоду для аккаунта
  @GET('/transactions/account/{accountId}/period')
  Future<HttpResponse<dynamic>> getTransactionsByPeriod(
    @Path('accountId') int accountId,
    @Query('startDate') String? from,
    @Query('endDate') String? to,
  );

  /// Получить все категории
  @GET('/categories')
  Future<HttpResponse<dynamic>> getCategories();

  /// Получить категории по типу (доход/расход)
  @GET('/categories/type/{isIncome}')
  Future<HttpResponse<dynamic>> getCategoriesByType(@Path() bool isIncome);
}
