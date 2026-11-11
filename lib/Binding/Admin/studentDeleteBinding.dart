import 'package:get/get.dart';

import '../../Controller/Admin/studentDeleteController.dart';
import '../../Controller/Admin/studentRequestController.dart';

class StudentDeleteBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<StudentRequestController>(
          () => StudentRequestController(),
    );

    Get.lazyPut<StudentDeleteController>(
          () => StudentDeleteController(),
    );

  }
}