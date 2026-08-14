import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class RoutedetaiController extends GetxController {
  final RxList<Map<String, dynamic>> pointRouteData =
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
        "http://192.168.1.12/point_mangement_system/getRouteDetail.php",
      );
      print(respone.data.runtimeType);
      List data = jsonDecode(respone.data);

      pointRouteData.value = List<Map<String, dynamic>>.from(data);

      print("response $respone");
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
