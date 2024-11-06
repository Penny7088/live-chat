import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../../model/country_entity.dart';
import '../../../model/interests_model.dart';
import '../../../model/language_model.dart';

class InformationState extends BaseState{

  var themeValue = false.obs;

  int stepIndex = 0;
  //长度
  int stepLength = 3;

  String? birthday;
  String? nickName;
  bool? ifFemale;
  bool? ifMale;
  Countries? country;
  Languages? nativeLan;
  Languages? learnLan;

  late TextEditingController textEditingController  = TextEditingController();

  late PageController pageController;

  List<Interestss> interests = [];


  @override
  void init() {
    logD(Get.arguments?.toString()??'');
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
