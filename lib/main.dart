import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_mangement_system/signUp.dart';
import 'package:point_mangement_system/std_form.dart';
import 'package:point_mangement_system/studentForm.dart';

import 'SplashScreen.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(

          fontFamily: "Lato",
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionHandleColor: Colors.grey,
            selectionColor: Colors.black
          )
        ),
        home: StudentForm());
  }
}
