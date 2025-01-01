import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import 'mine_main_logic.dart';

class MineMainPage extends CommonBaseView<MineMainController> {
  const MineMainPage({super.key});

  @override
  String controllerTag() {
    return 'MineMainController';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Container(
        color: Colors.amber,child: Text('mine'));
  }

  @override
  MineMainController createController() {
   return MineMainController();
  }

  @override
  bool isPermanent() {
    return true;
  }

}
