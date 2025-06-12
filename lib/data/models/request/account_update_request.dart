import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_update_request.g.dart';

part 'account_update_request.freezed.dart';

@freezed
abstract class AccountUpdateRequest with _$AccountUpdateRequest {
  const factory AccountUpdateRequest({
    required String name,
    required String balance,
    required String currency,
  }) = _AccountUpdateRequest;

  factory AccountUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountUpdateRequestFromJson(json);
}
