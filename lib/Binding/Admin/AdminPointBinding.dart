import 'package:get/get.dart';

import '../../Controller/Admin/AdminPointController.dart';

class Adminpointbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PointDetailController>(
          () => PointDetailController(),
    );
  }
}