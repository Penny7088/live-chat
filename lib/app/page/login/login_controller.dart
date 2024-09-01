import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../service/auth/auth_index.dart';
import 'login_state.dart';

class LoginController extends CommonController<LoginState> {

  final AuthService _authService = AuthService();

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

  login(LoginProvider provider) async {
    /// 需要购买域名
    // await _authService.login(provider, (onUserData){
    //   /// todo send to data server
    //   logD(onUserData.toString());
    // });


  }



}
