import 'package:get/get.dart';
import 'package:live_chat/app/page/login/login_view.dart';

import '../page/login/login_router.dart';

/// FileName app_router
///
/// @Author mac
/// @Date 2024/5/29 10:41
///AIzaSyDrCoeoe5c05uxX0NpVJ2lWX1cu30pMKP4
/// @Description TODO

class AppRouter{

  static List<GetPage> getAllRoutS() {
    return [
      GetPage(
        name: RouterId.login,
        page: () => const LoginPage(),
      ),
     ...LoginRouter.routers()
    ];
  }

  // 设置默认入口页
  static configNormalRouts() {
    return RouterId.login;
  }
}

class RouterId {
  static const String splash = '/app/splash';
  static const String main = '/app/main';
  static const String login = '/app/login';
}