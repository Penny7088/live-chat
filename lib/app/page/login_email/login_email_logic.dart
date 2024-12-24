import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/local/local_key.dart';
import 'package:live_chat/app/widget/widget_util.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/log_util.dart';
import 'package:live_chat/base/utils/pattern.dart';
import 'package:live_chat/base/utils/util.dart';

import 'login_email_state.dart';

class LoginEmailController extends CommonController<LoginEmailState> {

  @override
  LoginEmailState createState() {
    return LoginEmailState();
  }

  void loginFromEmail() {
    var email = state.emailController.text;
    if (email.isEmpty) {
      logD('输入邮箱..');
      showToast(LanguageKey.pleaseEnterYourEmail.tr);
      return;
    }

    var hasMatched = hasMatch(email, Patterns.emailEnhanced);
    if (!hasMatched) {
      logD('邮箱格式不正确..');
      showToast(LanguageKey.emailFormatIsIncorrect.tr);
      return;
    }

    var pwd = state.passwordController.text;
    if(pwd.isEmpty){

    }

    fetchLogin(email,pwd);

  }

  Future<void> fetchLogin(String email,String pwd) async {
    var user = await state.loginFetch.loginForEmail(email: email,password: pwd);
    if (user != null) {
      //todo 存储数据

    }
  }

}
