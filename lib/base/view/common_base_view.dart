import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/state/page_state.dart';
import '../config/normal_colors.dart';
import '../controller/common_controller.dart';
import 'common_place_holder_widget.dart';
import 'loading_center_widget.dart';
import 'mixin/appbar_mixin.dart';
import 'mixin/view_mixin.dart';

abstract class CommonBaseView<C extends CommonController> extends GetView<C>
    with ViewMixin, AppBarMixin {
  const CommonBaseView({super.key});

  @override
  String? get tag => controllerTag();

  @override
  C get controller => Get.put<C>(createController(), tag: controllerTag(),permanent: isPermanent());

  BaseState get state => controller.state;

  String controllerTag();

  C createController();

  bool isPermanent(){
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => createScaffoldWidget(context: context),
    );
  }

  @override
  Widget? createScaffoldBottomNavigationBar({required BuildContext context, BoxConstraints? constraints}) {
    return Container();
  }

  @override
  Widget? createLoadingWidget() {
    return const LoadingWidget();
  }

  @override
  Widget? createEmptyWidget() {
    return CommonPlaceHoldPage(
      placeHoldType: state.placeHoldType,
      msg: state.placeMsg,
      btnMsg: state.placeBtnMsg,
      ontap: () {
        controller.tapPlaceHoldWidgetMethod(
          placeHoldType: state.placeHoldType,
        );
      },
    );
  }

  /// UI配置项
  /// ---------------- 脚手架配置项 ---------------- ///
  /// 是否使用脚手架
  @override
  bool configIsNeedScaffold() {
    return state.isNeedScaffold;
  }

  ///是否形变
  @override
  bool? configResizeToAvoidBottomInset() {
    return state.resizeToAvoidBottomInset;
  }

  /// 脚手架背景颜色
  @override
  Color? configScaffoldBackgroundColor() {
    return state.scaffoldBackGroundColor ?? transparent;
  }

  @override
  bool configIsNeedBottomNavigation() {
    return state.isShowBottomBar;
  }

  /// ---------------- AppBar配置项 ---------------- ///

  /// 是否需要导航栏
  @override
  bool configIsShowAppBar() {
    return state.isShowAppBar;
  }

  @override
  leadingCallback({BuildContext? context}) {
    controller.tapNormalBack();
  }

  /// 配置导航栏标题
  @override
  String? createAppBarTitleStr() {
    return state.appBarTitle;
  }

  /// 配置导航栏背景颜色
  @override
  Color? createAppBarNavBackColor() {
    return state.navBackgroundColor ?? transparent;
  }

  /// 配置导航栏背景视图
  @override
  Widget? createFlexBleSpace() {
    return null;
  }

  /// ---------------- 安全区域配置项 ---------------- ///
  /// 是否需要 安全区域 控件
  @override
  bool configIsNeedSafeArea() {
    return state.isNeedScaffold;
  }

  /// 是否关闭顶部安全区域
  @override
  bool configSafeAreaTop() {
    return state.safeAreaTop;
  }

  /// 是否关闭底部安全区域
  @override
  bool configSafeAreaBottom() {
    return state.safeAreaBottom;
  }

  /// ---------------- 界面通用配置项 ---------------- ///
  /// 是否显示加载动画
  @override
  bool isShowLoading() {
    return state.isShowLoadWidget.value;
  }

  /// 配置界面状态值
  @override
  configPageState() {
    return state.pageState.value;
  }
}
