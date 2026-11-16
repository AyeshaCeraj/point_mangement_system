import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../Controller/User/routeDetailController.dart';

class routeDetails extends StatefulWidget {
  const routeDetails({super.key});

  @override
  State<routeDetails> createState() => _routeDetailsState();
}

class _routeDetailsState extends State<routeDetails> {
  final routeDetaiController = Get.find<RoutedetaiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          "Routes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Obx(
        () => routeDetaiController.pointRouteData.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.green[900],
                  backgroundColor: Colors.green[100],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: routeDetaiController.pointRouteData.length,

                      itemBuilder: (context, index) {
                        var data = routeDetaiController.pointRouteData[index];

                        return Card(
                          elevation: 4,
                          shadowColor: Colors.green[900],
                          margin: EdgeInsets.all(18),
                          color: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.green.shade100,
                              width: 1,
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(18.0),

                            child: Column(
                              children: [
                                Text(
                                  data['r_name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green[900],
                                  ),
                                ),

                                SizedBox(height: Get.height * 0.01),

                                Divider(color: Colors.green[200]),

                                SizedBox(height: Get.height * 0.02),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Fees",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      data['fees'],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),

                                SizedBox(height: Get.height * 0.005),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Capacity",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      data['capacity'].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),

                                SizedBox(height: Get.height * 0.005),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Booked Seats",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      data['booked_seats'].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),

                                SizedBox(height: Get.height * 0.005),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Available Seats",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      data['available_seats'].toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
