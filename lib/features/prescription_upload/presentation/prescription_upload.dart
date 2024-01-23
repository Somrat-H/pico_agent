import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../app_route.dart';
import '../../../common/constant.dart';
part 'widget.dart';

class PrescriptionUpload extends StatelessWidget {
  const PrescriptionUpload({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = const TextTheme();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _TopBar(colorScheme: colorScheme, textTheme: textTheme),
          vpad25,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.teal.shade100),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/clipboard.png"),
                        vpad20,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add file upload logic here
                              print('File Upload Button Pressed');
                            },
                            child: Text('Upload Prescription'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
