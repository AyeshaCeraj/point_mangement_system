import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/User/scheduleController.dart';

class RouteSchedule extends StatefulWidget {
  const RouteSchedule({super.key});

  @override
  State<RouteSchedule> createState() => _RouteScheduleState();
}

class _RouteScheduleState extends State<RouteSchedule> {
  final scheduleController = Get.find<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //   backgroundColor: Colors.white,
        body: Obx(
          () => scheduleController.schedule.isEmpty
              ? Center(child: CircularProgressIndicator(color: Colors.white,backgroundColor:Colors.green[600]))
              : Column(
                  children: [
                    Container(
                      width: double.infinity,
                      // height: Get.height * 0.15,
                      padding: EdgeInsets.all(23),
                      decoration: BoxDecoration(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(53),
                          bottomRight: Radius.circular(53),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 29),
                          Text(
                            "Routes Schedule",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Veiw pickup and dropoff time for all routes",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,

                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            dataRowMinHeight: 70,
                            dataRowMaxHeight: 70,

                            columnSpacing: 20,

                            columns: [
                              DataColumn(
                                label: Text(
                                  "Route Name",
                                  style: TextStyle(
                                    color: Color.fromRGBO(3, 115, 11, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              DataColumn(
                                label: Text(
                                  "Pickup Time",
                                  style: TextStyle(
                                    color: Color.fromRGBO(3, 115, 11, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Dispatch Time",
                                  style: TextStyle(
                                    color: Color.fromRGBO(3, 115, 11, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                            rows: scheduleController.schedule.map((item) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Row(
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              23,
                                            ),
                                            color: Color.fromRGBO(
                                              29,
                                              95,
                                              34,
                                              0.1,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.green[900],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            softWrap: true,
                                            item["r_name"] ?? "",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  DataCell(
                                    Text(
                                      (item["pickupTime"] ?? "")
                                          .toString()
                                          .substring(0, 5),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      (item["pickupTime"] ?? "")
                                          .toString()
                                          .substring(0, 5),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    Image.asset("assets/images/point.png"),
                  ],
                ),
        ),
      ),
    );
  }
}
