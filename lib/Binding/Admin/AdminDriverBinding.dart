import 'package:get/get.dart';

import '../../Controller/Admin/AdminDriverController.dart';

class adminDriverBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Driverdetailcontroller>(
          () => Driverdetailcontroller(),
    );
  }
}