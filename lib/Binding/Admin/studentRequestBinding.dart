
import 'package:get/get.dart';

import '../../Controller/Admin/studentRequestController.dart';

class StudentRequestBinding extends Bindings{

  void dependencies(){
    Get.lazyPut<StudentRequestController>(()=>StudentRequestController());
  }
}