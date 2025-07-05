import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request.freezed.dart';

part 'transaction_request.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime date) => date.toUtc().toIso8601String();
}

@freezed
abstract class TransactionRequest with _$TransactionRequest {
  const factory TransactionRequest({
    required int accountId,
    required int categoryId,
    required String amount,
    @DateTimeConverter() required DateTime transactionDate,
    String? comment,
  }) = _TransactionRequest;

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);
}
