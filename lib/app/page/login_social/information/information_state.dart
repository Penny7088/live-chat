import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/api/login_fetch.dart';
import 'package:live_chat/app/api/model/user_model.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../../model/country_entity.dart';
import '../../../model/interests_model.dart';
import '../../../model/language_model.dart';

class InformationState extends BaseState {
  var themeValue = false.obs;

  int stepIndex = 0;

  //长度
  int stepLength = 3;

  String? birthday;
  String? avatar;
  String? nickName;
  bool? ifFemale;
  bool? ifMale;
  Countries? country;
  Languages? nativeLan;
  Languages? learnLan;
  UserModel? user;
  bool? btLoading;

  late TextEditingController textEditingController = TextEditingController();

  late PageController pageController;

  List<Interestss> interests = [];

  LoginFetch loginFetch = LoginFetch();

  @override
  void init() {
    var arguments = Get.arguments;
    if (arguments != null) {
      user = arguments['user'];
      logD(user.toString() ?? '');
      avatar = user?.profilePicture;
    }

    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    textEditingController.dispose();
  }

  @override
  void onReady() {}
}
