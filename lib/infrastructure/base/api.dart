import 'package:dio/dio.dart';

import 'interceptor.dart';

class API {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://shmr-finance.ru/api/v1',
      headers: {
        'Accept': 'application/json, application/problem+json',
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(AuthInterceptor());
}