import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_state.dart';

part 'account_history.freezed.dart';

part 'account_history.g.dart';

@freezed
abstract class AccountHistoryDto with _$AccountHistoryDto {
  const factory AccountHistoryDto({
    required int id,
    required int accountId,
    required ChangeType changeType,
    required AccountStateDto previousState,
    required AccountStateDto newState,
    required DateTime changeTimestamp,
    required DateTime createdAt,
  }) = _AccountHistoryDto;

  factory AccountHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryDtoFromJson(json);
}

enum ChangeType {
  @JsonValue('CREATION')
  creation,
  @JsonValue('MODIFICATION')
  modification,
}
