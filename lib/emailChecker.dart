import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Emailchecker extends StatelessWidget {
  const Emailchecker({super.key});

  Future<void> sendEmail({required String email,required String name}) async {
    try {
      final response = await Dio().post(
        "http://192.168.1.14/point_mangement_system/sendEmail.php",
        data: {"email": email, "name": name},
      );

      print(response.data);

      if (response.data["success"] == true) {
        print("Email sent");
      } else {
        print("Email failed");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: () async{
            sendEmail(email: 'ayeshasiraj64@gmail.com', name: 'Ayesha');
          }, child: Text("send email"))],
        ),
      ),
    );
  }
}
