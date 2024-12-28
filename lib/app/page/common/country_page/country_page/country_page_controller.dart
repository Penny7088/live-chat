import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:live_chat/app/const/storage_key.dart';
import 'package:live_chat/app/tool/tool.dart';
import 'package:live_chat/base/state/page_state.dart';
import 'package:live_chat/base/utils/light_model.dart';
import 'package:live_chat/generated/assets.dart';

import '../../../../../base/controller/common_controller.dart';
import '../../../../model/az_list_model.dart';
import '../../../../model/country_entity.dart';
import 'country_page_state.dart';

class CountryPageController extends CommonController<CountryPageState> {

  @override
  CountryPageState createState() {
    return CountryPageState();
  }


  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  fetchData() async {

    List<Countries>? rsp =  await loadCountries();
    state.isShowLoadWidget.value = false;
    if (rsp?.isNotEmpty == true) {
      List<Countries> mapping = mappingCountryFlag(rsp!);
      state.countries.addAll(filterCountryList(mapping));
      state.pageState.value = PageState.dataFetchState;
    }

    update();
  }

  List<AzListModel<Countries>> filterCountryList(List<Countries> countries) {
    List<AzListModel<Countries>> list =[];
    Map<String, List<Countries>> groupedCountries = {};
    for (var country in countries) {
      String section = country.name![0].toUpperCase();
      if (!groupedCountries.containsKey(section)) {
        groupedCountries[section] = [];
      }
      groupedCountries[section]!.add(country);
    }
    for (var section in groupedCountries.keys.toList()..sort()) {
      list.add(AzListModel(
        section: section,
        names: groupedCountries[section]!,
      ));
    }
    return list;
  }

  ///load assets
  Future<List<Countries>?> loadCountries() async {
    var loadModels = await storageKV.loadModels(StorageKey.countriesList);
    if(loadModels.isEmpty){
      final String response = await rootBundle.loadString(Assets.jsonCountry);
      final data = json.decode(response);
       var countryEntity = CountryEntity.fromJson(data);
      return countryEntity.countriess;
    }
    return loadModels.where((country) => country != null).cast<Countries>().toList();
  }

}
