import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class Driverupdatecontroller extends GetxController {
  TextEditingController cnic_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController phoneNumber_controller = TextEditingController();
  TextEditingController familyContact_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController salary_controller = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> updateDriver({required int id}) async {
    Map<String, dynamic> data = {
      "id": id,
      "name": name_controller.text.trim(),
      "cnic": cnic_controller.text.trim(),
      "phone_number": phoneNumber_controller.text.trim(),
      "familyContact": familyContact_controller.text.trim(),
      "address": address_controller.text.trim(),
      "salary": salary_controller.text.trim(),
    };

    try{
      isLoading.value =true;
     Response response =  await Dio().put(
        'http://192.168.1.12/point_mangement_system/driverUpdate.php',
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
