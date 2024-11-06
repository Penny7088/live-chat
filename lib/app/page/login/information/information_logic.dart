import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/model/interests_model.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/extensions/date_time_extensions.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../../../generated/assets.dart';
import '../../../local/local_key.dart';
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
  configWidgetRenderingCompleted() {
  }

  void onPageChanged(int value) {
    state.stepIndex = value;
    if(value == state.stepLength - 1){
      fetchInterestsData();
    }
    update(['bt', 'step', 'back']);
  }

  clickStep() {
    if (state.stepIndex == 0) {
      if (!judgeFirstPageField()) {
        return;
      }
    }

    if(state.stepIndex == 1){
      if (!judgeSecondPageField()) {
        return;
      }
    }

    if(state.stepIndex == state.stepLength - 1){
      ///todo 进入主页钱需要去更新用户信息
      logD('进入主页。。。');
    }else{
      state.pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }

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

  bool judgeSecondPageField() {
    if (state.country == null) {
      logD('country is null...');
      return false;
    }
    if (state.nativeLan == null) {
      logD('nativeLan is null...');
      return false;
    }

    if (state.learnLan == null) {
      logD('learnLan is null...');
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

  void jumpToLanguagePage() {
    currentToPage(
        name: LoginRouter.LOGIN_LANGUAGE,
        arguments: state.learnLan,
        parameters: {'title': LanguageKey.languageChoose.tr})?.then((onValue) {
      if (onValue != null) {
        state.learnLan = onValue['language'];
        update(['languagePage']);
      }
    });
  }

  void jumpToNativeLanguagePage() {
    currentToPage(
        name: LoginRouter.LOGIN_LANGUAGE,
        arguments: state.nativeLan,
        parameters: {'title': LanguageKey.nativeLan.tr,'isNative':'1'})?.then((onValue) {
      if (onValue != null) {
        state.nativeLan = onValue['language'];
        update(['languagePage']);
      }
    });
  }

  Future<InterestsModel> loadInterests() async {
    final String response = await rootBundle.loadString(Assets.jsonInterests);
    final data = json.decode(response);
    return InterestsModel.fromJson(data);
  }

  Future<void> fetchInterestsData() async {
    var interestsModel = await loadInterests();
    if(interestsModel.interestss != null){
      state.interests.addAll(interestsModel.interestss!);
    }
    update(['interests']);
  }

  void chooseInterestsTag(Interestss item, bool isSelected) {
    item.isChoose = isSelected;
    update(['interests']);
  }

}


