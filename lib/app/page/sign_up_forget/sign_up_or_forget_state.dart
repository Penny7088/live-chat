import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/state/page_state.dart';

class SignUpOrForgetState extends BaseState{

  SignType? type;

  TextEditingController emailController =  TextEditingController();

  TextEditingController passwordController =  TextEditingController();
  /// 确认
  TextEditingController confirmPasswordController =  TextEditingController();

  TextEditingController codeController =  TextEditingController();

  @override
  void init() {
    type = Get.arguments;
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


enum SignType{
  forget,
  signup
}