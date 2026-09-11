import 'package:get/get.dart';

import '../../Controller/Admin/FinancialDashboardController.dart';

class Financaildashboardbinding extends Bindings {
  void dependencies() {
    Get.lazyPut<FinancialDashBoardController>(() => FinancialDashBoardController());
  }
}
