import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/net/client.dart';

import '../net/dio_cache_tool.dart';
import '../net/http_response.dart';
import 'package:dio/dio.dart' as fdata;

import '../net/transformer.dart';

HttpClient defaultClient() {
  return Get.find<HttpClient>(
    tag: HttpClient.defaultClientTag,
  );
}

enum Method { get, post, delete ,put}

mixin class ApiFetch {


  Future<ApiResponse> request({
    required String path,
    dynamic data,
    Method method = Method.post,
    bool isShowLoad = true,
    bool isShowError = true,
    NormalDefaultTransformer? httpTransformer,
    CachePolicy policy = CachePolicy.request,
    Options? options,
    bool isFormData = true,
  }) async {
    ApiResponse res;
    Map<String, dynamic> params = {};
    if (data is! fdata.FormData) {
      params.addAll(data ?? {});
    }

    options ??= DioCacheTool.cacheOptions
        ?.copyWith(
          policy: policy,
          keyBuilder: (request) {
            String keyB = data.toString();
            keyB = "$path$keyB";
            return keyB;
          },
        )
        .toOptions();
    if (method == Method.get) {
      res = await defaultClient().get(
        url: path,
        queryParameters: params,
        httpTransformer: httpTransformer,
        options: options,
      );
    } else if (method == Method.post) {
      res = await defaultClient().post(
        path,
        data: isFormData ? fdata.FormData.fromMap(data ?? {}) : params,
        httpTransformer: httpTransformer,
        options: options,
      );
    } else if(method == Method.delete){
      res = await defaultClient().delete(
        path,
        data: isFormData ? fdata.FormData.fromMap(data ?? {}) : params,
        httpTransformer: httpTransformer,
        options: options,
      );
    }else{
      res = await defaultClient().put(
        path,
        data: isFormData ? fdata.FormData.fromMap(data ?? {}) : params,
        httpTransformer: httpTransformer,
        options: options,
      );
    }

    return res;
  }
}
