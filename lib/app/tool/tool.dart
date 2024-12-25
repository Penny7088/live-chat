
import 'dart:ui';

import 'package:get/get.dart';
import 'package:live_chat/app/model/country_entity.dart';


String? obtainSystemLanguage(){
  Locale? locale = Get.deviceLocale;
  if(locale != null){
   if(locale.languageCode.contains('zh')){
     return 'zh-CN';
   }
   return locale.languageCode;
  }
  return null;
}

/// 获取国家图标，并返回list
List<Countries> mappingCountryFlag(List<Countries> list){
  List<Countries> container = [];
  for (var e in list) {
    e.flagIcon = 'assets/images/svg/flags/${e.isoCode?.toLowerCase()}.svg';
    container.add(e);
    // switch (e.isoCode){
    //   case 'AU':
    //     e.flagIcon = Assets.flagsAu;
    //     break;
    //   case 'CA':
    //     e.flagIcon = Assets.flagsCa;
    //     break;
    //   case 'NO':
    //     e.flagIcon = Assets.flagsNo;
    //     break;
    //   case 'NL':
    //     e.flagIcon = Assets.flagsNl;
    //     break;
    //   case 'IS':
    //     e.flagIcon = Assets.flagsIs;
    //     break;
    //   case 'ID':
    //     e.flagIcon = Assets.flagsId;
    //     break;
    //   case 'PH':
    //     e.flagIcon = Assets.flagsPh;
    //     break;
    //   case 'SG':
    //     e.flagIcon = Assets.flagsSg;
    //     break;
    //   case 'US':
    //     e.flagIcon = Assets.flagsUs;
    //     break;
    //   case 'FR':
    //     e.flagIcon = Assets.flagsFr;
    //     break;
    //   case 'DE':
    //     e.flagIcon = Assets.flagsDe;
    //     break;
    //   case 'CN':
    //     e.flagIcon = Assets.flagsCn;
    //     break;
    //   case 'IN':
    //     e.flagIcon = Assets.flagsIn;
    //     break;
    //   case 'BR':
    //     e.flagIcon = Assets.flagsBr;
    //     break;
    //   case 'RU':
    //     e.flagIcon = Assets.flagsRu;
    //     break;
    //   case 'JP':
    //     e.flagIcon = Assets.flagsJp;
    //     break;
    //   case 'GB':
    //     e.flagIcon = Assets.flagsGb;
    //     break;
    //   case 'IT':
    //     e.flagIcon = Assets.flagsIt;
    //     break;
    //   case 'KR':
    //     e.flagIcon = Assets.flagsKr;
    //     break;
    //   case 'ES':
    //     e.flagIcon = Assets.flagsEs;
    //     break;
    //   case 'TH':
    //     e.flagIcon = Assets.flagsTh;
    //     break;
    //   case 'VN':
    //     e.flagIcon = Assets.flagsVn;
    //     break;
    //   case 'NZ':
    //     e.flagIcon = Assets.flagsNz;
    //     break;
    //   case 'SE':
    //     e.flagIcon = Assets.flagsSe;
    //     break;
    //   case 'BE':
    //     e.flagIcon = Assets.flagsBe;
    //     break;
    //   case 'DK':
    //     e.flagIcon = Assets.flagsDk;
    //     break;
    //   case 'FI':
    //     e.flagIcon = Assets.flagsAu;
    //     break;
    //   case 'IE':
    //     e.flagIcon = Assets.flagsIe;
    //     break;
    //   case 'CH':
    //     e.flagIcon = Assets.flagsCh;
    //     break;
    //   case 'AT':
    //     e.flagIcon = Assets.flagsAt;
    //     break;
    //   case 'PT':
    //     e.flagIcon = Assets.flagsPt;
    //     break;
    //   case 'GR':
    //     e.flagIcon = Assets.flagsGr;
    //     break;
    //   case 'PL':
    //     e.flagIcon = Assets.flagsPl;
    //     break;
    //   case 'CZ':
    //     e.flagIcon = Assets.flagsCz;
    //     break;
    //   case 'HU':
    //     e.flagIcon = Assets.flagsHu;
    //     break;
    //   case 'RO':
    //     e.flagIcon = Assets.flagsRo;
    //     break;
    //   case 'AR':
    //     e.flagIcon = Assets.flagsAr;
    //     break;
    //   case 'CL':
    //     e.flagIcon = Assets.flagsCl;
    //     break;
    //   case 'CO':
    //     e.flagIcon = Assets.flagsCo;
    //     break;
    //   case 'ZA':
    //     e.flagIcon = Assets.flagsZa;
    //     break;
    //   case 'NG':
    //     e.flagIcon = Assets.flagsNg;
    //     break;
    //   case 'KE':
    //     e.flagIcon = Assets.flagsKe;
    //     break;
    //   case 'TR':
    //     e.flagIcon = Assets.flagsTr;
    //     break;
    //   case 'SA':
    //     e.flagIcon = Assets.flagsSa;
    //     break;
    //   case 'AE':
    //     e.flagIcon = Assets.flagsAe;
    //     break;
    //   case 'IL':
    //     e.flagIcon = Assets.flagsIl;
    //     break;
    //   case 'MY':
    //     e.flagIcon = Assets.flagsMy;
    //     break;
    //   case 'BD':
    //     e.flagIcon = Assets.flagsBd;
    //     break;
    // }

  }

  return container;
}