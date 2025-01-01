import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/view/common_base_view.dart';

import 'chat_main_logic.dart';

class ChatMainPage extends CommonBaseView<ChatMainController> {
  const ChatMainPage({Key? key}) : super(key: key);

  @override
  String controllerTag() {
    return 'ChatMainController';
  }

  @override
  Widget createChildBody({required BuildContext context, BoxConstraints? constraints}) {
    return Container(
        color: Colors.grey,
        child: Text('chat'));
  }

  @override
  ChatMainController createController() {
    return ChatMainController();
  }

  @override
  bool isPermanent() {
    return true;
  }

}
