import 'dart:io';

import 'package:dio/dio.dart';
import 'package:live_chat/app/tool/device_utils.dart';

class CommonInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var deviceId = await DeviceUtils.getDeviceId();
    var token = await DeviceUtils.getToken();
    options.headers['token'] = token;
    options.headers['platform'] = Platform.isIOS ? 'ios' : 'android';
    options.headers['deviceToken'] = deviceId;
    handler.next(options);
  }
}
