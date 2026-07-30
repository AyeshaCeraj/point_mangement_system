import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';


class StudentScanForm extends StatefulWidget {
  const StudentScanForm({super.key});

  @override
  State<StudentScanForm> createState() => _StudentScanFormState();
}


class _StudentScanFormState extends State<StudentScanForm> {

  final nameController = TextEditingController();
  final picker = ImagePicker();
  final dio = Dio();

  File? imageFile;


  Future<void> pickImage() async {

    final image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if(image != null){
      setState(() {
        imageFile = File(image.path);
      });
    }
  }


  Future<File?> convertToJpg(File image) async {

    final result = await FlutterImageCompress.compressAndGetFile(
      image.path,
      "${image.path}.jpg",
      format: CompressFormat.jpeg,
      quality: 80,
    );

    return result == null ? null : File(result.path);
  }



  Future<void> uploadStudent() async {

    if(nameController.text.isEmpty || imageFile == null){
      showMessage("Fill all fields");
      return;
    }


    final jpgImage = await convertToJpg(imageFile!);

    if(jpgImage == null) return;


    try{

      final formData = FormData.fromMap({

        "name": nameController.text,

        "id_card": await MultipartFile.fromFile(
          jpgImage.path,
          filename: "id_card.jpg",
        ),

      });


      final response = await dio.post(
        "http://192.168.1.9/flutter_api/upload_student.php",
        data: formData,
      );


      final data = response.data is String
          ? jsonDecode(response.data)
          : response.data;


      showMessage(data["message"]);


      if(data["success"] == true){

        setState(() {
          imageFile = null;
        });

        nameController.clear();
      }


    }catch(e){

      showMessage("Error: $e");

    }

  }



  void showMessage(String message){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Student ID Upload"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height:20),


            SizedBox(
              height:220,
              width:double.infinity,

              child: imageFile == null

                  ? const Center(
                child: Text("No Image Selected"),
              )

                  : Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
            ),


            ElevatedButton(
              onPressed: pickImage,

              child: const Text("Pick Image"),
            ),


            ElevatedButton(
              onPressed: uploadStudent,

              child: const Text("Submit"),
            )

          ],
        ),
      ),
    );
  }
}