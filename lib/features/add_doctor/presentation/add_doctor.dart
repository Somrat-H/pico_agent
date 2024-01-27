import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/model/doctor_model.dart';
import '../../../app_route.dart';
import '../../../common/constant.dart';
part 'widgets.dart';
part 'rounded_text_field.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  final _formKey = GlobalKey<FormState>();
  List<String> ourAvailableSlot = [
    "9am - 11am",
    "11am - 1pm",
    "3pm - 5pm",
    "5pm - 7pm",
    "5pm - 7pm",
    "7pm - 9pm",
    "9pm - 10pm",
  ];
  final List<String> ourAvailableSchedule = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];

  List<String> tempSlot = [];
  List<String> tempSchedule = [];

  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController deptController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController seenPaitentController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController feeController = TextEditingController();

  final TextEditingController passingYearController = TextEditingController();

  final TextEditingController registrationNumerController =
      TextEditingController();
  void clear() {
    doctorNameController.clear();
    deptController.clear();
    imageController.clear();
    expController.clear();
    aboutController.clear();
    seenPaitentController.clear();
    ratingController.clear();
    feeController.clear();
    passingYearController.clear();
    registrationNumerController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            controller: imageController,
                            hintText: 'Image',
                          ),
                          vpad15,
                          _RoundedTextField(
                            controller: deptController,
                            hintText: 'Department',
                            keyboardType: TextInputType.phone,
                          ),
                          vpad15,
                          _RoundedTextField(
                            controller: expController,
                            hintText: 'Experince',
                            keyboardType: TextInputType.number,
                          ),
                          vpad15,
                          _RoundedTextField(
                            keyboardType: TextInputType.number,
                            controller: passingYearController,
                            hintText: 'Write passing year',
                          ),
                          vpad15,
                          _RoundedTextField(
                            keyboardType: TextInputType.number,
                            controller: registrationNumerController,
                            hintText: 'MBBS Regitration Number',
                          ),
                          vpad15,
                          _RoundedTextField(
                            keyboardType: TextInputType.text,
                            controller: aboutController,
                            hintText: 'About',
                          ),
                          vpad15,
                          _RoundedTextField(
                            keyboardType: TextInputType.number,
                            controller: seenPaitentController,
                            hintText: 'Seen Paitent Numner',
                          ),
                          vpad15,
                          _RoundedTextField(
                            keyboardType: TextInputType.number,
                            controller: ratingController,
                            hintText: 'Rating',
                          ),
                          vpad15,
                          _RoundedTextField(
                            keyboardType: TextInputType.number,
                            controller: feeController,
                            hintText: 'Fee',
                          ),
                          vpad8,
                          Text("Available Time"),
                          vpad8,
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ourAvailableSlot.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (tempSlot.contains(
                                              ourAvailableSlot[index])) {
                                            tempSlot.remove(
                                                ourAvailableSlot[index]);
                                          } else {
                                            tempSlot
                                                .add(ourAvailableSlot[index]);
                                          }
                                        });
                                      },
                                      child: SizedBox(
                                        width: 100,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: tempSlot.contains(
                                                    ourAvailableSlot[index])
                                                ? Colors.green
                                                : Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                              child: Text(
                                                  ourAvailableSlot[index])),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          vpad10,
                          vpad8,
                          Text("Available Day's"),
                          vpad8,
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ourAvailableSchedule.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (tempSchedule.contains(
                                              ourAvailableSchedule[index])) {
                                            tempSchedule.remove(
                                                ourAvailableSchedule[index]);
                                          } else {
                                            tempSchedule.add(
                                                ourAvailableSchedule[index]);
                                          }
                                        });
                                      },
                                      child: SizedBox(
                                        width: 100,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: tempSchedule.contains(
                                                    ourAvailableSchedule[index])
                                                ? Colors.green
                                                : Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                              child: Text(
                                                  ourAvailableSchedule[index])),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add form submission logic here
                if (_formKey.currentState!.validate()) {
                  mainHospitalModel?.drList.add(DoctorModel(
                      id: registrationNumerController.value.text,
                      about: aboutController.value.text,
                      availableSlot: tempSlot,
                      dept: deptController.value.text,
                      passingYear: passingYearController.value.text,
                      registrationNumber:
                          registrationNumerController.value.text,
                      drImage: imageController.value.text,
                      drName: doctorNameController.value.text,
                      experince: expController.value.text,
                      rating: ratingController.value.text,
                      totalSeenPatient: seenPaitentController.value.text,
                      fee: feeController.value.text,
                      schedule: tempSchedule));

                  AuthService.setDoctorData(mainHospitalModel!);
                  clear();

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Doctor Added Successfully')));
                  context.go(AppRoute.addDoctor);
                  // setState(() {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill up the information form')));
                }
                tempSchedule.clear();
                tempSlot.clear();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
