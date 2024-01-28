import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessNotification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('                      Welcome!',
         style: TextStyle(fontSize: 0, color: Colors.transparent)),
       backgroundColor: Colors.transparent,
       elevation: 0,
     ),
     body: SingleChildScrollView(
       child: Center(
         child: Column(
           children: [
           SizedBox(height: 20,),
             Image(image: AssetImage('lib/assets/images/Checking boxes-rafiki 1.png')),
             SizedBox(height: 15,),
             Row(
               children: [
                 Text("         Check your mail" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30) ),
                 Image(image: AssetImage('lib/assets/images/Check.png')),
               ],
             ),
             SizedBox(height: 40,),
             SizedBox(
               height: 50,
               width: 130,
               child: ElevatedButton(onPressed: (){
                 //Navigate to success notification screen
                Get.to(() =>  SuccessNotification());
               }
                 ,
                 child: Row(
                   children: [
                     Text("       ok" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),

                   ],
                 ),
                 style: ElevatedButton.styleFrom(backgroundColor:Color(0xff6C63FF),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(28),
                   ) ,
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
   );
  }

}