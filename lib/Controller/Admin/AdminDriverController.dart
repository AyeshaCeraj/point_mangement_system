import 'dart:convert';
import 'package:point_mangement_system/api_config.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class Driverdetailcontroller extends GetxController {
  final RxList<Map<String, dynamic>> driverRouteData =
      <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    getData();
    super.onInit();
  }
  void getData() async {
    try {

      isLoading.value = true;
      Response respone = await Dio().get(
        "${ApiConfig.apiUrl}/getDriverDetails.php",
      );
      print(respone.data.runtimeType);
      List data = jsonDecode(respone.data);

      driverRouteData.value = List<Map<String, dynamic>>.from(data);

      print("response $respone");
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
