import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class PdfUploadPage extends StatefulWidget {
  const PdfUploadPage({super.key});

  @override
  State<PdfUploadPage> createState() => _PdfUploadPageState();
}

class _PdfUploadPageState extends State<PdfUploadPage> {
  File? selectedPdf;
  String? fileName;
  bool isUploading = false;

  // Apne PC ka IP address yahan likho
  final String apiUrl =
      "http://192.168.1.20/point_mangement_system/uploadPdf.php";

  Future<void> pickPdf() async {
    try {
      print("1. PICK PDF START");

      final PlatformFile? file = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      print("2. FILE RESULT: $file");

      if (file != null && file.path != null) {
        print("3. FILE NAME: ${file.name}");
        print("4. FILE PATH: ${file.path}");

        setState(() {
          selectedPdf = File(file.path!);
          fileName = file.name;
        });

        print("5. PDF SELECTED SUCCESSFULLY");
      } else {
        print("5. USER CANCELLED");
      }
    } catch (e, stackTrace) {
      print("PDF PICK ERROR: $e");
      print(stackTrace);
    }
  }

  Future<void> uploadPdf() async {
    if (selectedPdf == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a PDF first")),
      );
      return;
    }

    setState(() => isUploading = true);

    try {
      final formData = FormData.fromMap({
        "student_id": "123",
        "pdf": await MultipartFile.fromFile(
          selectedPdf!.path,
          filename: fileName ?? "document.pdf",
        ),
      });

      final response = await Dio().post(
        apiUrl,
        data: formData,
        options: Options(
          contentType: "multipart/form-data",
          connectTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      final Map<String, dynamic> data =
      response.data is String
          ? jsonDecode(response.data)
          : Map<String, dynamic>.from(response.data);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              data["message"]?.toString() ?? "Upload successful",
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Upload failed: $e")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isUploading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Upload"),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 30),

            // PDF Icon
            Icon(
              Icons.picture_as_pdf,
              size: 90,
              color: Colors.red[700],
            ),

            const SizedBox(height: 20),

            const Text(
              "Upload PDF Document",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Select a PDF file from your device",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            // Select PDF Button
            OutlinedButton.icon(
              onPressed: pickPdf,
              icon: const Icon(Icons.attach_file),
              label: const Text("Select PDF"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green[900],
                side: BorderSide(
                  color: Colors.green[900]!,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Selected File
            if (fileName != null)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.green[200]!,
                  ),
                ),

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
                        fileName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPdf = null;
                          fileName = null;
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

            const Spacer(),

            // Upload Button
            ElevatedButton.icon(
              onPressed: isUploading ? null : uploadPdf,

              icon: isUploading
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
                  : const Icon(Icons.cloud_upload),

              label: Text(
                isUploading
                    ? "Uploading..."
                    : "Upload PDF",
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}