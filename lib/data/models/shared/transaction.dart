import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

part 'transaction.g.dart';

@freezed
abstract class TransactionDto with _$TransactionDto {
  const factory TransactionDto({
    required int id,
    required int accountId,
    required int categoryId,
    required String amount,
    required DateTime transactionDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? comment,
  }) = _TransactionDto;

  factory TransactionDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDtoFromJson(json);
}
