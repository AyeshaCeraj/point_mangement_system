import 'package:get/get.dart';

import '../../Controller/User/routeDetailController.dart';

class UserRouteDisplayBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<RoutedetaiController>(
          () => RoutedetaiController(),
    );
  }
}