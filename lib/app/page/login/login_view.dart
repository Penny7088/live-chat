import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/widget/app_button.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import '../../../generated/assets.dart';
import '../../local/local_key.dart';
import '../../utils/decorations.dart';
import '../../utils/text_styles.dart';
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
          size: 22),
      18.verticalSpaceFromWidth,
      themeText(
          isDark: state.themeValue.value,
          text: LanguageKey.loginSubTitle.tr,
          size: 14),
      50.verticalSpaceFromWidth,
      AppButton(
        appButtonEnum: AppButtonEnum.leftIcon,
        text: LanguageKey.loginButtonApple.tr,
        iconUrl: Assets.svgAppleLogo,
        width: 354.w,
        color: col0ED221,
        shapeBorder: RoundedRectangleBorder(
          borderRadius: radius(10),
          side: BorderSide(color: colffffff.withOpacity(0.5)),
        ),
        iconSize: Size(22.w, 22.w),
        textStyle: primaryTextStyle(),
      ),
      AppButton(
        width: 354.w,
        appButtonEnum: AppButtonEnum.leftIcon,
        text: LanguageKey.loginButtonApple.tr,
        iconUrl: Assets.svgGoogleLogo,
        color: colffffff,
        splashColor: colffffff,
        iconSize: Size(22.w, 22.w),
        textStyle: primaryTextStyle(),
      ),
      AppButton(
        width: 354.w,//1877F2
        appButtonEnum: AppButtonEnum.leftIcon,
        text: LanguageKey.loginButtonFb.tr,
        iconUrl: Assets.svgFbLogo,
        iconSize: Size(22.w, 22.w),
        textStyle: primaryTextStyle(),
      )
    ]);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: themeBgImage(isDark: state.themeValue.value),
                fit: BoxFit.cover)),
        child: body);
  }

  @override
  LoginController createController() {
    return LoginController();
  }
}
