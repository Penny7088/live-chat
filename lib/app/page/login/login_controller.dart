import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_chat/app/page/login/login_router.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';
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

  Future<bool> login(LoginProvider provider) async {
    loadingBtStatus(true);
    /// 需要购买域名
    try {
      // await _authService.login(provider, (onUserData) {
      //   logD(onUserData.toString());
      //   if(onUserData.isNotEmpty){
      //     /// todo 请求服务端接口
      //     currentToPage(name: LoginRouter.LOGIN_INFORMATION,arguments: {'user':onUserData});
      //   }
      // });
      await Future.delayed(Duration(seconds: 2));
      loadingBtStatus(false);
      return true;
    } on FirebaseAuthException catch(e) {
      if(e.code == 'INVALID_LOGIN_CREDENTIALS'){
        logD('INVALID_LOGIN_CREDENTIALS');
      }else{
        logD(e.code);
      }
      state.googleButtonLoading = false;
      loadingBtStatus(false);
      return false;
    }

    // currentToPage(name: LoginRouter.LOGIN_INFORMATION,arguments: {'user':'information'});

  }

  void loadingBtStatus(bool status) {
     state.googleButtonLoading = status;
    update(['login_google']);
  }

  void jumpToDiffPage() {
    currentToPage(name: LoginRouter.LOGIN_INFORMATION);
  }



}
