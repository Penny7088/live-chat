import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:live_chat/base/config/normal_colors.dart';

import '../../generated/assets.dart';
import '../theme/theme_enum.dart';

AssetImage themeBgImage({required ThemeEnum themeMode, double? width, double? height, BoxFit? fit}) {
  switch (themeMode) {
    case ThemeEnum.lightThemeE:
      return const AssetImage(Assets.bgBgLightDefault);
    case ThemeEnum.dartThemeE:
      return const AssetImage(Assets.bgBgDarkDefault);
    default:
      return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
          ? const AssetImage(Assets.bgBgDarkDefault)
          : const AssetImage(Assets.bgBgLightDefault);
  }
}

Text themeText({required ThemeEnum themeMode, required String text,TextStyle? style}) {
  switch (themeMode) {
    case ThemeEnum.lightThemeE:
      return Text(
        text,
        style: const TextStyle(color: NormalColorS.col000000),
      );
    case ThemeEnum.dartThemeE:
      return Text(
        text,
        style: const TextStyle(color: NormalColorS.colffffff),
      );
    default:
      return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
          ? Text(
              text,
              style: const TextStyle(color: NormalColorS.col000000),
            )
          : Text(
              text,
              style: const TextStyle(color: NormalColorS.col000000),
            );
  }
}
