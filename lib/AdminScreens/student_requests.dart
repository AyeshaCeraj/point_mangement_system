import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class StudentRequestsPage extends StatelessWidget {
  StudentRequestsPage({super.key});

  List<String> status = ["pending", "rejected"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Requests"), centerTitle: true,backgroundColor: Colors.green[900],foregroundColor: Colors.white,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                var data = status[index % 2];

                return CardDetails(status: data);
              },
            ),
          ),
          // CardDetails()
        ],
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  final String status;

  const CardDetails({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ayesha Siraj",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "requested route",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "Qulshan-e-hadeed",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: status == "pending"
                          ? Color.fromRGBO(190, 241, 194, 0.4196078431372549)
                          : Colors.red[100],
                      foregroundColor: status == "pending"
                          ? Color.fromRGBO(29, 95, 34, 1)
                          : Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "$status",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Icon(Icons.arrow_forward_ios_rounded, size: 18),

                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
