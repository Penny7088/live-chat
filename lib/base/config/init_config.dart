import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/local/env/EnvConfig.dart';
import '../../app/net/client.dart';
import '../../app/net/dio_cache_tool.dart';
import '../../app/net/http_config.dart';
import '../../app/net/interceptor/common_interceptor.dart';
import '../../app/net/transformer.dart';
import '../../app/theme/theme_service.dart';
import '../../base/utils/light_model.dart';

/// FileName init_config
///
/// @Author mac
/// @Date 2024/5/28 20:50
///
/// @Description TODO

configInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initThirdParty();
}

initThirdParty() async {
  await fromPlatform();
  await storageKV.init();
  await EnvConfig().init();
  await initNetWork();
  await DioCacheTool.initCacheStore();
  Get.lazyPut<ThemeService>(() => ThemeService(), fenix: true);
}

fromPlatform() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await Firebase.initializeApp();
}

initNetWork() async {
  NormalDefaultTransformer.getInstance().setHttpConfig(
    config: HttpResponseConfig(
      status: "code",
      code: "code",
      msg: "msg",
      data: "data",
      successCode: 0,
    ),
  );
  String baseUrl = await EnvConfig().obtainBaseUrl();
  HttpConfig config = HttpConfigBuilder().setBaseUrl(baseUrl).addAllInterceptors([
    DioCacheTool.init(),
    CommonInterceptor(),
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
    ),
  ]).create();
  Get.put(HttpClient(normalHttpConfig: config), permanent: true, tag: HttpClient.defaultClientTag);
}
