import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pico_agent/app_route.dart';
import 'package:pico_agent/common/constant.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/features/auth/presentation/widget/custom_formfield.dart';
import 'package:pico_agent/model/doctor_model.dart';
import 'package:pico_agent/model/hospital_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddHospitalInformation extends StatefulWidget {
  const AddHospitalInformation({super.key});

  @override
  State<AddHospitalInformation> createState() => _AddHospitalInformationState();
}

class _AddHospitalInformationState extends State<AddHospitalInformation> {

  final _formKey = GlobalKey<FormState>();
  
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
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Text("Fill this from with hostpital full information"),
                vpad15,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Hospital Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
            
                  controller: nameController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Hopital Area",
                  ),
                  controller: areaController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: "Hopital Location",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Hopital Phone Numner",
                  ),
                  validator: (v) {
                    if (v!.isEmpty && v.length < 10) {
                      return "Must be 11 digit";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: "Hopital Description",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: websiteController,
                  decoration: InputDecoration(
                    labelText: "Hopital website",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Hopital email",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty ";
                    } else if (v.contains("@")) {
                      return "email not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: opentimeController,
                  decoration: InputDecoration(
                    labelText: "Hopital open time",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: closetimeController,
                  decoration: InputDecoration(
                    labelText: "Hopital close time",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: weekendController,
                  decoration: InputDecoration(
                    labelText: "Weekend",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: logoController,
                  decoration: InputDecoration(
                    labelText: "Hospital Logo",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: ratingController,
                  decoration: InputDecoration(
                    labelText: "Hopital Rating",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: ambulanceController,
                  decoration: InputDecoration(
                    labelText: "Hopital Ambulance",
                  ),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                TextFormField(
                  controller: parkingController,
                  decoration: InputDecoration(
                    labelText: "Hopital Parking",
                  ),
                ),
                vpad10,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "No of ICU",
                  ),
                  controller: icuController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Not be empty";
                    }
                  },
                ),
                vpad10,
                ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
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
                        weekend: weekendController.value.text,
                        ambulance: ambulanceController.value.text,
                        email: emailController.value.text,
                        image: logoController.value.text,
                        numberofIcus: icuController.value.text,
                        parking: parkingController.value.text,
                        website: websiteController.value.text,
                        description: descriptionController.value.text,
                        ratings: double.parse(ratingController.value.text),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Adding information successfully')));
                      context.go(AppRoute.login);
                      }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill up the information form')));
                      }
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
