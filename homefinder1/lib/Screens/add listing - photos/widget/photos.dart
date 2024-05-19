import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample1 extends StatefulWidget {
  @override
  _ImagePickerExampleState1 createState() => _ImagePickerExampleState1();
}

class _ImagePickerExampleState1 extends State<ImagePickerExample1> {
  List<Uint8List> _images = [];

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
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImagesFromGallery();
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: Text('Camera'),
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
              onPressed: _showImagePickerDialog,
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}


