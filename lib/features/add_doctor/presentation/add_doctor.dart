import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_route.dart';
import '../../../common/constant.dart';
import '../../list_doctor/application/model.dart';
part 'widgets.dart';
part 'rounded_text_field.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final TextEditingController doctorNameController = TextEditingController();
    final TextEditingController specializationController =
        TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController hospitalNameController =
        TextEditingController();
          final TextEditingController passingYearController =
        TextEditingController();
          final TextEditingController medicalCollageController =
        TextEditingController();
          final TextEditingController registrationNumerController =
        TextEditingController();
        

    void dispose() {
      doctorNameController.dispose();
      specializationController.dispose();
      phoneNumberController.dispose();
      hospitalNameController.dispose();
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _TopBar(textTheme: textTheme, colorScheme: colorScheme),
            vpad10,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            "assets/medical-team_1.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        _RoundedTextField(
                          keyboardType: TextInputType.text,
                          controller: doctorNameController,
                          hintText: 'Doctor Name',
                        ),
                        vpad15,
                        _RoundedTextField(
                          keyboardType: TextInputType.text,
                          controller: specializationController,
                          hintText: 'Specialization',
                        ),
                        vpad15,
                        _RoundedTextField(
                          controller: phoneNumberController,
                          hintText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                        ),
                        vpad15,
                        _RoundedTextField(
                          keyboardType: TextInputType.text,
                          controller: passingYearController,
                          hintText: 'Write passing year',
                        ),
                        vpad15,
                        _RoundedTextField(
                          keyboardType: TextInputType.text,
                          controller: registrationNumerController,
                          hintText: 'MBBS Regitration Number',
                        ),
                        vpad15,
                        _RoundedTextField(
                          keyboardType: TextInputType.text,
                          controller: medicalCollageController,
                          hintText: 'Passed Medical Collage Name',
                        ),
                        vpad15,
                        _RoundedTextField(
                          keyboardType: TextInputType.text,
                          controller: hospitalNameController,
                          hintText: 'Hospital Name',
                        ),
                        vpad15,
                        ElevatedButton(
                          onPressed: () {
                            // Add form submission logic here
                            setState(() {
                              doctorList.add(Doctor(
                                  doctorNameController.text,
                                  specializationController.text,
                                  phoneNumberController.text,
                                  hospitalNameController.text,
                                  medicalCollageController.text,
                                  passingYearController.text,
                                  registrationNumerController.text
                                  ));
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Doctor Added Successfully')));
                            print('Doctor Name: ${doctorNameController.text}');
                            print(
                                'Specialization: ${specializationController.text}');
                            print(
                                'Phone Number: ${phoneNumberController.text}');
                            print(
                                'Hospital Name: ${hospitalNameController.text}');

                            doctorNameController.clear();
                            specializationController.clear();
                            phoneNumberController.clear();
                            hospitalNameController.clear();
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
