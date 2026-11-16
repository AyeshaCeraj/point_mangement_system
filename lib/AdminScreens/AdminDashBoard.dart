import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),

      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 55, 20, 25),
            decoration: const BoxDecoration(
              color: Color(0xFF1B5E20),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            ),

            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white, size: 28),
                ),

                const SizedBox(width: 25),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Admin Panel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Heading
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 22, 20, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Manage",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1D1A),
                ),
              ),
            ),
          ),

          // Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                //done
                DashboardCard(
                  title: "Driver Details",
                  subtitle: "Profile, license & status",
                  icon: Icons.drive_eta_rounded,
                  color: const Color(0xFF2E7D32),
                  onTap: () {
                    print("Driver Details Clicked");

                    Get.toNamed("/driver");
                  },
                ),

                DashboardCard(
                  title: "Student Requests",
                  subtitle: "Manage pending applications",
                  icon: Icons.person_add_alt_1_rounded,
                  color: const Color(0xFF1565C0),
                  onTap: () {
                    print("studentRequestPage Clicked");

                    Get.toNamed("/studentRequestPage");
                  },
                ),

                DashboardCard(
                  title: "Route Details",
                  subtitle: "Routes, seats & fees",
                  icon: Icons.route_rounded,
                  color: const Color(0xFFEF6C00),
                  onTap: () {
                    print("Driver Details Clicked");

                    Get.toNamed("/AdminRoute");
                  },
                ),

                DashboardCard(
                  title: "Point Details",
                  subtitle: "Manage pickup points",
                  icon: Icons.location_on_rounded,
                  color: const Color(0xFF6A1B9A),
                  onTap: () {
                    print("adminPoint Clicked");

                    Get.toNamed("/adminPoint");
                  },
                ),

                DashboardCard(
                  title: "Financial Dashboard",
                  subtitle: "Revenue, salary & expenses",
                  icon: Icons.bar_chart_rounded,
                  color: const Color(0xFFC62828),
                  onTap: () {
                    print("Driver Details Clicked");

                    Get.toNamed("/financialDashBoard");
                  },
                ),

                DashboardCard(
                  title: "Student Delete Page",
                  subtitle: "Manage pickup points",
                  icon: Icons.location_on_rounded,
                  color: const Color(0xFF6A1B9A),
                  onTap: () {
                    print("Student Delete Page");

                    Get.toNamed("/StudentDeletePage");
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Function() onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),

        border: Border.all(color: Colors.grey.shade200),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),

        leading: Container(
          height: 52,
          width: 52,

          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
          ),

          child: Icon(icon, color: color, size: 27),
        ),

        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ),

        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17,
          color: Colors.grey.shade500,
        ),

        onTap: onTap
      ),
    );
  }
}
