
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide FormData;


import 'StudentController.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45),
  );


  @override
  void initState() {
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    Studentcontroller std_controller = Get.put(Studentcontroller());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Student Form"), centerTitle: true),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.01),

                TextField(
                  controller: std_controller.nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Name",
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                TextField(
                  controller: std_controller.addressController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Address",
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                TextField(
                  controller: std_controller.dateController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month),
                    hintText: "Enter Date",
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                  onTap: () {
                    std_controller.pickDate();
                  },
                ),

                SizedBox(height: Get.height * 0.03),

                TextField(
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
                ),

                SizedBox(height: Get.height * 0.03),

                TextField(
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
                ),
                SizedBox(height: Get.height * 0.03),

                TextField(
                  controller: std_controller.departmentController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_balance),
                    hintText: "Enter Department",
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),


                SizedBox(height: 20),

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

                SizedBox(height: 20),
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

                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Obx(()=>
                      DropdownButton<int>(
                        isExpanded: true,
                        hint: Text("Select semester"),
                        value: std_controller.selectedSemester.value,
                        items: std_controller.semester.map((e) {
                          return DropdownMenuItem<int>(child: Text(e.toString()),value: e,);
                        }).toList(),
                        onChanged: (value) {
                          print(value);
                          std_controller.selectedSemester.value = value;
                        },
                      ),
                  ),
                ),

                SizedBox(height: 20),
                DottedBorder(
                  options: RectDottedBorderOptions(dashPattern: [10, 5]),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(194, 243, 165, 0.2),
                    ),
                    child:Obx(
                          () => GestureDetector(
                        onTap: std_controller.pickImageFromGallery,
                        child: std_controller.selectedImage.value == null
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              size: 80,
                            ),
                            Text("Upload ID Card Image"),
                            Text("jpg or png"),
                          ],
                        )
                            : Image.file(
                          std_controller.selectedImage.value!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: std_controller.uploadData, child: Text("Submit"))
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}
