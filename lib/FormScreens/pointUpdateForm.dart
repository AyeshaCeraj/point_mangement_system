import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Admin/AdminPointController.dart';
import '../Controller/Admin/PointUpdateController.dart';
import '../Controller/Admin/driverUpdateController.dart';
import '../Controller/User/routeDetailController.dart';

class Pointupdateform extends StatefulWidget {
  final int P_id;
  final String pointNumberPlate;
  final String r_name;
  final int r_id;
  final String driverName;
  final int driverId;
  final int capacity;

  final String pickUpTime;
  final String dispatchTime;
  final String petrolCost;

  const Pointupdateform({
    super.key,
    required this.P_id,
    required this.pointNumberPlate,
    required this.r_name,
    required this.r_id,
    required this.driverName,
    required this.driverId,
    required this.capacity,
    required this.pickUpTime,
    required this.dispatchTime,
    required this.petrolCost,
  });

  @override
  State<Pointupdateform> createState() => _PointupdateformState();
}

class _PointupdateformState extends State<Pointupdateform> {
  final _formKey = GlobalKey<FormState>();
  PointUpdateController pointUpdateController = Get.put(
    PointUpdateController(),
  );

  @override
  void initState() {
    super.initState();
    pointUpdateController.pointNumberPlate.text = widget.pointNumberPlate;
    pointUpdateController.capacity.text = widget.capacity.toString();
    pointUpdateController.petrolCost.text = widget.petrolCost;
    pointUpdateController.pickUpTime.text = widget.pickUpTime;
    pointUpdateController.dispatchTime.text = widget.dispatchTime;
  }

  var border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Update Point",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child:
          Obx(()=>
          pointUpdateController.isLoading.value ?
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
          )

          :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              const SizedBox(height: 15),

              // Name
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: pointUpdateController.pointNumberPlate,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Point Number Plate is required";
                  }

                  if (value.trim().length < 3) {
                    return "Number Plate must be at least 3 characters";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Point Number Plate",

                  prefixIcon: Icon(Icons.person),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),

              SizedBox(height: 10),

              // Capacity
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,

                controller: pointUpdateController.capacity,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Capacity is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(

                  labelText: "Capacity",
                  prefixIcon: Icon(Icons.person),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              const SizedBox(height: 15),


              TextFormField(
                controller: pointUpdateController.petrolCost,
                keyboardType: TextInputType.numberWithOptions(decimal: true),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Petrol Cost is required";
                  }

                  if (value.trim().length < 3) {
                    return "Petrol Cost must be at least 3 characters";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Petrol Cost",
                  prefixIcon: Icon(Icons.person),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Obx(
                  () => DropdownButton<int>(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: pointUpdateController.selectedRoute.value,
                    hint: Text(widget.r_name),

                    items: pointUpdateController.PointData.map((e) {
                      return DropdownMenuItem<int>(
                        value: int.parse(e['id'].toString()),
                        child: Text(e['r_name'].toString()),
                      );
                    }).toList(),

                    onChanged: (value) {
                      pointUpdateController.selectedRoute.value = value;
                      print(value);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: pointUpdateController.pickUpTime,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Pick Up Time",
                  suffixIcon: const Icon(Icons.access_time),
                  enabledBorder: border,
                  focusedBorder: border,
                ),
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (time != null) {
                    pointUpdateController.pickUpTime.text = time.format(
                      context,
                    );
                  }
                },
              ),
              SizedBox(height: 12),
              TextField(
                controller: pointUpdateController.dispatchTime,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Dispatch Time",
                  suffixIcon: Icon(Icons.access_time),
                  enabledBorder: border,
                  focusedBorder: border,
                ),
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (time != null) {
                    pointUpdateController.dispatchTime.text = time.format(
                      context,
                    );
                  }
                },
              ),
              SizedBox(height: 10),
              // Update Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Call your update API here
                     await pointUpdateController.updatePoint(id: widget.P_id);

                      Get.back(result: true);
                    }

                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text(
                    "Update Point",
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
          ),
        ),
      ),
    )
    );
  }
}
