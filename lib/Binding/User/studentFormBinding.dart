import 'package:get/get.dart';

import '../../Controller/User/StudentController.dart';

class StudentFormBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Studentcontroller>(
          () => Studentcontroller(),
    );
  }
}