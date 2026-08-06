import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/DriverDetailController.dart';
import '../UpdateScreens/driverUpdateForm.dart';

class Driverdetail extends StatefulWidget {
  const Driverdetail({super.key});

  @override
  State<Driverdetail> createState() => _DriverdetailState();
}

class _DriverdetailState extends State<Driverdetail> {
  Driverdetailcontroller driverdetailcontroller = Get.put(
    Driverdetailcontroller(),
  );

  String initials(String name) {
    List<String> words = name.trim().split(" ");

    if (words.length >= 2) {
      return "${words[0][0]}${words[1][0]}".toUpperCase();
    }

    return words[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Driver", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * 0.02),
          Obx(
            () => driverdetailcontroller.driverRouteData.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.green[600],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: driverdetailcontroller.driverRouteData.length,
                      itemBuilder: (context, index) {
                        var data =
                            driverdetailcontroller.driverRouteData[index];
                        String initial = initials(data['name'].toString());

                        return CardDetails(
                          id: data['id'].toString(),
                          cnic: data['cnic'].toString(),
                          name: data['name'].toString(),
                          phone_number: data['phone_number'].toString(),
                          familyContact: data['familyContact'].toString(),
                          address: data['address'].toString(),
                          salary: data['salary'].toString(),
                          r_name: data['r_name'] == null
                              ? "Route not alloted"
                              : data["r_name"],
                          number_plate: data['number_plate'] == null
                              ? "Point not alloted"
                              : data["number_plate"],
                          initailLetter: initial,
                        );
                      },
                    ),
                  ),
          ),
          SizedBox(height: Get.height * 0.02),
        ],
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
  final String id;
  final String cnic;
  final String name;
  final String phone_number;
  final String familyContact;
  final String address;
  final String salary;
  final String r_name;
  final String number_plate;
  final String initailLetter;

  const CardDetails({
    super.key,
    required this.id,
    required this.cnic,
    required this.name,
    required this.phone_number,
    required this.familyContact,
    required this.address,
    required this.salary,
    required this.r_name,
    required this.number_plate,
    required this.initailLetter,
  });

  @override
  Widget build(BuildContext context) {
    final Drivercontroller = Get.find<Driverdetailcontroller>();
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            // height: 45,
            width: double.infinity,
            padding: EdgeInsets.all(23),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Text(
                        initailLetter,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      backgroundColor: Colors.green[900],
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                          ),
                        ),

                        Text(r_name, style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                RowInBottomSheet(title: 'Cnic', detail: cnic),
                RowInBottomSheet(title: 'Phone', detail: phone_number),
                RowInBottomSheet(
                  title: 'Family Contact',
                  detail: familyContact,
                ),
                RowInBottomSheet(title: 'Address', detail: address),
                RowInBottomSheet(title: 'Salary', detail: salary),
                RowInBottomSheet(title: 'Route', detail: r_name),
                RowInBottomSheet(title: 'Point no', detail: number_plate),
              ],
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
                        radius: 23,
                        backgroundColor: Colors.green[900],
                        foregroundColor: Colors.white,
                        child: Text(
                          "$initailLetter",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(width: Get.width * 0.05),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
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
                                color: r_name == "Route not alloted"
                                    ? Colors.blue
                                    : Colors.grey[700],
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              number_plate,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: number_plate == "Point not alloted"
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
                        final result = await Get.to(
                          () => Driverupdateform(
                            id: id,
                            cnic: cnic,
                            name: name,
                            phone_number: phone_number,
                            familyContact: familyContact,
                            address: address,
                            salary: salary,
                          ),

                        );
                        if (result == true) {
                          Drivercontroller.getData();
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

                    Text(
                      phone_number,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
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
