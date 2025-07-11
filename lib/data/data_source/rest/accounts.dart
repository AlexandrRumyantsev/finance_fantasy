import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/request/account_create_request.dart';
import '../../models/request/account_update_request.dart';
import '../../models/response/account_history_response.dart';
import '../../models/response/account_response.dart';
import '../../models/shared/account.dart';

part 'accounts.g.dart';

/// [AccountsClient] is a client for the accounts API.
@injectable
@RestApi()
abstract class AccountsClient {
  @factoryMethod
  factory AccountsClient(Dio dio) => _AccountsClient(dio);

  @GET('/accounts')
  Future<List<AccountDto>> getAccounts();

  @POST('/accounts')
  Future<AccountDto> createAccount(@Body() AccountCreateRequest account);

  @DELETE('/accounts/{id}')
  Future<HttpResponse> deleteAccount(@Path('id') int id);

  @PUT('/accounts/{id}')
  Future<AccountDto> updateAccount(
    @Path('id') int id,
    @Body() AccountUpdateRequest account,
  );

  @GET('/accounts/{id}')
  Future<AccountResponse> getAccountById(@Path('id') int id);

  @GET('/accounts/{id}/history')
  Future<AccountHistoryResponse> getAccountHistory(@Path('id') int id);
}
