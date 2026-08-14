import 'package:get/get.dart';

import '../../Controller/Admin/driverUpdateController.dart';


class driverUpdateBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<Driverupdatecontroller>(() => Driverupdatecontroller());
  }
}
