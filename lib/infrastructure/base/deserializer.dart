import 'package:worker_manager/worker_manager.dart';

Future<T> deserialize<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic>) fromJson,
) {
  return workerManager.execute(
    () => fromJson(json),
  );
}

Future<List<T>> deserializeList<T>(
  List<dynamic> jsonList,
  T Function(Map<String, dynamic>) fromJson,
) async {
  return Future.wait(
    jsonList
        .map((json) => workerManager.execute(() => fromJson(json)))
        .toList(),
  );
}
