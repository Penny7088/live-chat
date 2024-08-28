
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/common_place_holder_widget.dart';

enum PageState {
  // 初始状态
  initializedState,
  // 错误状态,显示失败界面
  errorState,
  // 错误状态,只弹错误信息
  errorOnlyTotal,
  // 错误状态,显示刷新按钮
  errorShowRefresh,
  // 没有更多数据
  noMoreDataState,
  // 空数据状态
  emptyDataState,
  // 数据获取成功状态
  dataFetchState,
}

abstract class BaseState {
  /// 配置界面状态
  /// PageState.initializedState 初始化中 默认状态
  var pageState = PageState.initializedState.obs;

  CommonPlaceHoldType placeHoldType = CommonPlaceHoldType.nothing;

  /// 缺省页 描述语
  String? placeMsg;

  /// 缺省页 按钮文字
  String? placeBtnMsg;

  // 配置界面是否显示 加载界面
  var isShowLoadWidget = false.obs;



  /// 是否显示导航栏
  var isShowAppBar = true;

  /// 导航栏标题
  var appBarTitle = "";

  /// 导航栏颜色
  Color? navBackgroundColor;

  /// 默认安全区顶部 忽略
  var safeAreaTop = true;

  /// 默认安全区底部 忽略
  var safeAreaBottom = false;

  /// 是否显示底部导航栏
  var isShowBottomBar = false;

  /// 背景颜色
  Color? scaffoldBackGroundColor;

  /// 是否显示Scaffold脚手架
  var isNeedScaffold = true;

  /// 滚动属性
  bool? resizeToAvoidBottomInset;

  BaseState();

  /// 和controller 生命周期绑定
  void init();
  void onReady();
  void onClose();
}
