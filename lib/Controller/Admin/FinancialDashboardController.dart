import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class FinancialDashBoardController extends GetxController {
  final RxMap<String, dynamic> financialData = <String, dynamic>{}.obs;
  RxBool isLoading = false.obs;
  RxDouble totalRevenueCost = 0.0.obs;
  RxDouble totalSalaryCost = 0.0.obs;
  RxDouble totalPetrolCost = 0.0.obs;
  RxDouble profit = 0.0.obs;

  // Gender
  final RxList<Map<String, dynamic>> cardData = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> cardUnFormatData =
      <Map<String, dynamic>>[].obs;

  // Points
  final RxList<Map<String, dynamic>> pointsData = <Map<String, dynamic>>[].obs;

  // Revenue
  final RxList<Map<String, dynamic>> revenueData = <Map<String, dynamic>>[].obs;

  // Driver Salary
  final RxList<Map<String, dynamic>> salaryData = <Map<String, dynamic>>[].obs;

  // Petrol
  final RxList<Map<String, dynamic>> petrolData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading.value = true;
      Response respone = await Dio().get(
        "http://192.168.1.20/point_mangement_system/financialDashboard.php",
      );
      print(respone.data.runtimeType);
      final data = jsonDecode(respone.data);

      financialData.value = Map<String, dynamic>.from(data);

      //        print("response $respone");

      //  print("financialData : ${financialData["gender"]}");

      // Separate data

      cardUnFormatData.value = [
        ...List<Map<String, dynamic>>.from(data["gender"]),
        ...List<Map<String, dynamic>>.from(data["points"]),
      ];
      cardDetailSetter(cardUnFormatData);
      print("\CardData Data: $cardData");

      revenueData.value = List<Map<String, dynamic>>.from(data["revenue"]);
      print("\nRevenue Data: $revenueData");

      salaryData.value = List<Map<String, dynamic>>.from(data["salary"]);
      print("\nSalary Data: $salaryData");

      petrolData.value = List<Map<String, dynamic>>.from(data["petrol"]);
      print("\nPetrol Data: $petrolData");

      calculateTotalRevenue();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void calculateTotalRevenue() {
   // print("hi this is revenue dta $revenueData");
    totalRevenueCost.value = double.parse(
      revenueData
          .firstWhere((item) => item["r_name"] == "Grand Total")["revenue"]
          .toString(),
    );

    totalSalaryCost.value = double.parse(salaryData.firstWhere(
          (item) => item["name"] == "Total",
    )["six_month"]);

    totalPetrolCost.value = double.parse(
      petrolData.firstWhere((item) => item["name"] == "Total")["six_month"],
    );

    profit.value = totalRevenueCost.value - totalSalaryCost.value - totalPetrolCost.value;
    print("total revenue $totalRevenueCost");
    print("total salary $totalSalaryCost");
    print("total petrol $totalPetrolCost");
    print("total profit $profit");
  }

  void cardDetailSetter(List<Map<String, dynamic>> data) {
    final List<Map<String, dynamic>> cards = [];

    for (var item in data) {
      if (item["gender"] == "Female") {
        cards.add({
          "title": "Female Students",
          "number": item["total_students"],
          "icon": Icons.female,
        });
      }

      if (item["gender"] == "Male") {
        cards.add({
          "title": "Male Students",
          "number": item["total_students"],
          "icon": Icons.male,
        });
      }

      if (item.containsKey("total_points")) {
        cards.add({
          "title": "Total Points",
          "number": item["total_points"],
          "icon": Icons.directions_bus_filled_outlined,
        });
      }
    }
    cardData.assignAll(cards);
  }
}
