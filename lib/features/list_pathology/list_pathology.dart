import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/model/doctor_model.dart';
import 'package:pico_agent/model/hospital_model.dart';

import '../../../app_route.dart';
import '../../../common/constant.dart';
part 'widget.dart';

class ListPathology extends StatefulWidget {
  const ListPathology({super.key});

  @override
  State<ListPathology> createState() => _ListPathologyState();
}

class _ListPathologyState extends State<ListPathology> {
  HospitalModel? hospitalModel;
  // List<DoctorModel> doctorList = [];

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
              FutureBuilder<HospitalModel?>(
                  future: AuthService.getHospitaldata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.pathelogyList.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                tileColor: Colors.teal.shade100,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(snapshot
                                            .data!.pathelogyList[index].name),
                                        hpad10,
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Image.asset(
                                              "assets/verified.png"),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Cost : ${snapshot.data!.pathelogyList[index].cost} Taka",
                                      style: textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                        "Time : ${snapshot.data!.pathelogyList[index].timing}"),
                                    hpad10,
                                    Text("||"),
                                    hpad10,
                                    Text(
                                        "Schedule: ${snapshot.data!.pathelogyList[index].schedule}"),
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // doctorList.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                    )),
                                leading: Image.asset("assets/pathology.png"),
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
