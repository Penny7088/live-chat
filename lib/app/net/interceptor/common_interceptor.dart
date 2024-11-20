
import 'package:dio/dio.dart';

class CommonInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['token'] = "";
    handler.next(options);
  }
}
