import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  List<Uint8List> _images = [];

  // Function to pick images from gallery
  Future<void> _pickImagesFromGallery() async {
    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles != null) {
      for (var pickedFile in pickedFiles) {
        Uint8List bytes = await pickedFile.readAsBytes();
        setState(() {
          _images.add(bytes);
        });
      }
    } else {
      print('No images selected.');
    }
  }

  // Function to pick image from camera
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _images.isEmpty
                ? Text('No images selected.')
                : Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(_images.length, (index) {
                  return Image.memory(_images[index]);
                }),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _pickImagesFromGallery,
              child: Text('Pick Images from Gallery'),
            ),
            ElevatedButton(
              onPressed: _pickImageFromCamera,
              child: Text('Take a Picture'),
            ),
          ],
        ),
      ),
    );
  }
}