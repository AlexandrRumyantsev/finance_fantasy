import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../infrastructure/managers/manager.dart';
import '../../../base/connection_observer.dart';

part 'state.dart';

@injectable
class ConnectionWarningCubit
    extends ConnectionObserverCubit<ConnectionWarningState> {
  ConnectionWarningCubit() : super(const ConnectionWarningState(true));

  @override
  FutureOr<void> onConnectionAppeared() {
    emit(state.copyWith(hasConnection: true));
  }

  @override
  FutureOr<void> onConnectionLost() {
    emit(state.copyWith(hasConnection: false));
    NavigationManager.showConnectionWarning();
  }
}
