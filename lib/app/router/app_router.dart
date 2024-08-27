import 'package:get/get.dart';
import 'package:live_chat/app/page/login/login_view.dart';

/// FileName app_router
///
/// @Author mac
/// @Date 2024/5/29 10:41
///AIzaSyDrCoeoe5c05uxX0NpVJ2lWX1cu30pMKP4
/// @Description TODO

class AppRouter{

  static getAllRoutS() {
    return [
      // GetPage(
      //   name: RouterId.splash,
      //   page: () => const SplashPage(),
      // ),
      GetPage(
        name: RouterId.login,
        page: () => const LoginPage(),
      ),
      // GetPage(
      //   name: RouterId.main,
      //   page: () => const MainPage(),
      // ),
      // ...ShopRouterS.routerS
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