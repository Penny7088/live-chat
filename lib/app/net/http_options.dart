import 'package:dio/dio.dart';
import 'package:live_chat/app/net/client.dart';

import 'http_config.dart';

class HttpOptions {
  HttpOptions._() : _httpConfigBuilder = HttpConfigBuilder();
  final HttpConfigBuilder _httpConfigBuilder;

  static final instance = HttpOptions._();

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


  HttpOptions setHttpClientAdapter(HttpClientAdapter httpClientAdapter) {
    _httpConfigBuilder.setHttpClientAdapter(httpClientAdapter);
    return instance;
  }

  HttpOptions addInterceptor(Interceptor interceptor) {
    _httpConfigBuilder.addInterceptor(interceptor);
    return instance;
  }

  HttpOptions addAllInterceptors(List<Interceptor> interceptors) {
    _httpConfigBuilder.addAllInterceptors(interceptors);
    return instance;
  }

  HttpOptions setReceiveTimeout(Duration receiveTimeout) {
    _httpConfigBuilder.setReceiveTimeout(receiveTimeout);
    return instance;
  }

  HttpOptions setSendTimeout(Duration sendTimeout) {
    _httpConfigBuilder.setSendTimeout(sendTimeout);
    return instance;
  }


  void create() {
    var httpConfig = _httpConfigBuilder.create();
    httpClient = HttpClient(normalHttpConfig: httpConfig);
  }
}


