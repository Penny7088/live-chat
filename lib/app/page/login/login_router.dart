import 'package:get/get.dart';
import 'package:live_chat/app/page/common/country_page/country_page/country_page_view.dart';

import 'information/information_view.dart';

class LoginRouter {
  static const String LOGIN_INFORMATION = '/login/information';
  static const String LOGIN_COUNTRY = '/login/country';

  static List<GetPage> routers() {
    return [
      GetPage(
        name: LOGIN_INFORMATION,
        page: () => const InformationPage(),
      ),
      GetPage(
        name: LOGIN_COUNTRY,
        page: () => const CountryPage(),
      ),
    ];
  }
}