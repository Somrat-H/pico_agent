
import 'package:flutter/material.dart';

class DefultInputField extends StatelessWidget {
  final String fieldName;
  const DefultInputField({
    super.key,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
          labelText: fieldName,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}