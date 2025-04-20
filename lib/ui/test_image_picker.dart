import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TestImagePicker extends StatefulWidget {
  const TestImagePicker({super.key});

  @override
  State<TestImagePicker> createState() => _TestImagePickerState();
}

class _TestImagePickerState extends State<TestImagePicker> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final XFile? xFile = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );
              setState(() {
                file = File(xFile!.path);
              });
              // print(file?.existsSync().toString() + file.path);
            },
            child: Text('Choose image'),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: Image.file(file ?? File(''), fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
