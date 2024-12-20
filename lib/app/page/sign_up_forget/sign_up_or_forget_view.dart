import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import 'sign_up_or_forget_logic.dart';
import 'sign_up_or_forget_state.dart';

class SignUpOrForgetPage extends CommonBaseView<SignUpOrForgetController> {
  const SignUpOrForgetPage({Key? key}) : super(key: key);

  @override
  SignUpOrForgetState get state => controller.state;

  @override
  String controllerTag() {
    return 'SignUpOrForgetPage${state.type}';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
      return GetBuilder(builder: (controller){
        return Column(children: [

        ]);


      });
  }

  @override
  SignUpOrForgetController createController() {
    return Get.put(SignUpOrForgetController(), tag: controllerTag());
  }
}
