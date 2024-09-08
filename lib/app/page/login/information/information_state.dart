import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:live_chat/base/utils/log_util.dart';

class InformationState extends BaseState{

  var themeValue = false.obs;

  int stepIndex = 0;
  //长度
  int stepLength = 3;

  String? birthday;
  String? nickName;
  bool? ifFemale;
  bool? ifMale;

  late TextEditingController textEditingController  = TextEditingController();

  late PageController pageController;


  @override
  void init() {
    logD(Get.arguments['user']);
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    textEditingController.dispose();
  }

  @override
  void onReady() {
  }
}
