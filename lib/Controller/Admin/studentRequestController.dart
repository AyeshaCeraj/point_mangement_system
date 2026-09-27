import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:url_launcher/url_launcher.dart';

class StudentRequestController extends GetxController {
  final RxList studentRequestData = [].obs;

  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    Response response = await Dio().get(
      "http://192.168.1.8/point_mangement_system/getStudentRequest.php",
    );

    //  print("response : $response");

    final data = jsonDecode(response.data);

    studentRequestData.assignAll(data);

    print("studentRequestData $studentRequestData");
  }

  Future<void> openPdf(Map<String,dynamic> studentData) async{
    print("open pdf $studentData");
    final pdfPath = studentData["id_card_file_path"];

    final pdfUrl =
        "http://192.168.1.8/point_mangement_system/$pdfPath";

    final uri = Uri.parse(pdfUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      print("Could not open PDF");
      Get.snackbar(
        "Notification",
        "Could not open PDF",
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updateStatus({required int id, required String status})async{
    print("this is sid $id");
    try {
      Response response = await Dio().post(
        "http://192.168.1.8/point_mangement_system/UpdateStudentStatus.php",
        data: {
          "id": id,
          "status" : status
        },
      );

      print("Response: ${response.data}");
      print("Response: ${response.data.runtimeType}");

      final data = response.data;

      if (data == "success") {
        getData();
        Get.back();
        print("Student Accepted");

      } else {
        print("Student Not Accepted");
      }

    } catch (e) {
      print("Error: $e");
    }
  }
}
