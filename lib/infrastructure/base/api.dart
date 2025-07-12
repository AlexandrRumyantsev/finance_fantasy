import 'package:dio/dio.dart';

import 'interceptor.dart';
import 'retry_interceptor.dart';

class API {
  static late final Dio dio;

  static void initialize() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://shmr-finance.ru/api/v1',
        headers: {
          'Accept': 'application/json, application/problem+json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      RetryInterceptor(dio: dio),
    ]);
  }
}
