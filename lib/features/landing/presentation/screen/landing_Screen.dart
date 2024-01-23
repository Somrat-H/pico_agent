import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class LandingScreen extends StatefulWidget {
  final Widget child;
  const LandingScreen({super.key, required this.child});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Pico Agent"),
        centerTitle: true,
      ),
      body: Row(children: [
        const CustomDrawer(),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: widget.child)),
      ]),
    );
  }
}
