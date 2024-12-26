import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_container_logic.dart';

class MainContainerPage extends StatelessWidget {
  const MainContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MainContainerLogic());
    final state = Get.find<MainContainerLogic>().state;

    return Container(child: Text('主页'));
  }
}
