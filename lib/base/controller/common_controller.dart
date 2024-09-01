import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../state/page_state.dart';
import '../utils/getx_util_tool.dart';
import '../view/common_place_holder_widget.dart';
import '../view/mixin/app_life_cycle_abs.dart';
import '../view/mixin/refresh_mixin.dart';

/// FileName common_controller
///
/// @Author mac
/// @Date 2024/5/28 15:29
///
/// @Description  base controller

abstract class CommonController<S extends BaseState> extends GetxController
    with AbstractNetWork, WidgetsBindingObserver, AppLifeCycleAbs {


  late S state = createState();

  @override
  void onInit() {
    state.init();
    super.onInit();
    configUI();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      configWidgetRenderingCompleted();
    });
  }

  @override
  onReady(){
    state.onReady();
  }

  S  createState();
  /// 配置默认选项
  configUI() {

  }
  /// 界面渲染完成
  configWidgetRenderingCompleted() async {}


  // 点击缺省页触发事件
  tapPlaceHoldWidgetMethod({
    required CommonPlaceHoldType placeHoldType,
  }) {}

  /// 点击返回按钮触发事件
  tapNormalBack() {
    currentGoBack();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      configAppLifeCycleResumed();
    } else if (state == AppLifecycleState.inactive) {
      configAppLifeCycleInactive();
    } else if (state == AppLifecycleState.paused) {
      configAppLifeCyclePaused();
    } else if (state == AppLifecycleState.detached) {
      configAppLifeCycleDetached();
    }
  }

  ///当前系统改主题改变回调
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    configPlatformBrightness();
  }

  /// 当前系统语言发生改变回调
  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    configChangeLocales(locales);
  }

  /// app进入前台
  @override
  configAppLifeCycleResumed() {}

  /// app在前台但不响应事件，比如电话，touch id等"
  @override
  configAppLifeCycleInactive() {}

  /// app进入后台
  @override
  configAppLifeCyclePaused() {}

  /// 没有宿主视图但是flutter引擎仍然有效
  @override
  configAppLifeCycleDetached() {}

  /// 主题变更事件回调
  @override
  configPlatformBrightness() {
  }

  @override
  onClose() {
    WidgetsBinding.instance.removeObserver(this);
    state.onClose();
    super.onClose();
  }
}