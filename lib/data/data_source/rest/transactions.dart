import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/request/transaction_request.dart';
import '../../models/response/transaction_response.dart';
import '../../models/shared/transaction.dart';

part 'transactions.g.dart';

@injectable
@RestApi()
abstract class TransactionsClient {
  @factoryMethod
  factory TransactionsClient(Dio dio) => _TransactionsClient(dio);

  @POST('/transactions')
  Future<TransactionDto> createTransaction(
    @Body() TransactionRequest transaction,
  );

  @GET('/transactions/{id}')
  Future<TransactionResponse> getTransactionById(@Path('id') int id);

  @PUT('/transactions/{id}')
  Future<TransactionResponse> updateTransaction(
    @Path('id') int id,
    @Body() TransactionRequest transaction,
  );

  @DELETE('/transactions/{id}')
  Future<HttpResponse> deleteTransaction(@Path('id') int id);

  @GET('/transactions/account/{accountId}/period')
  Future<List<TransactionResponse>> getTransactionsByPeriod(
    @Path('accountId') int accountId,
    @Query('startDate') String? from,
    @Query('endDate') String? to,
  );
}
