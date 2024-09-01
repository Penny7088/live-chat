import 'package:get/get.dart';
import 'package:live_chat/app/theme/theme_service.dart';
import 'package:live_chat/base/state/page_state.dart';

class LoginState extends BaseState{

  var themeValue = false.obs;



  @override
  void init() {
    themeValue = ThemeService.obtain().isDarkMode;
  }

  @override
  void onReady() {
  }

  @override
  void onClose() {

  }


}
