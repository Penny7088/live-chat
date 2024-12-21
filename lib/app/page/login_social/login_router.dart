import 'package:get/get.dart';
import 'package:live_chat/app/page/common/country_page/country_page/country_page_view.dart';

import '../common/language_page/language_page_view.dart';
import '../login_email/login_email_view.dart';
import '../sign_up_forget/sign_up_or_forget_state.dart';
import '../sign_up_forget/sign_up_or_forget_view.dart';
import 'information/information_view.dart';
import 'login_view.dart';

class LoginRouter {
  static const String loginInformation = '/login/information';
  static const String loginCountry = '/login/country';
  static const String loginLanguage = '/login/language';
  static const String loginSocial = '/app/login_social';
  static const String loginEmail = '/app/login_email';
  static const String signup = '/app/signup';
  static const String forgetPassword = '/app/forget_password';

  static List<GetPage> routers() {
    return [
      GetPage(
        name: loginInformation,
        page: () => const InformationPage(),
      ),
      GetPage(
        name: loginCountry,
        transition: Transition.rightToLeft,
        page: () => const CountryPage(),
      ),
      GetPage(
        name: loginLanguage,
        transition: Transition.rightToLeft,
        page: () => const LanguagePage(),
      ),
      GetPage(
        name: loginSocial,
        page: () => const LoginPage(),
      ),
      GetPage(
        name: loginEmail,
        page: () => const LoginEmailPage(),
      ),
      GetPage(
        name: signup,
        page: () =>  SignUpOrForgetPage(signType: SignType.signup),
      ),
      GetPage(
        name: forgetPassword,
        page: () =>  SignUpOrForgetPage(signType: SignType.forget),
      ),
    ];
  }
}