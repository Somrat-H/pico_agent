import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonName;
  const CustomRoundButton({
    super.key,
    required this.onTap, required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.teal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onTap,
      child:  Text(buttonName),
    );
  }
}