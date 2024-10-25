import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../base/view/common_base_list_view.dart';
import 'country_page_controller.dart';

class CountryPage extends CommonBaseListView<CountryPageController> {
  CountryPage({Key? key}) : super(key: key);

  @override
  CountryPageController createController() {
    return Get.put(CountryPageController(), tag: controllerTag());
  }

  @override
  String controllerTag() {
    return 'CountryPagePage';
  }

  @override
  Widget createListView(BuildContext context) {
    return super.createListView(context);
  }
}
