import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_mangement_system/signUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height * 1,
          // alignment: Alignment.center,
          color: Color.fromRGBO(240, 253, 244, 0.5),
          padding: EdgeInsets.all(Get.height * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.09),

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
                SizedBox(height: Get.height * 0.08),
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
                SizedBox(height: Get.height * 0.08),

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
                    Text("Don't have an account  ?   "),
                    TextButton(
                      onPressed: () {
                        Get.to(Signup());
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text("Sign Up",style: TextStyle(fontSize: 15,color: Color.fromRGBO(5, 150, 105, 1),fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
