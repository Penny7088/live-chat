import 'package:flutter/material.dart';
import 'package:live_chat/base/utils/text_styles.dart';
import 'package:live_chat/base/config/normal_colors.dart';

import '../../base/utils/getx_util_tool.dart';
import '../../generated/assets.dart';


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
