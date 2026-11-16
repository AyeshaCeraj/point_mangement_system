import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:point_mangement_system/Controller/Admin/studentRequestController.dart';
import 'package:point_mangement_system/api_config.dart';

class StudentDeleteController extends GetxController {
  RxBool isloading = false.obs;

  final Dio dio = Dio();

  final StudentRequestController studentRequestController =
      Get.find<StudentRequestController>();

  Future<bool> deleteStudent({required int id}) async {
    try {
      isloading.value = true;

      Response response = await dio.delete(
        '${ApiConfig.apiUrl}/deleteStudent.php',
        data: {'id': id},
      );

      if (response.statusCode == 200) {
        final data = response.data is String
            ? jsonDecode(response.data)
            : response.data;

        if (data['success'] == true) {
          studentRequestController.studentRequestData.removeWhere(
            (student) => student['s_id'] == id,
          );
          studentRequestController.acceptedStudentData.removeWhere(
            (student) => student['s_id'] == id,
          );
          isloading.value = false;
          Get.snackbar(
            "Success",
            "Student removed from list",
            snackPosition: SnackPosition.BOTTOM,
          );
          return true;
        }
      }
      isloading.value = false;

      return false;
    } catch (e) {
      print('Delete Student Error: $e');
      isloading.value = false;

      return false;
    } finally {
      isloading.value = false;
    }
  }
}
