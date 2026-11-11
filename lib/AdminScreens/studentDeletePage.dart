import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Admin/studentDeleteController.dart';
import '../Controller/Admin/studentRequestController.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final Color primaryColor = Colors.green[900]!;

  final TextEditingController searchController = TextEditingController();

  final StudentRequestController studentRequestController =
  Get.find<StudentRequestController>();

  final StudentDeleteController studentDeleteController =
  Get.find<StudentDeleteController>();

  String searchQuery = '';

  // Filter students from API data
  List<Map<String, dynamic>> get filteredStudents {
    return studentRequestController.acceptedStudentData
        .where((student) {
          final name = (student['s_name'] ?? '').toString().toLowerCase();

          final id = (student['s_id'] ?? '').toString();

          final email = (student['email'] ?? '').toString().toLowerCase();

          return name.contains(searchQuery.toLowerCase()) ||
              id.contains(searchQuery) ||
              email.contains(searchQuery.toLowerCase());
        })
        .map<Map<String, dynamic>>(
          (student) => Map<String, dynamic>.from(student),
        )
        .toList();
  }

  // Delete student from local GetX list
  void deleteStudent(Map<String, dynamic> student) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Delete Student',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure you want to delete ${student['s_name'] ?? 'this student'}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text('Cancel', style: TextStyle(color: primaryColor)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                studentRequestController.acceptedStudentData.removeWhere(
                  (item) =>
                      item['s_id'].toString() == student['s_id'].toString(),
                );

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Student removed from list')),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // print("studentDeleteController ${studentRequestController.acceptedStudentData}");
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F5),

      // App Bar
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Student Management',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Accepted Students',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.school_rounded,
                        color: Colors.white,
                        size: 32,
                      ),

                      const SizedBox(width: 12),

                      Obx(
                        () => Text(
                          '${studentRequestController.acceptedStudentData.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        'Total Students',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: searchController,

                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },

                decoration: InputDecoration(
                  hintText: 'Search by name, ID or email...',

                  prefixIcon: Icon(Icons.search, color: primaryColor),

                  suffixIcon: searchQuery.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              searchQuery = '';
                            });
                          },
                          icon: const Icon(Icons.close),
                        )
                      : null,

                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric(vertical: 15),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Student List Heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Student List',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  Obx(
                    () => Text(
                      '${filteredStudents.length} Students',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Student List
            Expanded(
              child: Obx(() {
                final studentList = filteredStudents;

                if (studentList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 65,
                          color: Colors.grey[400],
                        ),

                        const SizedBox(height: 12),

                        Text(
                          searchQuery.isNotEmpty
                              ? 'No students found'
                              : 'No accepted students available',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  itemCount: studentList.length,

                  itemBuilder: (context, index) {
                    final student = studentList[index];

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 14),
                      elevation: 2,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            // Student Name and Delete
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.green.shade50,

                                  child: Icon(
                                    Icons.person,
                                    color: primaryColor,
                                    size: 27,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        (student['s_name'] ?? 'Unknown')
                                            .toString(),

                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Text(
                                        'Student ID: ${student['s_id'] ?? '-'}',

                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    deleteStudent(student);
                                  },

                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 25,
                                  ),

                                  tooltip: 'Delete Student',
                                ),
                              ],
                            ),

                            const Divider(height: 25),

                            // Student Details
                            _detailRow(
                              Icons.person_outline,
                              'Gender',
                              student['gender'],
                            ),

                            _detailRow(
                              Icons.cake_outlined,
                              'Date of Birth',
                              student['dob'],
                            ),

                            _detailRow(
                              Icons.school_outlined,
                              'Semester',
                              student['semester'],
                            ),

                            _detailRow(
                              Icons.business_outlined,
                              'Department',
                              student['department'],
                            ),

                            _detailRow(
                              Icons.phone_outlined,
                              'Contact',
                              student['phone_num'],
                            ),

                            _detailRow(
                              Icons.badge_outlined,
                              'CNIC',
                              student['cnic'],
                            ),

                            _detailRow(
                              Icons.email_outlined,
                              'Email',
                              student['email'],
                            ),

                            _detailRow(
                              Icons.location_on_outlined,
                              'Address',
                              student['address'],
                            ),

                            const SizedBox(height: 10),

                            // Route Information
                            Container(
                              padding: const EdgeInsets.all(12),

                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),

                              child: Column(
                                children: [
                                  _detailRow(
                                    Icons.route,
                                    'Route',
                                    student['r_name'],
                                  ),

                                  _detailRow(
                                    Icons.location_on_outlined,
                                    'Point',
                                    student['number_plate'],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 12),
                            const SizedBox(height: 12),

                            // ID Card PDF Button
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  studentRequestController.openPdf(student);
                                },
                                icon: const Icon(Icons.picture_as_pdf),
                                label: Text(
                                  (student['id_card_file_name'] ??
                                          'View ID Card')
                                      .toString(),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: primaryColor,
                                  side: BorderSide(color: primaryColor),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),
                            // Accepted Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),

                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 15,
                                      ),

                                      const SizedBox(width: 5),

                                      Text(
                                        (student['status'] ?? 'accepted')
                                            .toString()
                                            .capitalizeFirst!,

                                        style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Student Detail Row
  Widget _detailRow(IconData icon, String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        children: [
          Icon(icon, size: 18, color: primaryColor),

          const SizedBox(width: 10),

          SizedBox(
            width: 105,
            child: Text(
              title,

              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),

          Expanded(
            child: Text(
              value?.toString() ?? '-',

              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
