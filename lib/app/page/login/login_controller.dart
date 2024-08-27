import 'package:live_chat/base/controller/common_controller.dart';

import 'login_state.dart';

class LoginController extends CommonController<LoginState> {
  @override
  LoginState createState() {
    return LoginState();
  }

  @override
  configUI() {
    safeAreaTop = false;
    isNeedScaffold = true;
    isShowLoadWidget.value = false;
    isShowAppBar = false;
  }
}
