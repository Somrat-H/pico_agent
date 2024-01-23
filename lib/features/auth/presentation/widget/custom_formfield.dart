// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String labelText;
  CustomFormField({super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
                        controller: controller,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: labelText,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
  }
}