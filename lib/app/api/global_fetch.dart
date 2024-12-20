import 'package:live_chat/app/api/mixin_api_fetch.dart';

import 'model/global_config_model.dart';

class GlobalFetch with ApiFetch {
  Future<GlobalConfigModel> fetchGlobalConfig() async {
    var apiResponse = await request(path: '/v1/globalConfig/loginMethod', method: Method.get);
    var response = apiResponse.data;
    var globalConfigModel = GlobalConfigModel.fromJson(response);
    return globalConfigModel;
  }
}
