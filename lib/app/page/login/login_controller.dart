import 'package:live_chat/base/controller/common_controller.dart';

import 'login_state.dart';

class LoginController extends CommonController<LoginState> {
  @override
  LoginState createState() {
    return LoginState();
  }

  @override
  configUI() {
    state.safeAreaTop = false;
    state.isNeedScaffold = true;
    state.isShowLoadWidget.value = false;
    state.isShowAppBar = false;
  }
}
