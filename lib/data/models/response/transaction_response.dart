import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/account_brief.dart';
import '../shared/category.dart';


part 'transaction_response.freezed.dart';

part 'transaction_response.g.dart';

@freezed
abstract class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    required int id,
    required AccountBriefDto account,
    required CategoryDto category,
    required String amount,
    required DateTime transactionDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? comment,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
}
