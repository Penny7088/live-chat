import 'package:get/get.dart';
import 'package:live_chat/app/page/sign_up_forget/sign_up_or_forget_state.dart';
import 'package:live_chat/app/page/sign_up_forget/sign_up_or_forget_view.dart';
import 'package:live_chat/app/page/splash/splash_view.dart';
import '../page/login_email/login_email_view.dart';
import '../page/login_social/login_router.dart';
import '../page/login_social/login_view.dart';

/// FileName app_router
///
/// @Author mac
/// @Date 2024/5/29 10:41
/// @Description

class AppRouter{

  static List<GetPage> getAllRoutS() {
    return [
      GetPage(
        name: RouterId.splash,
        page: () => const SplashPage(),
      ),

     ...LoginRouter.routers()
    ];
  }

  // 设置默认入口页
  static configNormalRouts() {
    return RouterId.splash;
  }
}

class RouterId {
  static const String splash = '/app/splash';
  static const String main = '/app/main';
}