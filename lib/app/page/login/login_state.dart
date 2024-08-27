import 'package:get/get.dart';
import 'package:live_chat/app/theme/theme_service.dart';
import 'package:live_chat/base/state/page_state.dart';

import '../../theme/theme_enum.dart';

class LoginState extends BaseState{

  Rx<ThemeEnum> themeValue = Rx(ThemeEnum.defaultThemeE);

  @override
  void init() {
    themeValue.value = ThemeService.obtain().currentThemeEnum;
  }

  @override
  void release() {

  }

}
