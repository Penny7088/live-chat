import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/widget/theme_widget_util.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import 'splash_controller.dart';
import 'splash_state.dart';

class SplashPage extends CommonBaseView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);


  @override
  SplashState get state => controller.state;

  @override
  String controllerTag() {
    return 'SplashController';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: themeBgImage(isDark: state.themeValue.value),
                fit: BoxFit.cover)),
        );
  }

  @override
  SplashController createController() {
    return Get.put(SplashController(), tag: controllerTag());
  }
}
