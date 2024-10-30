import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/state/page_state.dart';

import '../../../../generated/assets.dart';
import '../../../model/language_model.dart';
import 'language_page_state.dart';

class LanguageController extends CommonController<LanguageState> {

  @override
  LanguageState createState() {
    return LanguageState();
  }

  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  void fetchData() {


  }


  ///load assets
  Future<LanguageModel> loadLanguages() async {
    final String response = await rootBundle.loadString(Assets.jsonLanguage);
    final data = json.decode(response);
    return LanguageModel.fromJson(data);
  }
}
