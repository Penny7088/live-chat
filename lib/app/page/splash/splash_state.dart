import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:live_chat/base/state/page_state.dart';

import '../../theme/theme_service.dart';

class SplashState extends BaseState {
  SplashState();

  var themeValue = false.obs;

  String? loginMethod;

  @override
  void init() {
    isShowAppBar = false;
    themeValue = ThemeService.obtain().isDarkMode;
  }

  @override
  void onClose() {}

  @override
  void onReady() {}
}
