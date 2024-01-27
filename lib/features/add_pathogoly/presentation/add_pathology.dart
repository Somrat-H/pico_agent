import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pico_agent/features/add_pathogoly/application/repository.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/model/doctor_model.dart';
import 'package:pico_agent/model/hospital_model.dart';
import '../../../app_route.dart';
import '../../../common/constant.dart';
part 'widget.dart';
part 'rounded_text_field.dart';

class AddPathology extends StatefulWidget {
  const AddPathology({super.key});

  @override
  State<AddPathology> createState() => _AddPathologyState();
}

class _AddPathologyState extends State<AddPathology> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController timingController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();

  void clear() {
    nameController.clear();
    costController.clear();
    scheduleController.clear();
    timingController.clear();
    ratingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
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
                            child: Form(
                              key: _formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(
                                      "assets/pathology_page.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  vpad20,
                                  _RoundedTextField(
                                    keyboardType: TextInputType.text,
                                    controller: nameController,
                                    hintText: 'Pathogoly Test Name',
                                  ),
                                  vpad15,
                                  _RoundedTextField(
                                    keyboardType: TextInputType.text,
                                    controller: costController,
                                    hintText: 'Price',
                                  ),
                                  vpad15,
                                  _RoundedTextField(
                                    controller: scheduleController,
                                    hintText: 'Schedule',
                                    keyboardType: TextInputType.phone,
                                  ),
                                  vpad15,
                                  _RoundedTextField(
                                    controller: timingController,
                                    hintText: 'Time',
                                    keyboardType: TextInputType.number,
                                  ),
                                  vpad15,
                                  _RoundedTextField(
                                    keyboardType: TextInputType.number,
                                    controller: ratingController,
                                    hintText: 'Rating',
                                  ),
                                  vpad15,
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add form submission logic here
                                      if (_formKey.currentState!.validate()) {
                                        mainHospitalModel?.pathelogyList.add(
                                            Pathelogy(
                                                cost: costController.value.text,
                                                name: nameController.value.text,
                                                rating:
                                                    ratingController.value.text,
                                                schedule: scheduleController
                                                    .value.text,
                                                timing: timingController
                                                    .value.text));

                                        AddPathologyRepository.setPathologyData(
                                            mainHospitalModel!);
                                        clear();

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Pathogoy Data  Added Successfully')));
                                        context.go(AppRoute.addPathology);
                                        // setState(() {});
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Please fill up the information form')));
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ],
                              ),
                            ),
                          ))))
            ])));
  }
}
