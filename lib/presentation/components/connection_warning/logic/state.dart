// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cubit.dart';

/// Стэйт кубита для отслеживания интернет соединения
///
class ConnectionWarningState extends Equatable {
  /// Состояние интернет соединения
  final bool hasConnection;

  const ConnectionWarningState(this.hasConnection);

  @override
  List<Object> get props => [hasConnection];

  ConnectionWarningState copyWith({
    bool? hasConnection,
  }) {
    return ConnectionWarningState(
      hasConnection ?? this.hasConnection,
    );
  }
}
