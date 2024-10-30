import 'package:flutter/material.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/extensions/date_time_extensions.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../../model/country_entity.dart';
import '../login_router.dart';
import 'information_state.dart';

class InformationController extends CommonController<InformationState> {
  @override
  InformationState createState() {
    return InformationState();
  }

  @override
  configUI() {
    state.isShowAppBar = false;
    state.isNeedScaffold = false;
  }

  @override
  configWidgetRenderingCompleted() {}

  void onPageChanged(int value) {
    state.stepIndex = value;
    update(['bt', 'step', 'back']);
  }

  clickStep() {
    if (state.stepIndex == state.stepLength - 1) {
      logD('跳转到主页');
      return;
    }

    if (state.stepIndex == 0) {
      if (!judgeFirstPageField()) {
        return;
      }
    }

    state.pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void preStep() {
    state.pageController.animateToPage(state.stepIndex - 1,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void onBirthdayCallback(DateTime dateTime, List<int> index) {
    logD('year=${dateTime.year} mouth=${dateTime.month} day=${dateTime.day}');
    logD('$index');
    state.birthday = dateTime.formatYMD;
    update(['birthday']);
  }

  bool judgeFirstPageField() {
    if (state.nickName == null) {
      logD('nick name is null...');
      return false;
    }

    if (state.birthday == null) {
      logD('birthday is null...');
      return false;
    }

    if (state.ifFemale == null || state.ifMale == null) {
      logD('sex is null...');
      return false;
    }
    return true;
  }

  void selectSex(bool value) {
    if (value) {
      state.ifFemale = value;
      state.ifMale = false;
    } else {
      state.ifFemale = false;
      state.ifMale = !value;
    }
    update(['sex']);
  }

  void setNickName(String value) {
    state.nickName = value;
    logD('nick name = $value');
  }

  void jumpToCountryPage() {
    currentToPage(name: LoginRouter.LOGIN_COUNTRY)?.then((value){
      if(value != null){
        state.country = value['countries'];
        update(['languagePage']);
      }
    });
  }
}
