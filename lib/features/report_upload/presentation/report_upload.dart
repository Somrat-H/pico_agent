import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dart:html' as html;

import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker_web/image_picker_web.dart';
import '../../../app_route.dart';
import '../../../common/constant.dart';
import 'package:image_picker/image_picker.dart';
part 'widget.dart';

class ReportUpload extends StatefulWidget {
  const ReportUpload({super.key});

  @override
  State<ReportUpload> createState() => _ReportUploadState();
}

class _ReportUploadState extends State<ReportUpload> {
  File? _pickedImage;

  List<File> selectedImages = [];

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text("Uploading.......")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

// Function to upload images and store paths
  Future<void> uploadImagesAndStorePaths() async {
    for (final imageFile in selectedImages) {
      final fileName = imageFile.path.split('/').last;
      final reference =
          FirebaseStorage.instance.ref().child('images/$fileName');
      final uploadTask = reference.putFile(imageFile);

      final snapshot = await uploadTask;
      final imagePath = snapshot.ref.fullPath; // Store this path in your list

      print(imagePath);
    }
  }

  Uint8List webImage = Uint8List(8);

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      final List<XFile> _pickedImage = await _picker.pickMultiImage();
      if (_pickedImage != null) {
        // var f = await image.readAsBytes();
        _pickedImage.forEach((e) {
          selectedImages.add(e.path as File);
        });
        setState(() {});
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = const TextTheme();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _TopBar(colorScheme: colorScheme, textTheme: textTheme),
          vpad20,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
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
                        Image.asset("assets/file_upload.png"),
                        vpad20,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add file upload logic here
                              print('File Upload Button Pressed');
                              _pickImage();
                            },
                            child: Text('Select Image'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: selectedImages.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(selectedImages[index]),
                    );
                  }),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showLoaderDialog(context);
                uploadImagesAndStorePaths();
                // Navigator.pop(context);
                context.go(AppRoute.reportUpload);
              },
              child: Text("Upload")),
        ],
      ),
    );
  }
}
