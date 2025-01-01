import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:live_chat/app/page/main_container/main_container_view.dart';

class MainRouter{

  static const String mainContainer = '/main';

  static List<GetPage> routers() {
    return [
      GetPage(
        name: mainContainer,
        page: () =>  MainContainerPage(),
      ),

    ];

  }

}