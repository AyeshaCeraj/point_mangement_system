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
      appBar: AppBar(title: Text("Routes"),centerTitle: true,),

      body: Obx(
        () => routeDetaiController.pointRouteData.isEmpty
            ? Center(child: CircularProgressIndicator(color: Colors.white,backgroundColor:Colors.green[600]))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: routeDetaiController.pointRouteData.length,

                      itemBuilder: (context, index) {
                        var data = routeDetaiController.pointRouteData[index];
                        return Card(
                          elevation: 4,
                          shadowColor: Color.fromRGBO(1, 1, 1, 1),
                          margin: EdgeInsets.all(18),
                          color: Color.fromRGBO(232, 245, 233, 1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Text(
                                  data['r_name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.01),

                                Divider(),
                                SizedBox(height: Get.height * 0.02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text("Fees"), Text(data['fees'])],
                                ),

                                SizedBox(height: Get.height * 0.005),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text("Capacity"),

                                    Text(data['capacity'].toString()),
                                  ],
                                ),

                                SizedBox(height: Get.height * 0.005),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text("Booked Seats"),
                                    Text(data['booked_seats'].toString()),
                                  ],
                                ),

                                SizedBox(height: Get.height * 0.005),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text("Available Seats"),

                                    Text(data['available_seats'].toString()),
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
