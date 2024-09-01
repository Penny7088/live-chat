import 'package:get/get.dart';

import 'information/information_view.dart';

class LoginRouter {
  static const String LOGIN_INFORMATION = '/login/information';

  static List<GetPage> routers() {
    return [
      GetPage(
        name: LOGIN_INFORMATION,
        page: () => const InformationPage(),
      ),
    ];
  }
}