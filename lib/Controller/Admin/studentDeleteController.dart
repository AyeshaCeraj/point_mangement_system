
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class StudentDeleteController extends GetxController {

  //final RxList studentData = [].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getStudentData();
  // }
  //
  // Future<void> getStudentData() async {
  //   try {
  //     Response response = await Dio().get(
  //       "http://192.168.1.12/point_mangement_system/getStudentRequest.php",
  //     );
  //
  //     final data = jsonDecode(response.data);
  //
  //     // Filter only accepted students
  //     final acceptedStudents = data.where((student) {
  //       return student['status'] == 'accepted';
  //     }).toList();
  //
  //     // Store accepted students
  //     studentData.assignAll(acceptedStudents);
  //
  //    // print("Accepted Students: ${studentData.length}");
  //    // print("Student Data: $studentData");
  //
  //   } catch (e) {
  //     print("Error fetching students: $e");
  //   }
  // }
}
