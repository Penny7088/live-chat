import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:live_chat/base/utils/log_util.dart';

class InformationState extends BaseState{

  var themeValue = false.obs;

  int stepIndex = 0;
  //长度
  int stepLength = 3;

  late PageController pageController;

  @override
  void init() {
    logD(Get.arguments['user']);
    pageController = PageController();
  }

  @override
  void onClose() {
  }

  @override
  void onReady() {
  }
}
