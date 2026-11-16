import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_mangement_system/AuthScreens/signUp.dart';
import 'package:point_mangement_system/Controller/Admin/PointUpdateController.dart';
import 'package:point_mangement_system/FormScreens/std_form.dart';
import 'package:point_mangement_system/UserScreens/userPointRouteDetails.dart';

import 'AdminScreens/AdminDashBoard.dart';
import 'AdminScreens/driverDetail.dart';
import 'AdminScreens/financial_dashboard.dart';
import 'AdminScreens/pointDetails.dart';
import 'AdminScreens/routeDetails.dart';
import 'AdminScreens/studentDeletePage.dart';
import 'AdminScreens/student_request_details.dart';
import 'AdminScreens/student_requests.dart';
import 'Binding/Admin/AdminDriverBinding.dart';
import 'Binding/Admin/AdminPointBinding.dart';
import 'Binding/Admin/AdminRouteBinding.dart';
import 'Binding/Admin/DriverUpdateBinding.dart';
import 'Binding/Admin/FinancailDashBoardBinding.dart';
import 'Binding/Admin/PointUpdateBinding.dart';
import 'Binding/Admin/RouteUpdateBinding.dart';
import 'Binding/Admin/studentDeleteBinding.dart';
import 'Binding/Admin/studentRequestBinding.dart';
import 'Binding/User/UserRouteDisplayBinding.dart';
import 'Binding/User/scheduelBinding.dart';
import 'Binding/User/studentFormBinding.dart';
import 'FormScreens/RouteUpdate.dart';
import 'FormScreens/pointUpdateForm.dart';
import 'UserScreens/Schedule.dart';
import 'SplashScreen.dart';
import '../FormScreens/driverUpdateForm.dart';
import 'AuthScreens/login.dart';
import 'UserScreens/pdfUploadPage.dart';
import 'UserScreens/userDashBoard.dart';
import 'emailChecker.dart';

void main() {
  runApp(const MyApp()); //scheduel not display all routes correctly
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Lato",
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionHandleColor: Colors.grey,
          selectionColor: Color.fromRGBO(227, 228, 227, 0.8),
        ),
      ),
      initialRoute: '/UserDashBoard',

      getPages: [

//done
        GetPage(
          name: '/driver',
          page: () => Driverdetail(),
          binding: adminDriverBinding(),
        ),
        GetPage(
          name: '/driverUpdate',
          page: () => Driverupdateform(
            id: Get.arguments['id'],
            cnic: Get.arguments['cnic'],
            name: Get.arguments['name'],
            phone_number: Get.arguments['phone_number'],
            familyContact: Get.arguments['familyContact'],
            address: Get.arguments['address'],
            salary: Get.arguments['salary'],
          ),
          binding: driverUpdateBinding(),
        ),

        //done
        GetPage(
          name: '/AdminRoute',
          page: () => AdminRoutedetail(),
          binding: AdminRouteBinding(),
        ),

        //done
        GetPage(
          name: "/RouteUpdate",
          page: () => RouteUpdateForm(
            name: Get.arguments['name'],
            fees: Get.arguments['fees'],
            total_distance: Get.arguments['total_distance'],
            id: Get.arguments['id'],
          ),
          binding: RouteUpdateBinding(),
        ),

        //done
        GetPage(
          name: "/scheduel",
          page: () => RouteSchedule(),
          binding: scheduelBinding(),
        ),

        //done
        GetPage(
          name: "/RouteDisplay",
          page: () => routeDetails(),
          binding: UserRouteDisplayBinding(),
        ),

        //done
        GetPage(
          name: "/studentForm",
          page: () => StudentForm(),
          binding: StudentFormBinding(),
        ),

        //done
        GetPage(
          name: "/adminPoint",
          page: () => PointDetail(),
          binding: Adminpointbinding(),
        ),
//done
        GetPage(
          name: "/pointUpdate",

          page: () => Pointupdateform(
            P_id: Get.arguments['P_id'],
            pointNumberPlate: Get.arguments['pointNumberPlate'],
            r_name: Get.arguments['r_name'],
            r_id: Get.arguments['r_id'],
            driverName: Get.arguments['driverName'],
            driverId: Get.arguments['driverId'],
            capacity: Get.arguments['capacity'],
            pickUpTime: Get.arguments['pickUpTime'],
            dispatchTime: Get.arguments['dispatchTime'],
            petrolCost: Get.arguments['petrolCost'],
          ),
          binding: PointUpdateBinding(),
        ),
//done
        GetPage(
          name: "/financialDashBoard",
          page: () => Financialdashboard(),
          binding: Financaildashboardbinding(),
        ),
//done
        GetPage(name: "/studentRequestPage", page: () => StudentRequestsPage(),
        binding: StudentRequestBinding()),

        GetPage(
          name: "/StudentRequestDetails",
          page: () => StudentRequestDetails(),
            binding: StudentRequestBinding()
        ),
//done
        GetPage(
            name: "/StudentDeletePage",
            page: () => StudentPage(),
            binding: StudentDeleteBinding()
        ),
        //tester
        GetPage(name: "/pdfUploadPagetest", page: () => PdfUploadPage()),
        GetPage(name: "/Admindashboard", page: () => AdminDashboard()),
        GetPage(name: "/UserDashBoard", page: () => UserDashboard()),
      ],
    );
  }
}

