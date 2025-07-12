import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class InternetConnectionManager {
  final _connectivity = Connectivity();

  late final Stream<bool> hasInternetConnectionStream;

  Future<bool> get hasInternetConnection async {
    final connections = await _connectivity.checkConnectivity();
    return _checkIfHaveInternetConnection(connections);
  }

  InternetConnectionManager() {
    hasInternetConnectionStream =
        _connectivity.onConnectivityChanged.map(_checkIfHaveInternetConnection);
  }

  bool _checkIfHaveInternetConnection(List<ConnectivityResult> connections) {
    return connections.contains(ConnectivityResult.mobile) ||
        connections.contains(ConnectivityResult.ethernet) ||
        connections.contains(ConnectivityResult.wifi);
  }
}
