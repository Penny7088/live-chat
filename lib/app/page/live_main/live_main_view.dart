import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import 'live_main_logic.dart';

class LiveMainPage extends CommonBaseView<LiveMainController> {
  const LiveMainPage({Key? key}) : super(key: key);

  @override
  String controllerTag() {
  return 'LiveMainController';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Container(
        color: Colors.white,
        child: Text('live'));
  }

  @override
  LiveMainController createController() {
 return LiveMainController();
  }

  @override
  bool isPermanent() {
    return true;
  }
}
