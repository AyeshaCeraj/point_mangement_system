import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import your existing screens here

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text(
            "User Dashboard",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[900],
          iconTheme: IconThemeData(color: Colors.white),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 23),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Greeting
                Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                ),

                SizedBox(height: 5),

                Center(
                  child: Text(
                    "Manage your student transport",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),

                SizedBox(height: 20),



                SizedBox(height: 25),

                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),

                SizedBox(height: 15),

                // Student Form
                dashboardCard(
                  icon: Icons.assignment_outlined,
                  title: "Student Form",
                  subtitle: "View and submit student details",
                  onTap: () {
                   Get.toNamed("/studentForm");
                  },
                ),

                // Schedule
                dashboardCard(
                  icon: Icons.calendar_month,
                  title: "Schedule",
                  subtitle: "Check your transport schedule",
                  onTap: () {
                    Get.toNamed("/scheduel");

                  },
                ),

                // Point Route Details
                dashboardCard(
                  icon: Icons.directions_bus,
                  title: "Point Route Details",
                  subtitle: "View route, fees and available seats",
                  onTap: () {
                    Get.toNamed("/RouteDisplay");
                  },
                ),

                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.green[900]),

                      SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          "Stay updated with your transport "
                          "schedule and route details.",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
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

  Widget dashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.green[900],
      margin: EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.green.shade100),
      ),

      child: ListTile(
        contentPadding: EdgeInsets.all(12),

        leading: CircleAvatar(
          backgroundColor: Colors.green[50],
          child: Icon(icon, color: Colors.green[900]),
        ),

        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),

        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.black54, fontSize: 12),
        ),

        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.green[900],
          size: 18,
        ),

        onTap: onTap,
      ),
    );
  }
}
