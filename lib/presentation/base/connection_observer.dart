import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../infrastructure/managers/internet_connection.dart';

abstract class ConnectionObserverCubit<State> extends Cubit<State> {
  FutureOr<void> onConnectionAppeared() {}

  FutureOr<void> onConnectionLost() {}

  late final StreamSubscription<bool> _subscription;

  final _manager = getIt<InternetConnectionManager>();

  Future<bool> get hasConnection => _manager.hasInternetConnection;

  ConnectionObserverCubit(super.initialState) {
    print('ConnectionObserverCubit constructor');
    init();
  }

  void init() {
    print('init called');
    _subscription =
        _manager.hasInternetConnectionStream.listen((hasConnection) {
      if (hasConnection) {
        onConnectionAppeared();
      } else {
        onConnectionLost();
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
