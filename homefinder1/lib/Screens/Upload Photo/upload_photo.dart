import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Upload%20Preview/upload_preview.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';


class UploadPhoto extends StatelessWidget{
  const UploadPhoto({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('                      Welcome!',
        style: TextStyle(fontSize: 0, color: Colors.transparent)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          const CustomArrowBack(),
          const Text("Upload Your Photo" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
          const Row(
            children: [
              Text("     Profile" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),
            ],
          ),

          const SizedBox(height: 15,),
          const Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
          const Row(children:[
            Text("      for seccurity" , style: TextStyle(fontSize: 15),)
          ] ),
          const SizedBox(height: 50,),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "                        From Gallery",
                  fillColor: const Color(0xffF4F4F4),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xffF4F4F4),
                      width: 3,
                    ),
                  ),

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xff6C63FF),
                      width: 3,
                    )
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.red.shade600,
                      width: 3,
                    )
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.red.shade600,
                      width: 3,
                    )
                ),
              ))
          ),
          const SizedBox(height: 200,),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(onPressed: (){
             Get.to(() =>  const UploadPreview());
              }
            ,
              style: ElevatedButton.styleFrom(backgroundColor:const Color(0xff6C63FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ) ,
              ),
              child: const Row(
                children: [
                  Text("          Next" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Icon(Icons.navigate_next , size: 30,),
                ],
              ),
            ),
          ),
          TextButton(onPressed: (){}, child: const Text("skip now" , style: TextStyle(color: Color(0xff6C63FF)),))

        ],
      ),
    ),
  );
  }


}