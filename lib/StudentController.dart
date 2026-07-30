import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Studentcontroller extends GetxController {
  RxnString selectedGender = RxnString();
  RxnInt selectedRouteId = RxnInt();
  Rxn<File> selectedImage = Rxn<File>();
  RxnInt selectedSemester = RxnInt();
  RxList location = [].obs;


  List<String> gender = ["Male", "Female", "others"];
  List<int> semester = [1, 2, 3, 4, 5, 6, 7, 8];
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController semesterController = TextEditingController();

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate!);
    }
  }

  @override
  void onInit() {
    getRoute();
    super.onInit();
  }

  Future<void> getRoute() async {
    try {
      var result = await Dio().get(
        "http://192.168.1.7/point_mangement_system/getRoute.php",
      );
      location.addAll(jsonDecode(result.data));

      print(location);
    } catch (e) {
      print("error $e");
    }
  }

  Future<File?> convertToJpg(File image) async {
    final ressult = await FlutterImageCompress.compressAndGetFile(
      image.path,
      "${image.path}.jpg",
      format: CompressFormat.jpeg,
      quality: 80,
    );
    return ressult == null ? null : File(ressult.path);
  }

  Future<void> pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImage != null) {
      selectedImage.value = File(returnedImage.path);
      print("selescted Image: $selectedImage");
    } else {
      print("no image selected");
    }
  }

  Future<void> uploadData() async {
    final jpgImage = await convertToJpg(selectedImage.value!);
    DateTime dob = DateFormat("dd/MM/yyyy").parse(dateController.text);

    if (jpgImage == null) return;
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
        "id_card_image": await MultipartFile.fromFile(
          jpgImage.path,
          filename: "id_card.jpg",
        ),
      });

      final response = await Dio().post(
        "http://192.168.1.7/point_mangement_system/addStudent.php",
        data: formData,
      );

      final data = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      print(response.data);
      print("message ${data["message"]}");
    } catch (e) {
      print("error $e");
    }
  }

  void check() {
    print(nameController.text);
    print(addressController.text);
    print(dateController.text);
    print(phoneController.text);
  }
}
