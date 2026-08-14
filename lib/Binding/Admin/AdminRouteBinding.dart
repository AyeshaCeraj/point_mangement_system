import 'package:get/get.dart';

import '../../Controller/Admin/AdminRouteController.dart';


class AdminRouteBinding extends Bindings{
  void dependencies(){
    Get.lazyPut<Adminroutecontroller>(()=> Adminroutecontroller());
  }
}