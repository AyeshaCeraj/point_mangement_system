import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45),
  );
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.all(Get.height * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),

              Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: Get.height * 0.01),

              Center(
                child: Text(
                  "Login to access your Point Management System",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: Get.height * 0.05),

              Text("Name", style: TextStyle(fontSize: 16)),
              SizedBox(height: Get.height * 0.01),

              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Name",
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              SizedBox(height: Get.height * 0.03),

              Text("Email", style: TextStyle(fontSize: 16)),
              SizedBox(height: Get.height * 0.01),

              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              SizedBox(height: Get.height * 0.03),

              Text("Password", style: TextStyle(fontSize: 16)),
              SizedBox(height: Get.height * 0.01),

              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),

              SizedBox(height: Get.height * 0.03),

              Text("Confirm Password", style: TextStyle(fontSize: 16)),
              SizedBox(height: Get.height * 0.01),

              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Confirm Password",
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              SizedBox(height: Get.height * 0.05),

              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(5, 150, 105, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    minimumSize: Size(300, 50),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.04),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account  ?   "),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text("Sign In",style: TextStyle(fontSize: 15,color: Color.fromRGBO(5, 150, 105, 1),fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
