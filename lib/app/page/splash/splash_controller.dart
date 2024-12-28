import 'package:live_chat/app/api/global_fetch.dart';
import 'package:live_chat/app/const/storage_key.dart';
import 'package:live_chat/app/router/app_router.dart';
import 'package:live_chat/app/router/main_router.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';
import 'package:live_chat/base/utils/light_model.dart';
import 'package:live_chat/base/utils/log_util.dart';

import '../../router/login_router.dart';
import 'splash_state.dart';

class SplashController extends CommonController<SplashState> {

  var globalFetch = GlobalFetch();

  @override
  SplashState createState() {
    return SplashState();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 3),(){
      fetchConfig();
    });
  }

  Future<void> fetchConfig() async {
    var globalConfig = await globalFetch.fetchGlobalConfig();
    var model = await storageKV.getModel(key: StorageKey.userJson);
    logD('user:$model');
    if(model != null){
      currentTo(name: MainRouter.mainContainer);
      return;
    }

    if(globalConfig.loginMethod != null){
      if('email' == globalConfig.loginMethod!.name){
        currentOffName(name: LoginRouter.loginEmail);
      }else{

      }
    }
  }

}
