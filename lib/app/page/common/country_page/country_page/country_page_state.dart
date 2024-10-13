import 'package:live_chat/base/state/page_state.dart';

class CountryPageState extends BaseState{
  CountryPageState() {
    ///Initialize variables
  }

  @override
  void init() {
    isShowLoadWidget.value = true;
    isShowAppBar = true;
    isNeedScaffold = true;
  }

  @override
  void onClose() {
  }

  @override
  void onReady() {
  }
}
