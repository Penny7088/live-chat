import 'package:get/get.dart';
import 'package:live_chat/app/page/common/country_page/country_page/country_page_view.dart';

import '../common/language_page/language_page_view.dart';
import 'information/information_view.dart';

class LoginRouter {
  static const String LOGIN_INFORMATION = '/login/information';
  static const String LOGIN_COUNTRY = '/login/country';
  static const String LOGIN_LANGUAGE = '/login/language';

  static List<GetPage> routers() {
    return [
      GetPage(
        name: LOGIN_INFORMATION,
        page: () => const InformationPage(),
      ),
      GetPage(
        name: LOGIN_COUNTRY,
        transition: Transition.rightToLeft,
        page: () => const CountryPage(),
      ),
      GetPage(
        name: LOGIN_LANGUAGE,
        transition: Transition.rightToLeft,
        page: () => const LanguagePage(),
      ),
    ];
  }
}