import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Admin/RouteUpdateController.dart';

class RouteUpdateForm extends StatefulWidget {
  final String id;
  final String name;
  final String fees;
  final String total_distance;

  const RouteUpdateForm({
    required this.name,
    required this.fees,
    required this.total_distance, required this.id,
  });

  @override
  State<RouteUpdateForm> createState() => _RouteUpdateFormState();
}

class _RouteUpdateFormState extends State<RouteUpdateForm> {
  final routeUpdateController =Get.find<Routeupdatecontroller>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    routeUpdateController.rouutName_controller.text = widget.name;
    routeUpdateController.fees_controller.text = widget.fees;
    routeUpdateController.totalDistance_controller.text =
        widget.total_distance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Update Route",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,
          child: Obx(() => routeUpdateController.isLoading.value?
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
          ) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Route Information",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
          
              const SizedBox(height: 15),
          
              // Route Name
              TextFormField(
                controller: routeUpdateController.rouutName_controller,
                decoration: InputDecoration(
                  labelText: "Route Name",
                  prefixIcon: const Icon(Icons.route_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
          
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter route name";
                  }
          
                  if (value.trim().length < 3) {
                    return "Route name must be at least 3 characters";
                  }
          
                  return null;
                },
              ),
          
              const SizedBox(height: 15),
          
              // Fees
              TextFormField(
                controller: routeUpdateController.fees_controller,
          
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Fees",
                  prefixIcon: const Icon(Icons.payments_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                // Fees
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter fees";
                  }
          
                  final fees = double.tryParse(value.trim());
          
                  if (fees == null) {
                    return "Please enter a valid amount";
                  }
          
                  if (fees <= 0) {
                    return "Fees must be greater than 0";
                  }
          
                  return null;
                },
              ),
          
              const SizedBox(height: 15),
          
              // Total Distance
              TextFormField(
                controller: routeUpdateController.totalDistance_controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: "Total Distance (km)",
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
          
          
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter total distance";
                  }
          
                  final distance = double.tryParse(value.trim());
          
                  if (distance == null) {
                    return "Please enter a valid distance";
                  }
          
                  if (distance <= 0) {
                    return "Distance must be greater than 0";
                  }
          
                  return null;
                },
              ),
          
              const SizedBox(height: 25),
          
              // Update Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      await routeUpdateController.updateRoute(id: int.parse(widget.id));
                      Get.back(result: true);

                    }
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text(
                    "Update Route",
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
            ],
          ),
        ),
      ),
      )
    );
  }
}
