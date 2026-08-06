import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/driverUpdateController.dart';

class Driverupdateform extends StatefulWidget {
  final String id;
  final String cnic;
  final String name;
  final String phone_number;
  final String familyContact;
  final String address;
  final String salary;

  const Driverupdateform({
    super.key,
    required this.id,
    required this.cnic,
    required this.name,
    required this.phone_number,
    required this.familyContact,
    required this.address,
    required this.salary,
  });

  @override
  State<Driverupdateform> createState() => _DriverupdateformState();
}

class _DriverupdateformState extends State<Driverupdateform> {
  Driverupdatecontroller driverupdatecontroller = Driverupdatecontroller();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    driverupdatecontroller.cnic_controller.text = widget.cnic;
    driverupdatecontroller.name_controller.text = widget.name;
    driverupdatecontroller.phoneNumber_controller.text = widget.phone_number;
    driverupdatecontroller.familyContact_controller.text = widget.familyContact;
    driverupdatecontroller.address_controller.text = widget.address.trim();
    driverupdatecontroller.salary_controller.text = widget.salary.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Update Driver",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Obx(()  => driverupdatecontroller.isLoading.value ? CircularProgressIndicator(): Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Personal Information",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // CNIC
              TextFormField(
                controller: driverupdatecontroller.cnic_controller,
                keyboardType: TextInputType.number,
                maxLength: 13,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "CNIC is required";
                  }

                  if (!RegExp(r'^\d{13}$').hasMatch(value.trim())) {
                    return "Enter a valid 13-digit CNIC";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "CNIC",
                  prefixIcon: const Icon(Icons.badge_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Name
              TextFormField(
                controller: driverupdatecontroller.name_controller,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Driver name is required";
                  }

                  if (value.trim().length < 3) {
                    return "Name must be at least 3 characters";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Driver Name",
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Phone
              TextFormField(
                controller: driverupdatecontroller.phoneNumber_controller,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Phone number is required";
                  }

                  if (!RegExp(r'^03\d{9}$').hasMatch(value.trim())) {
                    return "Enter a valid phone number";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: const Icon(Icons.phone_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Family Contact
              TextFormField(
                controller: driverupdatecontroller.familyContact_controller,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Family contact is required";
                  }

                  if (!RegExp(r'^03\d{9}$').hasMatch(value.trim())) {
                    return "Enter a valid phone number";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Family Contact",
                  prefixIcon: const Icon(Icons.family_restroom),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Other Information",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // Address
              TextFormField(
                controller: driverupdatecontroller.address_controller,
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Address is required";
                  }

                  if (value.trim().length < 5) {
                    return "Please enter a valid address";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Address",
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Salary
              TextFormField(
                controller: driverupdatecontroller.salary_controller,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Salary is required";
                  }

                  final salary = double.tryParse(value.trim());

                  if (salary == null) {
                    return "Enter a valid salary";
                  }

                  if (salary <= 0) {
                    return "Salary must be greater than 0";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Salary",
                  prefixIcon: const Icon(Icons.payments_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Update Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                     await driverupdatecontroller.updateDriver(id: int.parse(widget.id));

                      print("Form is valid");
                     Get.back(result: true);
                     // Call your update API here
                    }
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text(
                    "Update Driver",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          )),
        ),
      ),
    );
  }
}
