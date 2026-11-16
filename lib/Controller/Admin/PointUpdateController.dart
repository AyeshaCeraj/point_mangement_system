import 'dart:convert';
import 'package:point_mangement_system/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class PointUpdateController extends GetxController {
  RxList PointData = [].obs;
  RxnInt selectedRoute = RxnInt();

  final TextEditingController pointNumberPlate = TextEditingController();
  final TextEditingController capacity = TextEditingController();
  final TextEditingController pickUpTime = TextEditingController();
  final TextEditingController dispatchTime = TextEditingController();
  final TextEditingController petrolCost = TextEditingController();
  RxBool isLoading = false.obs;

  onInit() {
    getRoute();
    super.onInit();
  }

  Future<void> getRoute() async {
    try {
      var result = await Dio().get(
        "${ApiConfig.apiUrl}/getRoute.php",
      );
      PointData.addAll(jsonDecode(result.data));

      print(PointData);
    } catch (e) {
      print("error $e");
    }
  }


  Future<void> updatePoint({required int id}) async {
    Map<String, dynamic> data = {
      "id": id,
      "route_id": selectedRoute.value,
      "capacity": int.tryParse(capacity.text.trim()) ?? 0,
      "petrol_cost": double.tryParse(petrolCost.text.trim()) ?? 0,
      "number_plate": pointNumberPlate.text.trim(),
      "pickupTime": pickUpTime.text.trim(),
      "dispatchTime": dispatchTime.text.trim(),
    };

    try {
      isLoading.value = true;

      Response response = await Dio().put(
        "${ApiConfig.apiUrl}/pointUpdate.php",
        data: data,
      );

      print("STATUS: ${response.statusCode}");
      print("RESPONSE: ${response.data}");
    } catch (e) {
      isLoading.value = false;

      print("ERROR: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
