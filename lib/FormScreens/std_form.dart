import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide FormData;

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
        appBar: AppBar(title: Text("Student Form"), centerTitle: true),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.01),

                  //Name
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          return DropdownMenuItem(child: Text("$e"), value: e);
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    validator: (value){

                      if(value == null || value.isEmpty){
                        return "Please select date of birth";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * 0.03),

                  //Cnic
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,

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
                    autovalidateMode: AutovalidateMode.onUserInteraction,

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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: std_controller.departmentController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_balance),
                      hintText: "Enter Department",
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    validator: (value){

                      if(value == null || value.isEmpty){
                        return "Please enter department";
                      }

                      if(value.length < 3){
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
                        isExpanded: true,
                        hint: Text("Select Route"),

                        value: std_controller.selectedRouteId.value,
                        items: std_controller.location.map((e) {
                          return DropdownMenuItem<int>(
                            value: e["id"],
                            child: Text(e["r_name"]),
                          );
                        }).toList(),
                        onChanged: (value) {
                          print("$value");

                          std_controller.selectedRouteId.value = value;
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: Get.height * 0.03),


                  //image
                  DottedBorder(
                    options: RectDottedBorderOptions(dashPattern: [10, 5]),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(194, 243, 165, 0),
                      ),
                      child: Obx(
                        () => GestureDetector(
                          onTap: std_controller.pickImageFromGallery,
                          child: std_controller.selectedImage.value == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cloud_upload_outlined, size: 80),
                                    Text("Upload ID Card Image"),
                                    Text("jpg or png"),
                                  ],
                                )
                              : Image.file(
                                  std_controller.selectedImage.value!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: Get.height * 0.03),

                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (std_controller.selectedRouteId.value == null) {
                          Get.snackbar("Error", "Please select route");
                          return;
                        }

                        if (std_controller.selectedGender.value!.isEmpty) {
                          Get.snackbar("Error", "Please select gender");
                          return;
                        }

                        if (std_controller.selectedSemester.value == null) {
                          Get.snackbar("Error", "Please select semester");
                          return;
                        }

                        if (std_controller.selectedImage.value == null) {
                          Get.snackbar("Error", "Please upload ID card image");
                          return;
                        }
                        await std_controller.uploadData();

                        _formKey.currentState!.reset();

                      }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(5, 150, 105, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
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
    );
  }
}
