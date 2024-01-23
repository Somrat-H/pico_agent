import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../app_route.dart';
import '../../../common/constant.dart';
import '../applicaion/cancel_appointmet_model.dart';
part 'widget.dart';

class CancelAppointmet extends StatelessWidget {
  const CancelAppointmet({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = const TextTheme();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _TopBar(colorScheme: colorScheme, textTheme: textTheme),
              hpad20,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cancledAppoinmentsList.length,
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
                                const Text("Doctor Name : "),
                                Text(cancledAppoinmentsList[index].doctor.name),
                              ],
                            ),
                            Text(
                              cancledAppoinmentsList[index]
                                  .doctor
                                  .specialization,
                              style: textTheme.titleSmall,
                            ),
                            Row(
                              children: [
                                const Text("Paitent Name : "),
                                Text(
                                    cancledAppoinmentsList[index].patient.name),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                                "Age : ${cancledAppoinmentsList[index].patient.age}"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Paitent Phone : " +
                                cancledAppoinmentsList[index]
                                    .patient
                                    .phoneNumber
                                    .toString()),
                            hpad10,
                            Text("Date & Time : " +
                                cancledAppoinmentsList[index]
                                    .appointmentDateTime
                                    .toString()),
                          ],
                        ),
                        trailing: Image.asset("assets/cancelled.png"),
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
