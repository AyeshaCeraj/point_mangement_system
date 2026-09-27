import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:intl/intl.dart';

class Studentcontroller extends GetxController {
  RxnString selectedGender = RxnString();
  RxnInt selectedRouteId = RxnInt();
  RxnInt selectedPointId = RxnInt();
  RxnInt selectedSemester = RxnInt();
  RxList<Map<String, dynamic>> location = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> routesDetails = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> pointsDetails = <Map<String, dynamic>>[].obs;

  File? selectedPdf;
  RxnString fileName = RxnString();
  RxBool isUploading = false.obs;

  List<String> gender = ["Male", "Female", "others"];
  List<int> semester = [1, 2, 3, 4, 5, 6, 7, 8];
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> pickPdf() async {
    try {
      final PlatformFile? file = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (file != null && file.path != null) {
        selectedPdf = File(file.path!);
        fileName.value = file.name;
      }
      print("PDF is selected ");
    } catch (e) {
      print("PDF print error $e");
    }
  }

  Future<void> uploadData() async {
    DateTime dob = DateFormat("dd/MM/yyyy").parse(dateController.text);
    isUploading.value = true;

    try {
      final formData = FormData.fromMap({
        "s_name": nameController.text,
        "gender": selectedGender.value,
        "dob": dob,
        "phone_num": phoneController.text,
        "cnic": cnicController.text,
        "address": addressController.text,
        "department": departmentController.text,
        "semester": selectedSemester.value,
        "route_id": selectedRouteId.value,
        "email": emailController.text,
        "point_id" : selectedPointId.value,
        "pdf": await MultipartFile.fromFile(
          selectedPdf!.path,
          filename: fileName.value ?? "document.pdf",
        ),
      });

      print("Point ID   : ${selectedPointId.value}");
      final response = await Dio().post(
        "http://192.168.1.12/point_mangement_system/addStudent.php",
        data: formData,
      );

      final data = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      print(response.data);
      print("message ${data["message"]}");
      if (data["success"] == true) {
        Get.snackbar("Success", "${data["message"]}");
      }
      clear();
    } catch (e) {
      print("error $e");
      isUploading.value = false;
    } finally {
      isUploading.value = false;
    }
  }

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate!);
      print("Selected Date: ${dateController.text}");
    }
  }

  @override
  void onInit() {
    print("Controller Started");

    getRoute();
    super.onInit();
  }

  Future<void> getRoute() async {
    try {
      var result = await Dio().get(
        "http://192.168.1.12/point_mangement_system/getRoute.php",
      );

      final data = jsonDecode(result.data);

      routesDetails.assignAll(List<Map<String, dynamic>>.from(data["route"]));
      pointsDetails.assignAll(List<Map<String, dynamic>>.from(data["point"]));
      print(data.runtimeType);

      //  print("location $location");
      print("routesDetails $routesDetails");
      print("pointDetails $pointsDetails");
    } catch (e) {
      print("error $e");
    }
  }

  void clear() {
    nameController.clear();
    dateController.clear();
    cnicController.clear();
    phoneController.clear();
    addressController.clear();
    departmentController.clear();
    emailController.clear();
    fileName.value = null;
    selectedGender.value = null;
    selectedSemester.value = null;
    selectedRouteId.value = null;
  }
}
