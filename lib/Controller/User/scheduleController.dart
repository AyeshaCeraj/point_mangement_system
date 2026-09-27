import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ScheduleController extends GetxController {
  final RxList<Map<String, dynamic>> schedule =
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
      Response response = await Dio().get(
        "http://192.168.1.20/point_mangement_system/schedule.php",
      );
      print(response.data.runtimeType);

      print("STATUS: ${response.statusCode}");
      print("RESPONSE: '${response.data}'");
      print("response $response");

      List data = jsonDecode(response.data);

      schedule.value = List<Map<String, dynamic>>.from(data);

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
