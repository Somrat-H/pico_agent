import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pico_agent/features/auth/application/auth_serviece.dart';
import 'package:pico_agent/features/auth/presentation/screen/login_screen.dart';

import '../../../../app_route.dart';
import '../../../auth/application/user.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Builder(builder: (context) {
        return Column(
          children: [
            ///for blank space
            // const Expanded(child: SizedBox()),
            Expanded(
              flex: 10,
              child: ListView(
                children: [
                  // Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.home),
                      leading: Image.asset("assets/home.png"),
                      title: const Text("Home"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.appoinments),
                      leading: Image.asset("assets/appointment.png"),
                      title: const Text("Apoinments"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.cancledAppoinments),
                      leading: Image.asset("assets/cancel_appointment.png"),
                      title: const Text("Cancled Appoinments"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.addDoctor),
                      leading: Image.asset("assets/add.png"),
                      title: const Text("Add Doctor"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.addPathology),
                      leading: Image.asset("assets/Pathology.png"),
                      title: const Text("Add Pathology"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.listDoctor),
                      leading: Image.asset("assets/medical.png"),
                      title: const Text("Doctor List"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.listPathology),
                      leading: Image.asset("assets/pathology_page.png"),
                      title: const Text("Pathology List"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.reportUpload),
                      leading: Image.asset("assets/upload.png"),
                      title: const Text("Report Upload"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () => context.go(AppRoute.prescriptionUpload),
                      leading: Image.asset("assets/upload.png"),
                      title: const Text("Prescription Upload"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                title: Text(User.name),
                subtitle: Text(User.role),
                trailing: IconButton(
                    onPressed: () {
                      AuthService.logout();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    icon: const Icon(Icons.logout)),
                leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20,
                    backgroundImage: AssetImage('assets/person.jpg')),
                tileColor: Colors.teal.shade100,
              ),
            ),
          ],
        );
      }),
    );
  }
}
