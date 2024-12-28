import 'package:live_chat/app/api/mixin_api_fetch.dart';
import 'package:live_chat/app/const/storage_key.dart';
import 'package:live_chat/base/utils/light_model.dart';

import 'model/global_config_model.dart';

class GlobalFetch with ApiFetch {

  Future<GlobalConfigModel> fetchGlobalConfig() async {
    var apiResponse = await request(path: '/v1/globalConfig', method: Method.get);
    var response = apiResponse.data;
    var globalConfigModel = GlobalConfigModel.fromJson(response);
    if(globalConfigModel.countries != null && globalConfigModel.countries?.isNotEmpty == true){
      storageKV.saveModels(globalConfigModel.countries!, StorageKey.countriesList);
    }
    if(globalConfigModel.languages != null && globalConfigModel.languages?.isNotEmpty == true){
      storageKV.saveModels(globalConfigModel.languages!, StorageKey.languagesList);
    }
    return globalConfigModel;
  }
}
