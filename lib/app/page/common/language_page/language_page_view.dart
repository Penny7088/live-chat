import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/model/language_model.dart';
import 'package:live_chat/app/widget/language_item_view.dart';
import 'package:live_chat/base/utils/extensions/list_extensions.dart';
import 'package:live_chat/base/view/common_base_view.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../../model/az_list_model.dart';
import '../../../widget/azlist_index_bar.dart';
import 'language_page_controller.dart';
import 'language_page_state.dart';

class LanguagePage extends CommonBaseView<LanguageController> {

  const LanguagePage({super.key});

  @override
  LanguageState get state => controller.state;

  @override
  String controllerTag() {
    return 'LanguageController';
  }

@override
  String? createAppBarTitleStr() {
    return state.title;
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return GetBuilder(
        init: controller,
        builder: (c) {
          return Stack(
            children: [
              SliverViewObserver(
                controller: c.state.observerController,
                sliverContexts: () {
                  return c.state.sliverContextMap.values.toList();
                },
                child: CustomScrollView(
                    controller: c.state.scrollController,
                    slivers: c.state.languages.mapIndexed<Widget>((i, e) {
                      return _buildSliver(index: i, model: e);
                    })),
              ).paddingSymmetric(vertical: 20.h),
              Positioned(
                top: 0,
                bottom: 0,
                right: 10.w,
                child: _buildIndexBar(c),
              ),
            ],
          );
        });
  }

  @override
  LanguageController createController() {
    return Get.put(LanguageController(), tag: controllerTag());
  }


  Widget _buildSliver({
    required int index,
    required AzListModel model,
  }) {
    final names = model.names;
    if (names.isEmpty == true) return const SliverToBoxAdapter();
    Widget resultWidget = SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, itemIndex) {
          if (state.sliverContextMap[index] == null) {
            state.sliverContextMap[index] = context;
          }
          return LanguageItemView(
                languages: names[itemIndex],
                isNative: state.isNative,
                callback: (Languages languages) {
                  controller.callbackResult(languages);
                },
              );
        },
        childCount: names.length,
      ),
    );

    return resultWidget;
  }


  Widget _buildIndexBar(LanguageController c) {
    return Container(
      key: state.indexBarContainerKey,
      width: 20.w,
      alignment: Alignment.center,
      child: AzListIndexBar(
        parentKey: c.state.indexBarContainerKey,
        symbols: c.state.symbols,
        onSelectionUpdate: (index, cursorOffset) {
          state.cursorInfo.value = AzListCursorInfoModel(
            title: state.symbols[index],
            offset: cursorOffset,
          );
          final sliverContext = c.state.sliverContextMap[index];
          if (sliverContext == null) return;
          state.observerController.jumpTo(
            index: 0,
            sliverContext: sliverContext,
          );
        },
        onSelectionEnd: () {
          state.cursorInfo.value = null;
        },
      ),
    );
  }

}
