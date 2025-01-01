import 'package:flutter/material.dart';
import 'package:live_chat/base/state/page_state.dart';

class MainContainerState extends BaseState{


  int curPageIndex = 0;

  late PageController pageController;

  @override
  void init() {
    isShowBottomBar = true;
    isShowAppBar = false;
    pageController = PageController(initialPage: curPageIndex);

  }

  @override
  void onClose() {
  }

  @override
  void onReady() {
  }
}
