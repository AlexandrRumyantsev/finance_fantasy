import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

part 'account.g.dart';

@freezed
abstract class AccountDto with _$AccountDto {
  const factory AccountDto({
    required int id,
    required int userId,
    required String name,
    required String currency,
    required String balance,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);
}
