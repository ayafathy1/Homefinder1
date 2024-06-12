import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Set%20Location/set_location.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


import '../../utilities/memory.dart';

class UploadPreview extends StatelessWidget{
  final Uint8List imageBytes;

  UploadPreview({required this.imageBytes});
  Future<void> uploadImage(BuildContext context, Uint8List imageBytes) async {
    // Convert the image bytes to a file
    final tempDir = await getTemporaryDirectory();
    final file = await new File('${tempDir.path}/image.jpg').create();
    await file.writeAsBytes(imageBytes);

    // Retrieve authorization token
    String? token = await Get.find<StorageService>().getToken;
    if (token == null) {
      print('Authorization token is null.');
      return;
    }

    // Prepare the upload request
    var request = http.MultipartRequest('POST', Uri.parse('https://home-finder-back-end-i7ca.onrender.com/api/v1/user/upload-image'));

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers['Authorization'] = token;

    try {
      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        print('Upload successful: $jsonResponse');
        Get.to(()=>SetLocation());
      } else {
        // If the status code is not success, show the error in CoolAlert
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title:"Error",
          text: response.reasonPhrase,
        );
      }
    } catch (e) {
      // If an exception occurs, show the error in CoolAlert
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: "$e",
      );
      print('Error occurred while uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: Get.height*0.12,
          leading: CustomArrowBack(),
          leadingWidth: Get.width*0.2,
    ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Upload Your Photo" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
            Row(
              children: [
                Text("Profile" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
              ],
            ),

            SizedBox(height: 15,),
            Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
            Row(children:[
              Text("   for seccurity" , style: TextStyle(fontSize: 15),)
            ] ),
            SizedBox(height: 20,),
            imageBytes.isEmpty
                ? Text('No image selected.')
                : Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),                                  width: Get.width * 0.67,
                                  height: Get.height * 0.32,
                                  decoration: BoxDecoration(


                                  ),
                                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(Get.width * 0.4), // نصف عرض الـ Container لجعل الصورة دائرية
                  child: Center(
                    child: Image.memory(
                      imageBytes,
                      fit: BoxFit.fill,
                      width: Get.width * 0.67,
                      height: Get.height * 0.32,
                    ),
                  ),
                                  ),
                                ),
                ),
            SizedBox(height:100 ,),

            Center(
              child: Container(
                height: Get.height*0.18,
                width: 200,
      padding: EdgeInsets.only(top: 45,bottom: 45),
                child: ElevatedButton(onPressed: (){
                 uploadImage(context,imageBytes);
                }
                  ,
                  child: Row(
                    children: [
                      Text("          Next" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Icon(Icons.navigate_next , size: 30,),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor:Color(0xff6C63FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ) ,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }

}