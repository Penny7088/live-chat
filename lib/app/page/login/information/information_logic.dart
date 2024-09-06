import 'package:flutter/material.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/extensions/date_time_extensions.dart';
import 'package:live_chat/base/utils/log_util.dart';

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
    update(['bt', 'step','back']);
  }

  clickStep() {

    if (state.stepIndex == state.stepLength - 1) {
      logD('跳转到主页');
      return;
    }

    if(state.stepIndex == 0){
      if(!judgeFirstPageField()){
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

  bool judgeFirstPageField(){
    if(state.nickName?.isEmpty == true){
      logD('nick name is null...');
      return false;
    }

    if(state.birthday?.isEmpty == true){
      logD('birthday is null...');
      return false;
    }

    return true;
  }
}
