import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey != null && apiKey.isNotEmpty && apiKey != 'your_api_key_here') {
      options.headers['Authorization'] = 'Bearer $apiKey';
    }
    handler.next(options);
  }
}
