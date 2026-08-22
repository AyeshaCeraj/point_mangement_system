import 'package:get/get.dart';

import '../../Controller/Admin/PointUpdateController.dart';



class PointUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointUpdateController>(() => PointUpdateController());
  }
}
