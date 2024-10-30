import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:live_chat/app/tool/tool.dart';
import 'package:live_chat/base/state/page_state.dart';
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

    ///todo 先请求接口/失败才加载本地资源
    CountryEntity rsp =  await loadCountries();
    state.isShowLoadWidget.value = false;
    if (rsp.countriess?.isNotEmpty == true) {
      List<Countries> mapping = mappingCountryFlag(rsp.countriess!);
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
  Future<CountryEntity> loadCountries() async {
    final String response = await rootBundle.loadString(Assets.jsonCountry);
    final data = json.decode(response);
    return CountryEntity.fromJson(data);
  }

}
