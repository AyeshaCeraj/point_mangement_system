import 'package:get/get.dart';

import '../../Controller/User/scheduleController.dart';

class scheduelBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(
          () => ScheduleController(),
    );
  }
}