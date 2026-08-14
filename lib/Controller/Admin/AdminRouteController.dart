import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class Adminroutecontroller extends GetxController {
  final RxList<Map<String, dynamic>> adminRouteData =
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
        "http://192.168.1.12/point_mangement_system/getAdminRouteDetails.php",
      );
      print(respone.data.runtimeType);
      List data = jsonDecode(respone.data);

      adminRouteData.value = List<Map<String, dynamic>>.from(data);

      print("response $respone");
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
