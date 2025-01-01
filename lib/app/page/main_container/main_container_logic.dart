import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/controller/common_controller.dart';

import 'main_container_state.dart';

class MainContainerControl extends CommonController<MainContainerState> {
  @override
  MainContainerState createState() {
    return MainContainerState();
  }

  @override
  void onInit() {
    super.onInit();
    state.pageController.addListener(() {
      state.curPageIndex = (state.pageController.page?.round() ?? 0);
      update(['bottomBar']);
    });
  }

  void tapBottomTab(int index) {
    state.curPageIndex = index;
    state.pageController.animateToPage(index, duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
    update(['bottomBar','pageView']);
  }
}
