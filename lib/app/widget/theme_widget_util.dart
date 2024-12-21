import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_chat/base/utils/text_styles.dart';
import 'package:live_chat/base/config/normal_colors.dart';

import '../../base/utils/decorations.dart';
import '../../base/utils/getx_util_tool.dart';
import '../../generated/assets.dart';
import 'app_button.dart';


AssetImage themeBgImage(
    {double? width, double? height, BoxFit? fit}) {
  var controller = obtainThemeController();

  return (controller.isDarkMode.value)
      ? const AssetImage(Assets.bgBgDarkDefault)
      : const AssetImage(Assets.bgBgLightDefault);
}

Text themeText({required bool isDark, required String text, int? size}) {
  return isDark
      ? Text(
          text,
          style: boldTextStyle(color: colffffff, size: size),
        )
      : Text(
          text,
          style: boldTextStyle(color: col000000, size: size),
        );
}

Widget backWidget({Size? buttonSize}){
  return AppButton(
    onTap: () {
      currentGoBack();
    },
    shapeBorder: RoundedRectangleBorder(
      borderRadius: radius(12.r),
    ),
    elevation: 8.0,
    shadowColor: Colors.black.withOpacity(0.5),
    buttonSize: buttonSize??Size(40.w, 40.w),
    appButtonEnum: AppButtonEnum.onlyIcon,
    iconUrl: Assets.svgAppBack,
    color: colffffff,
    disabledColor: colffffff,
    iconSize: Size(17.w, 22.w),
  );
}
