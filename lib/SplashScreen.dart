import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.3,
              child: Image.asset("assets/images/PointLogo.png",),

            ),

            SizedBox(
              width:Get.width * 0.5,
              child: Divider(
                thickness: 3,
                radius: BorderRadius.circular(12),
                color: Color.fromRGBO(5, 150, 105, 0.4),
              ),
            ),
            SizedBox(height: 20,),
            Text("Point Mangement System",style: TextStyle(fontSize: 20,color: Color.fromRGBO(5, 150, 105, 1),fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
