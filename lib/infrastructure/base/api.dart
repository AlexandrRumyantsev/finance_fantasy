import 'package:dio/dio.dart';

import 'interceptor.dart';

class API {
  static final BaseOptions _options = BaseOptions();

  static const Map<String, dynamic> baseHeaders = {
    'Accept': 'application/json, application/problem+json',
    'Content-Type': 'application/json',
  };

  static const String baseUrl = 'https://shmr-finance.ru/api/v1/';

  static final Dio dio = Dio(
    _options
      ..baseUrl = baseUrl
      ..headers = baseHeaders,
  ) ..interceptors.add(AuthInterceptor());
}
