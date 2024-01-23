import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pico_agent/common/constant.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/features/auth/presentation/widget/custom_formfield.dart';
import 'package:pico_agent/model/hospital_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddHospitalInformation extends StatelessWidget {
  const AddHospitalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController areaController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController websiteController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController opentimeController = TextEditingController();
    TextEditingController closetimeController = TextEditingController();
    TextEditingController weekendController = TextEditingController();
    TextEditingController logoController = TextEditingController();
    TextEditingController ratingController = TextEditingController();
    TextEditingController ambulanceController = TextEditingController();
    TextEditingController parkingController = TextEditingController();
    TextEditingController icuController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Fill this from with hostpital full information"),
              vpad15,
              CustomFormField(
                  controller: nameController, labelText: "Hospital Name"),
              vpad10,
              CustomFormField(
                  controller: areaController, labelText: "Hopital Area"),
              vpad10,
              CustomFormField(
                  controller: locationController,
                  labelText: "Hopital Location"),
              vpad10,
              CustomFormField(
                  controller: phoneController,
                  labelText: "Hopital Phone Numner"),
              vpad10,
              CustomFormField(
                  controller: descriptionController,
                  labelText: "Hopital Description"),
              vpad10,
              CustomFormField(
                  controller: websiteController, labelText: "Hopital website"),
              vpad10,
              CustomFormField(
                  controller: emailController, labelText: "Hopital email"),
              vpad10,
              CustomFormField(
                  controller: opentimeController,
                  labelText: "Hopital open time"),
              vpad10,
              CustomFormField(
                  controller: closetimeController,
                  labelText: "Hopital close time"),
              vpad10,
              CustomFormField(
                  controller: weekendController, labelText: "Weekend"),
              vpad10,
              CustomFormField(
                  controller: logoController, labelText: "Hospital Logo"),
              vpad10,
              CustomFormField(
                  controller: ratingController, labelText: "Hopital Rating"),
              vpad10,
              CustomFormField(
                  controller: ambulanceController,
                  labelText: "Hopital Ambulance"),
              vpad10,
              CustomFormField(
                  controller: parkingController, labelText: "Hopital Parking"),
              vpad10,
              CustomFormField(
                  controller: icuController, labelText: "No of ICU"),
              vpad10,
              ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final userid = await prefs.get('uid');
                    AuthService.setHospitalData(HospitalModel(
                        id: userid.toString(),
                        name: nameController.value.text,
                        area: areaController.value.text,
                        location: locationController.value.text,
                        phone: phoneController.value.text,
                        opensAt: opentimeController.value.text,
                        closeAt: closetimeController.value.text,
                        weekend: weekendController.value.text));
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
