import 'package:dio/dio.dart';
import 'package:live_chat/app/net/client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'http_config.dart';

class HttpOptions {
  /// private constructor
  HttpOptions._() : _httpConfigBuilder = HttpConfigBuilder();

  /// the one and only instance of this singleton
  static final instance = HttpOptions._();

  final HttpConfigBuilder _httpConfigBuilder;

  late HttpClient httpClient;

  HttpOptions setBaseUrl(String baseUrl) {
    _httpConfigBuilder.setBaseUrl(baseUrl);
    return instance;
  }

  HttpOptions setConnectTimeout(Duration connectTimeout) {
    _httpConfigBuilder.setConnectTimeout(connectTimeout);
    return instance;
  }

  HttpOptions addHeaders(Map<String, dynamic> headers) {
    _httpConfigBuilder.addHeaders(headers);
    return instance;
  }

  /// Setting the httpClientAdapter for the http request.
  ///  ex: proxy Certificate
  HttpOptions setHttpClientAdapter(HttpClientAdapter httpClientAdapter) {
    _httpConfigBuilder.setHttpClientAdapter(httpClientAdapter);
    return instance;
  }

  /// Adding an interceptor to the dio instance.
  HttpOptions addInterceptor(Interceptor interceptor) {
    _httpConfigBuilder.addInterceptor(interceptor);
    return instance;
  }

  /// Adding all the interceptors to the dio instance.
  HttpOptions addAllInterceptors(List<Interceptor> interceptors) {
    _httpConfigBuilder.addAllInterceptors(interceptors);
    return instance;
  }

  /// Setting the timeout for receiving data.
  HttpOptions setReceiveTimeout(Duration receiveTimeout) {
    _httpConfigBuilder.setReceiveTimeout(receiveTimeout);
    return instance;
  }

  /// Setting the timeout for sending data.
  HttpOptions setSendTimeout(Duration sendTimeout) {
    _httpConfigBuilder.setSendTimeout(sendTimeout);
    return instance;
  }


  /// 配置网络请求并初始化
  void create() {
    var httpConfig = _httpConfigBuilder.create();
    httpClient = HttpClient(normalHttpConfig: httpConfig);
  }
}


