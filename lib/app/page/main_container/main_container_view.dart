import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/page/common/country_page/country_page/country_page_view.dart';
import 'package:live_chat/app/widget/widget_util.dart';
import 'package:live_chat/base/config/normal_colors.dart';
import 'package:live_chat/base/utils/decorations.dart';
import 'package:live_chat/base/view/common_base_view.dart';
import 'package:live_chat/base/view/keep_alive_widget.dart';
import 'package:live_chat/generated/assets.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../chat_main/chat_main_view.dart';
import '../live_main/live_main_view.dart';
import '../mine_main/mine_main_view.dart';
import 'main_container_logic.dart';
import 'main_container_state.dart';

class MainContainerPage extends CommonBaseView<MainContainerControl> {
  @override
  MainContainerState get state => controller.state;

  @override
  String controllerTag() {
    return 'MainContainerControl';
  }

  @override
  bool isPermanent() {
    return true;
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return GetBuilder(
        init: controller,
        id: 'pageView',
        builder: (controller) {
          return PageView(
              controller: state.pageController,
              children: [ChatMainPage().keepAlive, LiveMainPage().keepAlive, MineMainPage().keepAlive]);
        });
  }

  @override
  MainContainerControl createController() {
    return MainContainerControl();
  }

  @override
  Widget? createScaffoldBottomNavigationBar({required BuildContext context, BoxConstraints? constraints}) {
    return GetBuilder(
        id: 'bottomBar',
        init: controller,
        builder: (controller) {
          return StylishBottomBar(
            onTap: (index) {
              controller.tapBottomTab(index);
            },
            currentIndex: state.curPageIndex,
            borderRadius: radiusOnly(topLeft: 15.r, topRight: 15.r),
            gradient: const LinearGradient(
              begin: Alignment(1.00, -0.04),
              end: Alignment(-1, 0.04),
              colors: [Color(0xFFBDCFF7), Color(0xFFD5BCF3)],
            ),
            items: [
              BottomBarItem(
                icon: svgImage(url: Assets.bottomBottomUnselectMsg),
                title: const Text('message'),
                selectedIcon: Container(
                    width: 30.w,
                    height: 30.w,
                    decoration:  boxDecorationDefault(
          shape: BoxShape.circle,
          boxShadow: defaultBoxShadow(shadowColor: col8E999A, offset: const Offset(0, 3))),
                    child: svgImage(url: Assets.bottomBottomSelectMsg)),
                // backgroundColor: Colors.red,
              ),
              BottomBarItem(
                  icon: svgImage(url: Assets.bottomLiveUnselect),
                  title: const Text('live'),
                  selectedIcon: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: boxDecorationDefault(
                          shape: BoxShape.circle,
                          boxShadow: defaultBoxShadow(shadowColor: col8E999A, offset: const Offset(0, 3))),
                      child: svgImage(url: Assets.bottomBottomLiveSelect))),
              BottomBarItem(
                  icon: svgImage(url: Assets.bottomBottomMineUnselect),
                  title: const Text('mine'),
                  selectedIcon: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: boxDecorationDefault(
                          shape: BoxShape.circle,
                          boxShadow: defaultBoxShadow(shadowColor: col8E999A, offset: const Offset(0, 3))),
                      child: svgImage(url: Assets.bottomBottomMineSelect))),
            ],
            option: AnimatedBarOptions(
              iconStyle: IconStyle.simple,
              opacity: 0.3,
            ),
          );
        });
  }
}
