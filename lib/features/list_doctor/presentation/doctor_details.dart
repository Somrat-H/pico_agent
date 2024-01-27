import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../app_route.dart';
import '../../../common/constant.dart';
import '../application/model.dart';
part 'custom_top_bar.dart';

// ignore: must_be_immutable
class DoctorDetails extends StatelessWidget {
  String? drName;
  String? medialCollage;
  String? medicalName;
  String? passingYear;
  String? registrationNumber;

  DoctorDetails(
      {super.key,
      this.drName,
      this.medialCollage,
      this.medicalName,
      this.passingYear,
      this.registrationNumber});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = const TextTheme();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _CustomTopBar(colorScheme: colorScheme, textTheme: textTheme),
          vpad25,
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.teal.shade100,
              border: Border.all(
                color: Colors.teal,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                        'assets/person.jpg'), // Replace with the actual image asset path
                  ),
                  vpad8,
                  Row(
                    children: [
                      Text(
                        'Doctor Name : ${mainHospitalModel!.drList[i].drName}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      hpad10,
                      Image.asset("assets/verified.png"),
                    ],
                  ),
                  vpad8,
                  Text(
                    'About: ${mainHospitalModel!.drList[i].about}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Colors.black45),
                  ),
                  vpad15,
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(mainHospitalModel!.drList[i].dept),
                      )),
                  vpad15,
                  Row(
                    children: [
                      const Text(
                        'Passing Year : ',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                       mainHospitalModel!.drList[i].passingYear,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'MBBS Registration Number : ',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                       mainHospitalModel!.drList[i].registrationNumber,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Seen Paitent : ',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                       mainHospitalModel!.drList[i].totalSeenPatient,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
