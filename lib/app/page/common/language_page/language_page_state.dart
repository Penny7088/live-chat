import 'package:flutter/cupertino.dart';
import 'package:live_chat/app/model/az_list_model.dart';
import 'package:live_chat/app/model/language_model.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../../../base/config/normal_colors.dart';

class LanguageState extends BaseState{

  List<AzListModel<Languages>> languages = [];

  List<String> symbols = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  final indexBarContainerKey = GlobalKey();
  ValueNotifier<AzListCursorInfoModel?> cursorInfo = ValueNotifier(null);

  late SliverObserverController observerController;

  ScrollController scrollController = ScrollController();

  Map<int, BuildContext> sliverContextMap = {};

  LanguageState() {
    ///Initialize variables
  }

  @override
  void init() {
    isShowLoadWidget.value = true;
    isShowAppBar = true;
    isNeedScaffold = true;
    scaffoldBackGroundColor = colf8f8f8;
    navBackgroundColor = colffffff;
    observerController = SliverObserverController(controller: scrollController);
  }

  @override
  void onClose() {
  }

  @override
  void onReady() {
  }
}
