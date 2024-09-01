import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/widget/app_button.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/view/common_base_view.dart';
import '../../../generated/assets.dart';
import '../../local/local_key.dart';
import '../../service/auth/auth_index.dart';
import '../../../base/utils/decorations.dart';
import '../../../base/utils/text_styles.dart';
import '../../widget/theme_widget_util.dart';
import '../../widget/widget_util.dart';
import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends CommonBaseView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginState get state => controller.state;

  @override
  String controllerTag() {
    return 'LoginPage';
  }

  @override
  Widget createChildBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Column(children: [
      80.verticalSpaceFromWidth,
      assetImage(
          url: Assets.loginLoginIcons, height: 222.w, fit: BoxFit.fitWidth),
      assetImage(url: Assets.loginAppIcon, width: 100.w, height: 100.w),
      24.verticalSpaceFromWidth,
      themeText(
          isDark: state.themeValue.value,
          text: LanguageKey.loginTitle.tr,
          size: 26),
      18.verticalSpaceFromWidth,
      themeText(
          isDark: state.themeValue.value,
          text: LanguageKey.loginSubTitle.tr,
          size: 16),
      50.verticalSpaceFromWidth,
    ]);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: themeBgImage(isDark: state.themeValue.value),
                    fit: BoxFit.cover)),
            child: body),
        Positioned(
            bottom: 40.w,
            child: loginButton())
      ],
    );
  }

  Widget loginButton(){

   return Column(
     mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
      // AppButton(
      //   elevation: 10.0,
      //   shadowColor: Colors.black,
      //   space: 20.w,
      //   iconColor: colffffff,
      //   appButtonEnum: AppButtonEnum.leftIcon,
      //   text: LanguageKey.loginButtonApple.tr,
      //   iconUrl: Assets.svgAppleLogo,
      //   buttonSize: Size(354.w, 44.w),
      //   color: col0ED221,
      //   disabledColor: Colors.black,
      //   shapeBorder: RoundedRectangleBorder(
      //     borderRadius: radius(10),
      //   ),
      //   iconSize: Size(22.w, 22.w),
      //   textStyle: boldTextStyle(color: colffffff),
      // ),
      10.verticalSpaceFromWidth,
      AppButton(
        onTap: (){controller.login(LoginProvider.google);},
        shapeBorder: RoundedRectangleBorder(
          borderRadius: radius(10),
        ),
        elevation: 8.0,
        shadowColor: Colors.black.withOpacity(0.5),
        buttonSize: Size(354.w, 44.w),
        space: 20.w,
        appButtonEnum: AppButtonEnum.leftIcon,
        text: LanguageKey.loginButtonGoogle.tr,
        iconUrl: Assets.svgGoogleLogo,
        color: colffffff,
        disabledColor: colffffff,
        iconSize: Size(22.w, 22.w),
        textStyle: boldTextStyle(color: col000000.withAlpha(54)),
      ),
      10.verticalSpaceFromWidth,
      // AppButton(
      //   shapeBorder: RoundedRectangleBorder(
      //     borderRadius: radius(10),
      //   ),
      //   color: col1877F2,
      //   disabledColor: col1877F2,
      //   space: 20.w,
      //   buttonSize: Size(354.w, 44.w),
      //   appButtonEnum: AppButtonEnum.leftIcon,
      //   text: LanguageKey.loginButtonFb.tr,
      //   iconUrl: Assets.svgFbLogo,
      //   iconSize: Size(22.w, 22.w),
      //   textStyle: boldTextStyle(color: colffffff),
      // )
    ],);



  }

  @override
  LoginController createController() {
    return LoginController();
  }
}
