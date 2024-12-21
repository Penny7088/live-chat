import 'package:get/get.dart';
import 'package:live_chat/base/controller/common_controller.dart';

import 'sign_up_or_forget_state.dart';

class SignUpOrForgetController extends CommonController<SignUpOrForgetState> {

  @override
  SignUpOrForgetState createState() {
    return SignUpOrForgetState();
  }

  void fetchVerificationCode() {
      bool isForget = state.type == SignType.forget;

  }


}
