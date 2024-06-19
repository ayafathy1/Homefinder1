// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample1 extends StatefulWidget {
  const ImagePickerExample1({super.key});

  @override
  _ImagePickerExampleState1 createState() => _ImagePickerExampleState1();
}

class _ImagePickerExampleState1 extends State<ImagePickerExample1> {
  final List<Uint8List> _images = [];

  Future<void> _pickImagesFromGallery() async {
    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();

    for (var pickedFile in pickedFiles) {
      Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _images.add(bytes);
      });
    }
    }

  Future<void> _pickImageFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _images.add(bytes);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _showImagePickerDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImagesFromGallery();
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImageFromCamera();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _images.isEmpty
                ? const Text('No images selected.')
                : Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(_images.length, (index) {
                  return Image.memory(_images[index]);
                }),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _showImagePickerDialog,
              child: const Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}


