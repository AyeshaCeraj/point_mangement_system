import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Admin/AdminRouteController.dart';


class AdminRoutedetail extends StatefulWidget {
  const AdminRoutedetail({super.key});

  @override
  State<AdminRoutedetail> createState() => _AdminRoutedetailState();
}

class _AdminRoutedetailState extends State<AdminRoutedetail> {
  final adminRouteController = Get.find<Adminroutecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Routes", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[900],
      ),

      body: Obx(
        () => adminRouteController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.green[600],
                ),
              )
            : Column(
                children: [
                  SizedBox(height: Get.height * 0.02),

                  Expanded(
                    child: ListView.builder(
                      itemCount: adminRouteController.adminRouteData.length,
                      itemBuilder: (context, index) {
                        final data = adminRouteController.adminRouteData[index];

                        return RouteCardDetails(
                          route_id: data['id'].toString(),
                          route_name: data['r_name'].toString(),
                          driver_name: data['driver_name']?.toString() ?? "",
                          total_distance: data['total_distance'].toString(),
                          point_id: data['number_plate']?.toString() ?? "",
                          fees: data['fees'].toString(),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: Get.height * 0.02),
                ],
              ),
      ),
    );
  }
}

class RowInBottomSheet extends StatelessWidget {
  final String title;
  final String detail;

  const RowInBottomSheet({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(flex: 3, child: Text(detail)),
        ],
      ),
    );
  }
}

class RouteCardDetails extends StatelessWidget {
  final String route_id;
  final String route_name;
  final String driver_name;
  final String total_distance;
  final String point_id;
  final String fees;

  const RouteCardDetails({
    super.key,
    required this.route_id,
    required this.route_name,
    required this.driver_name,
    required this.total_distance,
    required this.point_id,
    required this.fees,
  });

  @override
  Widget build(BuildContext context) {
    final Routecontroller = Get.find<Adminroutecontroller>();

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(23),

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(23)),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.green[900],
                      foregroundColor: Colors.white,

                      child: Text(
                        route_name[0].toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            route_name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                            ),
                          ),

                          Text(
                            "$total_distance Km",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Divider(),

                RowInBottomSheet(title: 'Route Name', detail: route_name),

                RowInBottomSheet(
                  title: 'Driver ID',
                  detail: driver_name.isEmpty
                      ? "Driver not allotted"
                      : driver_name,
                ),

                RowInBottomSheet(title: 'Distance', detail: total_distance),

                RowInBottomSheet(
                  title: 'Point No',
                  detail: point_id.isEmpty ? "Point not alloted" : point_id,
                ),

                RowInBottomSheet(title: 'Fees', detail: "Rs. $fees"),
              ],
            ),
          ),
        );
      },

      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),

        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromRGBO(221, 213, 213, 1.0)),

            borderRadius: BorderRadius.circular(23),
          ),

          color: Colors.white,
          elevation: 4,
          margin: const EdgeInsets.all(15),

          child: Padding(
            padding: const EdgeInsets.all(18),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // LEFT SIDE
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.green[900],
                        foregroundColor: Colors.white,

                        child: Text(
                          route_name[0].toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(width: Get.width * 0.05),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              route_name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              point_id.isEmpty
                                  ? "Point not alloted"
                                  : "point No: $point_id",

                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                fontSize: 14,
                                color: point_id.isEmpty
                                    ? Colors.teal[500]
                                    : Colors.grey[700],
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              driver_name.isEmpty
                                  ? "Driver not allotted"
                                  : "Driver $driver_name",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: driver_name.isEmpty
                                    ? Colors.red
                                    : Colors.green[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                // RIGHT SIDE
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      TextButton(
                        onPressed: () async {
                          final result = await Get.toNamed(
                            "/AdminUpdate",
                            arguments: {
                              'name': route_name,
                              'fees': fees,
                              'total_distance': total_distance,
                              'id': route_id,
                            },
                          );

                         if (result == true) {
                           Routecontroller.getData();
                         }
                        },

                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                            190,
                            241,
                            194,
                            0.42,
                          ),

                          foregroundColor: const Color.fromRGBO(29, 95, 34, 1),

                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 7,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        child: const Text(
                          "Update",

                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Icon(Icons.arrow_forward_ios_rounded, size: 18),

                      const SizedBox(height: 10),

                      Text(
                        "Fees $fees",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
