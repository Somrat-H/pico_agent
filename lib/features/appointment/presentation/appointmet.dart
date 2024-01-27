import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/model/hospital_model.dart';

import '../../../app_route.dart';
import '../../../common/constant.dart';
import '../application/appointment_model.dart';
part 'widgets.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
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
              FutureBuilder<HospitalModel?>(
                  future: AuthService.getHospitaldata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              snapshot.data!.confirmAppointmentList.length,
                          itemBuilder: (_, index) {
                            print(snapshot.data!.confirmAppointmentList.length
                                .toString());
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
                                        Text(snapshot
                                            .data!
                                            .confirmAppointmentList[index]
                                            .paitientName),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Phone: " +
                                            snapshot
                                                .data!
                                                .confirmAppointmentList[index]
                                                .paitientPhone),
                                        hpad15,
                                        Text("Schedule: " +
                                            snapshot
                                                .data!
                                                .confirmAppointmentList[index]
                                                .schedule),
                                        hpad10,
                                        Text("Time : " +
                                            snapshot
                                                .data!
                                                .confirmAppointmentList[index]
                                                .timeSlot),
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
                                        Text(snapshot
                                            .data!
                                            .confirmAppointmentList[index]
                                            .drName),
                                      ],
                                    ),
                                    // Text(
                                    //   appointmentList[index].doctor.specialization,
                                    //   style: textTheme.titleSmall,
                                    // ),
                                  ],
                                ),
                                trailing: Image.asset("assets/verify.png"),
                                leading: Image.asset(
                                    "assets/doctor-appointment.png"),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
