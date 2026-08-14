import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class Routeupdatecontroller extends GetxController {
  TextEditingController rouutName_controller = TextEditingController();
  TextEditingController fees_controller = TextEditingController();
  TextEditingController totalDistance_controller = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> updateRoute({required int id}) async {
    Map<String, dynamic> data = {
      "id": id,
      "r_name": rouutName_controller.text.trim(),
      "fees": fees_controller.text.trim(),
      "total_distance": totalDistance_controller.text.trim(),
        };

    try{
      isLoading.value =true;
      Response response =  await Dio().put(
        'http://192.168.1.12/point_mangement_system/routeUpdate.php',
        data: data,
      );
      print("STATUS: ${response.statusCode}");
      print("RESPONSE: ${response.data}");
    }catch(e){
      isLoading.value =false;
      print("error $e");
    }
    finally{
      isLoading.value =false;

      print("nothing happern");
    }

  }
}
