import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import '../../../generated/assets.dart';
import '../../local/local_key.dart';
import '../../widget/theme_widget_util.dart';
import '../../widget/widget_util.dart';
import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends CommonBaseView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  LoginState get state  => controller.state;

  @override
  String controllerTag() {
    return 'LoginPage';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints?constraints}) {
    Widget body =  Column(children: [
      80.verticalSpaceFromWidth,
      Container(margin:EdgeInsets.symmetric(horizontal: 16.w),child:assetImage(url: Assets.loginLoginIcons,height: 222.w,fit: BoxFit.fitWidth)),
      assetImage(url: Assets.loginAppIcon,width: 100.w,height: 100.w),
      themeText(themeMode: state.themeValue.value,text: LanguageKey.loginTitle.tr)
    ]);


    return Container(decoration: BoxDecoration(
        image: DecorationImage(image:themeBgImage(themeMode: state.themeValue.value), fit: BoxFit.cover)),child: body);
  }

  @override
  LoginController createController() {
   return LoginController();
  }
}
