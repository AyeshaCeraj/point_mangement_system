import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart' hide FormData;
import 'package:intl/intl.dart';

import '../Controller/User/StudentController.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45),
  );
  final _formKey = GlobalKey<FormState>();

  final std_controller = Get.find<Studentcontroller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Student Form"),
          centerTitle: true,
        ),
        body: Obx(
          () => std_controller.isUploading.value
              ? Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Uploading",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900],
                        ),
                      ),
                      const SizedBox(width: 12),
                      SpinKitPouringHourGlass(
                        color: Colors.green[900]!,
                        size: 35,
                      ),
                    ],
                  ),
                )
              : Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.01),

                          //Name
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: std_controller.nameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Enter Full Name",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter name";
                              }

                              if (value.length < 3) {
                                return "Name must contain at least 3 characters";
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: Get.height * 0.03),

                          //Email
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: std_controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: "Enter Email Address",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter email";
                              }

                              if (!GetUtils.isEmail(value)) {
                                return "Please enter a valid email";
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: Get.height * 0.03),

                          //Gender
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Obx(
                              () => DropdownButton(
                                isExpanded: true,
                                hint: Text("Select Gender"),
                                value: std_controller.selectedGender.value,
                                items: std_controller.gender.map((e) {
                                  return DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  print(value);
                                  std_controller.selectedGender.value = value!;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.03),

                          //date of Birth
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: std_controller.dateController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month),
                              hintText: "Enter Date of Birth",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                            onTap: () {
                              std_controller.pickDate();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select date of birth";
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: Get.height * 0.03),

                          //Cnic
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            keyboardType: TextInputType.number,
                            maxLength: 13,
                            controller: std_controller.cnicController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.credit_card),
                              hintText: "Enter CNIC",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter CNIC";
                              }

                              if (value.length != 13) {
                                return "CNIC must be 13 digits";
                              }

                              return null;
                            },
                          ),

                          SizedBox(height: Get.height * 0.015),

                          //phone number
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            keyboardType: TextInputType.phone,
                            maxLength: 11,
                            controller: std_controller.phoneController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: "Enter Phone-Number",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter phone number";
                              }

                              if (value.length != 11) {
                                return "Phone number must be 11 digits";
                              }

                              return null;
                            },
                          ),

                          SizedBox(height: Get.height * 0.015),

                          //Address
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: std_controller.addressController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Enter Address",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter address";
                              }

                              return null;
                            },
                          ),

                          SizedBox(height: Get.height * 0.03),

                          //Department
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: std_controller.departmentController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_balance),
                              hintText: "Enter Department",
                              border: border,
                              enabledBorder: border,
                              focusedBorder: border,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter department";
                              }

                              if (value.length < 3) {
                                return "Department name is too short";
                              }

                              return null;
                            },
                          ),

                          SizedBox(height: Get.height * 0.03),

                          //semester
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Obx(
                              () => DropdownButton<int>(
                                isExpanded: true,
                                hint: Text("Select semester"),
                                value: std_controller.selectedSemester.value,
                                items: std_controller.semester.map((e) {
                                  return DropdownMenuItem<int>(
                                    child: Text(e.toString()),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  print(value);
                                  std_controller.selectedSemester.value = value;
                                },
                              ),
                            ),
                          ),

                          SizedBox(height: Get.height * 0.03),

                          //ROute
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Obx(
                              () => DropdownButton(
                                dropdownColor: Colors.white,

                                isExpanded: true,
                                hint: Text("Select Route"),

                                value: std_controller.selectedRouteId.value,
                                items: std_controller.routesDetails.map((e) {
                                  return DropdownMenuItem<int>(
                                    value: e["id"],
                                    child: Text(e["r_name"]),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  print("$value");

                                  std_controller.selectedRouteId.value = value;
                                  std_controller.selectedPointId.value = null;
                                },
                              ),
                            ),
                          ),

                          Obx(
                            () => std_controller.selectedRouteId.value == null
                                ? SizedBox.shrink()
                                :
                                  //Point
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsetsGeometry.only(
                                      top: Get.height * 0.03,
                                    ),
                                    height: 50,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black45),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Obx(() {
                                      final filteredPoint = std_controller
                                          .pointsDetails
                                          .where(
                                            (e) =>
                                                e["route_id"] ==
                                                std_controller
                                                    .selectedRouteId
                                                    .value,
                                          ).toList();

                                      return DropdownButton(
                                        dropdownColor: Colors.white,
                                        isExpanded: true,
                                        hint: filteredPoint.isEmpty ?Text("No Point is Available"):  Text("Select Point"),

                                        value: std_controller
                                            .selectedPointId
                                            .value,
                                        items: filteredPoint
                                            .map((e) {
                                              return DropdownMenuItem<int>(
                                                value: e["point_id"],
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(e["point_name"]),
                                                    Text(
                                                      DateFormat(
                                                        "hh:mm a",
                                                      ).format(
                                                        DateFormat(
                                                          "HH:mm:ss",
                                                        ).parse(
                                                          e["pickupTime"],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            })
                                            .toList(),
                                        onChanged: (value) {
                                          print("$value");

                                          std_controller.selectedPointId.value =
                                              value;

                                          print("point id ${value}");
                                        },
                                      );
                                    }),
                                  ),
                          ),
                          SizedBox(height: Get.height * 0.03),

                          //image
                          DottedBorder(
                            options: RectDottedBorderOptions(
                              dashPattern: [5, 6],
                              color: Colors.grey,
                            ),
                            child: Container(
                              //    height: 200,
                              width: double.infinity,
                              //   padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                //  color: Colors.green[50]
                              ),
                              child: Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    std_controller.pickPdf();
                                  },
                                  child: std_controller.fileName.value != null
                                      ? Container(
                                          padding: EdgeInsets.all(10),
                                          color: Color(0xFFEDFBEE),

                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.picture_as_pdf,
                                                color: Colors.red[700],
                                                size: 35,
                                              ),

                                              const SizedBox(width: 12),

                                              Expanded(
                                                child: Text(
                                                  std_controller
                                                      .fileName
                                                      .value!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),

                                              IconButton(
                                                onPressed: () {
                                                  std_controller
                                                          .fileName
                                                          .value =
                                                      null;
                                                  std_controller.selectedPdf =
                                                      null;
                                                },
                                                icon: const Icon(Icons.close),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.all(10),
                                          color: Color(0xFFEDFBEE),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.picture_as_pdf,
                                                size: 35,
                                                color: Colors.green[900],
                                              ),

                                              const SizedBox(width: 20),

                                              const Expanded(
                                                child: Text(
                                                  "Upload ID Card PDF",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: Get.height * 0.03),

                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (std_controller.selectedRouteId.value ==
                                    null) {
                                  Get.snackbar("Error", "Please select route");
                                  return;
                                }

                                if (std_controller.selectedPointId.value ==
                                    null) {
                                  Get.snackbar("Error", "Please select point");
                                  return;
                                }
                                if (std_controller
                                    .selectedGender
                                    .value!
                                    .isEmpty) {
                                  Get.snackbar("Error", "Please select gender");
                                  return;
                                }

                                if (std_controller.selectedPdf == null) {
                                  Get.snackbar("PDf Not Selected", "Please select a PDF first");
                                  return;
                                }
                                if (std_controller.selectedSemester.value ==
                                    null) {
                                  Get.snackbar(
                                    "Error",
                                    "Please select semester",
                                  );
                                  return;
                                }

                                await std_controller.uploadData();

                                _formKey.currentState!.reset();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[900],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minimumSize: Size(300, 50),
                            ),
                            child: Text("Submit"),
                          ),

                          SizedBox(height: Get.height * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
