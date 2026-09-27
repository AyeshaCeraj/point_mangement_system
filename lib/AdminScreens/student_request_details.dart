import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/Admin/studentRequestController.dart';

class StudentRequestDetails extends StatelessWidget {
  StudentRequestDetails({super.key});

  final std_requestController = Get.find<StudentRequestController>();

  final Map<String, dynamic> studentData =
      Get.arguments["studentData"] as Map<String, dynamic>;

  final String routeName = Get.arguments["routeName"];

  @override
  Widget build(BuildContext context) {
    print("this is id $studentData");
    return Scaffold(
      backgroundColor: Color(0xFFF5F8F5),
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TRANSPORT  REQUEST",
                style: TextStyle(fontSize: 12, color: Colors.green[100]),
              ),
              Text(
                "Ayesha Siraj",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Pending Review",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(5),
                ),
                side: const BorderSide(color: Colors.white38, width: 1.5),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    std_requestController.updateStatus(id: studentData["s_id"] ,  status: "rejected");

                  },
                  child: Text("Reject"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.05),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    std_requestController.updateStatus(id: studentData["s_id"] ,  status: "accepted");
                  },
                  child: Text("Accept"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),

                    backgroundColor: Colors.green[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(color: Colors.green[800]!),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 12),

              //personal information
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  side: BorderSide(color: Colors.black12),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),

                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Full Name",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(studentData['s_name']),
                        ],
                      ),
                      SizedBox(height: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(studentData['email']),
                        ],
                      ),
                      SizedBox(height: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(studentData['address']),
                        ],
                      ),
                      SizedBox(height: 12),

                      _buildRow(
                        label1: 'Date-of-Birth',
                        value1: studentData['dob'],
                        label2: 'CNIC',
                        value2: studentData['cnic'],
                      ),
                      SizedBox(height: 12),

                      _buildRow(
                        label1: "Gender",
                        value1: studentData['gender'],
                        label2: 'Phone',
                        value2: studentData['phone_num'],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              //academic information
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  side: BorderSide(color: Colors.black12),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),

                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text(
                        "Academic Information",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 12),
                      _buildRow(
                        label1: 'Department',
                        value1: studentData['department'],
                        label2: 'Semester',
                        value2: studentData['semester'],
                      ),
                      SizedBox(height: 12),

                      _buildRow(
                        label1: 'Pickup Route',
                        value1: routeName,
                        label2: 'Drop Out',
                        value2: 'Smiu',
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              //Id Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  side: BorderSide(color: Colors.black12),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),

                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text(
                        "PDF",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          std_requestController.openPdf(studentData);
                        },
                        //     () async {
                        //   final pdfPath = studentData["id_card_file_path"];
                        //
                        //   final pdfUrl =
                        //       "http://192.168.1.12/point_mangement_system/$pdfPath";
                        //
                        //   final uri = Uri.parse(pdfUrl);
                        //
                        //   if (await canLaunchUrl(uri)) {
                        //     await launchUrl(
                        //       uri,
                        //       mode: LaunchMode.externalApplication,
                        //     );
                        //   } else {
                        //     print("Could not open PDF");
                        //     Get.snackbar(
                        //       "Notification",
                        //       "Could not open PDF",
                        //       snackPosition: SnackPosition.BOTTOM,
                        //     );
                        //   }
                        // },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF8F0),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green.shade100),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.red.shade700,
                                  size: 28,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  studentData['id_card_file_name'] ?? "No file",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildRow extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;

  const _buildRow({
    super.key,
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1, style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(value1),
            ],
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2, style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(value2),
            ],
          ),
        ),
      ],
    );
  }
}
