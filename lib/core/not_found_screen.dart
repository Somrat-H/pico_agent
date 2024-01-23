import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_route.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Page Not Found"),
            ElevatedButton(
                onPressed: () {
                  context.go(AppRoute.home);
                },
                child: const Text("Go Back To Home"))
          ],
        ),
      ),
    );
  }
}
