import 'package:live_chat/app/api/global_fetch.dart';
import 'package:live_chat/app/router/app_router.dart';
import 'package:live_chat/base/controller/common_controller.dart';
import 'package:live_chat/base/utils/getx_util_tool.dart';

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
    fetchConfig();
  }

  Future<void> fetchConfig() async {
    var globalConfig = await globalFetch.fetchGlobalConfig();
    if(globalConfig.loginMethod != null){
      if('email' == globalConfig.loginMethod!.name){
        currentOffName(name: RouterId.loginEmail);
      }else{

      }
    }
  }

}
