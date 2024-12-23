import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/state/page_state.dart';

import '../../api/login_fetch.dart';

class SignUpOrForgetState extends BaseState{

  SignType? type;

  TextEditingController emailController =  TextEditingController();

  TextEditingController passwordController =  TextEditingController();
  /// 确认
  TextEditingController confirmPasswordController =  TextEditingController();

  TextEditingController codeController =  TextEditingController();

  late LoginFetch fetch ;

  @override
  void init() {
    type = Get.arguments;
    isShowAppBar = false;
    safeAreaTop = false;
    fetch = LoginFetch();
  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}


enum SignType{
  forget,
  signup
}