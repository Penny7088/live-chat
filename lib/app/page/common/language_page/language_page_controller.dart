import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../../../generated/assets.dart';
import '../../../model/az_list_model.dart';
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

  void fetchData() async {

    ///todo 先请求接口/失败才加载本地资源
    LanguageModel rsp =  await loadLanguages();
    state.isShowLoadWidget.value = false;
    if (rsp.languagess?.isNotEmpty == true) {
      state.languages.addAll(filterLanguageList(rsp.languagess!));
      state.pageState.value = PageState.dataFetchState;
    }

    update();

  }

  List<AzListModel<Languages>> filterLanguageList(List<Languages> languages) {
    List<AzListModel<Languages>> list =[];
    Map<String, List<Languages>> groupedLanguage = {};
    for (var language in languages) {
      if (state.language != null && state.language!.name == language.name) {
        language.learnLevel = state.language?.learnLevel;
      }
      String section = language.name![0].toUpperCase();
      if (!groupedLanguage.containsKey(section)) {
        groupedLanguage[section] = [];
      }
      groupedLanguage[section]!.add(language);
    }
    for (var section in groupedLanguage.keys.toList()..sort()) {
      list.add(AzListModel(
        section: section,
        names: groupedLanguage[section]!,
      ));
    }
    return list;
  }


  ///load assets
  Future<LanguageModel> loadLanguages() async {
    final String response = await rootBundle.loadString(Assets.jsonLanguage);
    final data = json.decode(response);
    return LanguageModel.fromJson(data);
  }

  void callbackResult(Languages languages) {
    logD('callbackResult : ${languages.toString()}');
    Map<String,dynamic> info = {'language':languages};
    currentGoBack(info: info);
  }
}
