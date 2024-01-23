import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_route.dart';
import '../../../common/constant.dart';
import '../application/appointment_model.dart';
part 'widgets.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _TopBar(colorScheme: colorScheme, textTheme: textTheme),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: appointmentList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: Colors.teal.shade100,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Paitent Name : "),
                                Text(appointmentList[index].patient.name),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Age : " +
                                    appointmentList[index]
                                        .patient
                                        .age
                                        .toString()),
                                hpad15,
                                Text("Paitent Phone : " +
                                    appointmentList[index]
                                        .patient
                                        .phoneNumber
                                        .toString()),
                                hpad10,
                                Text("Date & Time : " +
                                    appointmentList[index]
                                        .appointmentDateTime
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Doctor Name : "),
                                Text(appointmentList[index].doctor.name),
                              ],
                            ),
                            Text(
                              appointmentList[index].doctor.specialization,
                              style: textTheme.titleSmall,
                            ),
                          ],
                        ),
                        trailing: Image.asset("assets/verify.png"),
                        leading: Image.asset("assets/doctor-appointment.png"),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
