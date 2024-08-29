import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:live_chat/app/utils/text_styles.dart';
import 'package:live_chat/base/config/normal_colors.dart';

import '../../generated/assets.dart';
import '../theme/theme_enum.dart';

AssetImage themeBgImage({required bool isDark, double? width, double? height, BoxFit? fit}) {
      return isDark
          ? const AssetImage(Assets.bgBgDarkDefault)
          : const AssetImage(Assets.bgBgLightDefault);
}

Text themeText({required bool isDark, required String text,int? size}) {
  return isDark
      ? Text(
    text,
    style: boldTextStyle(color: colffffff,size: size),
  )
      :  Text(
    text,
    style: boldTextStyle(color: col000000,size: size),
  );
}
