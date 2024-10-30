import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_chat/app/local/local_key.dart';
import 'package:live_chat/app/model/az_list_model.dart';
import 'package:live_chat/app/model/country_entity.dart';
import 'package:live_chat/app/widget/azlist_index_bar.dart';
import 'package:live_chat/app/widget/country_item_view.dart';
import 'package:live_chat/base/utils/extensions/list_extensions.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../../../../base/utils/getx_util_tool.dart';
import '../../../../../base/view/common_base_view.dart';
import 'country_page_controller.dart';
import 'country_page_state.dart';

class CountryPage extends CommonBaseView<CountryPageController> {
  const CountryPage({super.key});

  @override
  CountryPageState get state => controller.state;

  @override
  CountryPageController createController() {
    return Get.put(CountryPageController(), tag: controllerTag());
  }

  @override
  createAppBarTitleStr() {
    return LanguageKey.countryChoose.tr;
  }

  @override
  String controllerTag() {
    return 'CountryPage';
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
                    slivers: c.state.countries.mapIndexed<Widget>((i, e) {
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
          return GestureDetector(
              onTap: (){
                Map<String,Countries> info = {'countries':names[itemIndex]};
                currentGoBack(info: info);
              },
              child:CountryItemView(countries: names[itemIndex]).marginOnly(bottom: 15.h));
        },
        childCount: names.length,
      ),
    );

    return resultWidget;
  }

  Widget _buildIndexBar(CountryPageController c) {
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
