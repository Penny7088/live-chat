import 'package:flutter/material.dart';
import 'package:live_chat/app/api/login_fetch.dart';
import 'package:live_chat/base/state/page_state.dart';

class LoginEmailState extends BaseState{

  TextEditingController emailController =  TextEditingController();

  TextEditingController passwordController =  TextEditingController();

  var loginFetch = LoginFetch();

  @override
  void init() {
    isShowAppBar = false;
    safeAreaTop = false;
  }

  @override
  void onClose() {
  }

  @override
  void onReady() {
  }
}
