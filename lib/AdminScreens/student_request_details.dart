import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StudentRequestDetails extends StatelessWidget {
  const StudentRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
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
                  onPressed: () {},
                  child: Text("Reject"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(color: Colors.red)
                    ),
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.05),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Accept"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),

                    backgroundColor: Colors.green[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                        side: BorderSide(color: Colors.green[800]!)

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
                margin: EdgeInsets.symmetric(horizontal: 22,vertical: 12),

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
                      _buildRow(
                        label1: 'Full name',
                        value1: 'Ayesha Siraj',
                        label2: 'Gender',
                        value2: 'Female',
                      ),
                      SizedBox(height: 12),

                      _buildRow(
                        label1: 'Date-of-Birth',
                        value1: '31-3-2004',
                        label2: 'CNIC',
                        value2: 'xxxxx-xxxxxxx-x',
                      ),
                      SizedBox(height: 12),

                      _buildRow(
                        label1: "Email",
                        value1: 'ayesha@gmail.com',
                        label2: 'Phone',
                        value2: '03xxxxxxxxx',
                      ),
                      SizedBox(height: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text("Gulshan-e-Hadeed"),
                        ],
                      ),
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
                margin: EdgeInsets.symmetric(horizontal: 22,vertical: 12),

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
                        label1: 'Departent',
                        value1: 'BSCS',
                        label2: 'Semester',
                        value2: '7',
                      ),
                      SizedBox(height: 12),

                      _buildRow(
                        label1: 'Pickup Route',
                        value1: 'Gulshan',
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
                margin: EdgeInsets.symmetric(horizontal: 22,vertical: 12),

                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text(
                        "ID Card Image",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 200,
                        //  padding: EdgeInsets.all(50),
                        margin: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF8F0),
                          borderRadius: BorderRadiusGeometry.circular(12),
                          border: Border.all(color: Colors.black12, width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.badge_outlined),
                            Text("Not attached"),
                          ],
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
