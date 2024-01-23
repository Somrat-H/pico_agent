import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



import '../../../../app_route.dart';
import '../../../auth/application/user.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
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
              onTap: () => context.go(AppRoute.listDoctor),
              leading: Image.asset("assets/medical.png"),
              title: const Text("Doctor List"),
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

          ///for blank space
          const Expanded(child: SizedBox()),

          ListTile(
            title: Text(User.name),
            subtitle: Text(User.role),
            trailing:
                const CircleAvatar(backgroundColor: Colors.green, radius: 8),
            leading: const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 20,
                backgroundImage: AssetImage('assets/person.jpg')),
            tileColor: Colors.teal.shade100,
          ),
        ],
      ),
    );
  }
}
