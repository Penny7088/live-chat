import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/light_model.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../local/env/EnvConfig.dart';
import '../../net/ws/websocket.dart';
import '../../tool/device_utils.dart';
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

  @override
  void onReady() {
    super.onReady();
    testWs();
  }

  void tapBottomTab(int index) {
    state.curPageIndex = index;
    state.pageController.animateToPage(index, duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
    update(['bottomBar','pageView']);
  }

  Future<void> testWs() async {
    var token = await DeviceUtils.getToken();
    String wsUrl = await EnvConfig().obtainWSBaseUrl();
    if(token?.isEmpty == true || wsUrl == ''){
      return;
    }
    var obtainUser = await storageKV.obtainUser();
    if(obtainUser != null){
      var webSocket = WebSocket(token: token!, baseUrl: wsUrl,logger: detachedLogger(),queryParameters: {'uid':obtainUser.id});
      webSocket.connect();
    }

  }
}
