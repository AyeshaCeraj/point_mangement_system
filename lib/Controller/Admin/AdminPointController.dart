import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class PointDetailController extends GetxController {
  final RxList<Map<String, dynamic>> PointData =
      <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    getData();
    super.onInit();
  }


  Future<void> getData() async {
    try {

      isLoading.value = true;
      Response respone = await Dio().get(
        "http://192.168.1.15/point_mangement_system/getAdminPoint.php",
      );

      print("STATUS: ${respone.statusCode}");
      print("DATA: ${respone.data}");
      print(respone.data.runtimeType);
      List data = jsonDecode(respone.data);

      PointData.assignAll(
        List<Map<String, dynamic>>.from(data),
      );
      print("response $respone");
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
