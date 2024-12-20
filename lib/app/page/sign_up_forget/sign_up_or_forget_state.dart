import 'package:get/get.dart';
import 'package:live_chat/base/state/page_state.dart';

class SignUpOrForgetState extends BaseState{

  SignType? type;

  @override
  void init() {
    type = Get.arguments;
  }

  @override
  void onClose() {
  }

  @override
  void onReady() {
  }
}


enum SignType{
  forget,
  signup
}