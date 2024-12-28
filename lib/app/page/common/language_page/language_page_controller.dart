import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:live_chat/app/const/storage_key.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';
import 'package:live_chat/base/utils/light_model.dart';
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
    List<Languages>? rsp =  await loadLanguages();
    state.isShowLoadWidget.value = false;
    if (rsp?.isNotEmpty == true) {
      state.languages.addAll(filterLanguageList(rsp!));
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
  Future<List<Languages>?> loadLanguages() async {
    var loadModels = await storageKV.loadModels(StorageKey.languagesList);
    if(loadModels.isEmpty){
      final String response = await rootBundle.loadString(Assets.jsonCountry);
      final data = json.decode(response);
      var lan = LanguageModel.fromJson(data);
      return lan.languagess;
    }
    return loadModels.where((language) => language != null).cast<Languages>().toList();
  }

  void callbackResult(Languages languages) {
    logD('callbackResult : ${languages.toString()}');
    Map<String,dynamic> info = {'language':languages};
    currentGoBack(info: info);
  }
}
