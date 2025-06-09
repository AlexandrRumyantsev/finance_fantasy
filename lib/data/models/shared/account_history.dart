import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_state.dart';

part 'account_history.freezed.dart';

part 'account_history.g.dart';

@freezed
abstract class AccountHistory with _$AccountHistory {
  const factory AccountHistory({
    required int id,
    required int accountId,
    required ChangeType changeType,
    required AccountState previousState,
    required AccountState newState,
    required DateTime changeTimestamp,
    required DateTime createdAt,
  }) = _AccountHistory;

  factory AccountHistory.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryFromJson(json);
}

enum ChangeType {
  @JsonValue('CREATION')
  creation,
  @JsonValue('MODIFICATION')
  modification,
}
