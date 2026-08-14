import 'package:get/get.dart';

import '../../Controller/Admin/RouteUpdateController.dart';

class RouteUpdateBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<Routeupdatecontroller>(() => Routeupdatecontroller());
  }
}
