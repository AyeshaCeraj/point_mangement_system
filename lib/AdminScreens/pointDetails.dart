import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Admin/AdminDriverController.dart';
import '../Controller/Admin/AdminPointController.dart';
import '../FormScreens/driverUpdateForm.dart';
import '../FormScreens/pointUpdateForm.dart';

class PointDetail extends StatefulWidget {
  const PointDetail({super.key});

  @override
  State<PointDetail> createState() => _DriverdetailState();
}

class _DriverdetailState extends State<PointDetail> {
  final pointDetailController = Get.find<PointDetailController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Point", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green[900],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.02),
            Obx(
              () => pointDetailController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.green[600],
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: pointDetailController.PointData.length,
                        itemBuilder: (context, index) {
                          var data = pointDetailController.PointData[index];

                          return CardDetails(
                            pointNumberPlate: data['number_plate'] ?? "N/A",
                            r_name: data['r_name'] ?? "Route not allotted",
                            driverName: data['driverName'] ?? "Driver not allotted",
                            capacity: data['capacity'] ?? 0,
                            avalibleSeats: data['available_seats'] ?? 0,
                            bookedSeats: data['booked_seats'] ?? 0,
                            pickUpTime: data['pickupTime'] ?? "N/A",
                            dispatchTime: data['dispatchTime'] ?? "N/A",
                            petrolCost: data['petrol_cost']?.toString() ?? "N/A",
                            r_id: data['route_id'] ?? 0,
                            driverId: data['driver_id'] ?? 0,
                            P_id: data['id'] ?? 0,
                          );
                        },
                      ),
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

//container extra
class CardDetails extends StatelessWidget {
  final int P_id;
  final String pointNumberPlate;
  final String r_name;
  final int r_id;
  final String driverName;
  final int driverId;
  final int capacity;
  final int avalibleSeats;
  final int bookedSeats;
  final String pickUpTime;
  final String dispatchTime;
  final String petrolCost;

  const CardDetails({
    super.key,
    required this.pointNumberPlate,
    required this.r_name,
    required this.driverName,
    required this.capacity,
    required this.avalibleSeats,
    required this.bookedSeats,
    required this.pickUpTime,
    required this.dispatchTime,
    required this.petrolCost,
    required this.r_id,
    required this.driverId, required this.P_id,
  });

  @override
  Widget build(BuildContext context) {
    final pointDetailController = Get.find<PointDetailController>();
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          SafeArea(
            child: Container(
              // height: 45,
              width: double.infinity,
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(23),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        child: Icon(Icons.directions_bus),
                        backgroundColor: Colors.green[900],
                        foregroundColor: Colors.white,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pointNumberPlate,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900],
                            ),
                          ),

                          Text(
                            r_name,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            RowInBottomSheet(
                              title: 'Number Plate',
                              detail: pointNumberPlate,
                            ),
                            RowInBottomSheet(
                              title: 'Available Seats',
                              detail: avalibleSeats.toString(),
                            ),
                            RowInBottomSheet(title: 'Capacity', detail: capacity.toString()),
                            RowInBottomSheet(
                              title: 'Booked Seats',
                              detail: bookedSeats.toString(),
                            ),
                            RowInBottomSheet(
                              title: 'PickUp Time',
                              detail: pickUpTime,
                            ),
                            RowInBottomSheet(
                              title: 'Dispatch Time',
                              detail: dispatchTime,
                            ),
                            RowInBottomSheet(title: 'Route', detail: r_name),
                            RowInBottomSheet(
                              title: 'Petrol Cost',
                              detail: petrolCost,
                            ),
                            RowInBottomSheet(
                              title: 'Driver',
                              detail: driverName,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromRGBO(221, 213, 213, 1.0)),
            borderRadius: BorderRadiusGeometry.circular(23),
          ),
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // LEFT SIDE
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.green[900],
                        foregroundColor: Colors.white,
                        child: Icon(Icons.directions_bus),
                      ),

                      SizedBox(width: Get.width * 0.05),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pointNumberPlate,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              r_name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: "Gulshan" == "Route not alloted"
                                    ? Colors.blue
                                    : Colors.grey[700],
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              driverName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: "K-123" == "Point not alloted"
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async{
                       bool result = await Get.toNamed(
                          '/pointUpdate',
                          arguments: {
                            'P_id': P_id,
                            'pointNumberPlate': pointNumberPlate,
                            'r_name': r_name,
                            'r_id': r_id,
                            'driverName': driverName,
                            'driverId': driverId,
                            'capacity': capacity,
                            'pickUpTime': pickUpTime,
                            'dispatchTime': dispatchTime,
                            'petrolCost': petrolCost,
                          },
                        );

                       print("result $result");
                       if(result == true){
                          pointDetailController.getData();

                       }

                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(
                          190,
                          241,
                          194,
                          0.4196078431372549,
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

                    Row(
                      children: [
                        Icon(
                          Icons.event_seat,
                          color: Colors.green[900],
                          size: 23,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "$avalibleSeats / $capacity",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
