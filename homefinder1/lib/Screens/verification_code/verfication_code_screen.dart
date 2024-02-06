import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/CompleteSignUp/complete_sign_up.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
class VerficationCode extends StatelessWidget{
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
          CustomArrowBack(),
          Text("Enter 4-digit", style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold) ,),
          Text("Verfication Code" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold)),
          
          SizedBox(height: 20,),
          Text("code send to your email code will expire in 01:30"),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              maxLength: 4,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                fillColor: Color(0xffF4F4F4),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Color(0xffF4F4F4),
                    width: 3,
              ),
            ),
          ),
            )
          ),
          SizedBox(height: 30,),
          Row(children: [
            SizedBox(width: 50,),
            Text("Didn't recieve a code?" ,style: TextStyle(fontSize: 20),),
            TextButton(onPressed: (){}, child:Text("Resend" , style: TextStyle(color: Color(0xff6C63FF) ,fontSize: 20),),)

          ],),

          SizedBox(height: 300,),

          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(onPressed: (){
              Get.to(() =>  CompleteSignUp(),
              );
            },
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


      ]),
    )));
  }

}