import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
  Get.lazyPut<ThemeService>(() => ThemeService(), fenix: true);
}

fromPlatform() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await Firebase.initializeApp();
}
