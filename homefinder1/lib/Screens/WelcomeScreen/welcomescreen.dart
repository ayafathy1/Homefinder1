import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/SignIn/signin.dart';
import '../auth/Signup/signup.dart';

class Welcomescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('                      Welcome!',
        style: TextStyle(fontSize: 0, color: Colors.transparent)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
      body:SingleChildScrollView(
        child: Center(
          child: Column(
          children: [
            Image(image: AssetImage('lib/assets/images/Cream & Brown Minimal Home.png')),
            Row(
              children: [
                Text("  Discover" ,style: TextStyle(color: Color(0xff6C63FF),fontSize: 32,fontWeight: FontWeight.bold),),
                Text(" and Find Your " ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold , fontSize: 32),),
             ]
            ),
           Row(
             children: [
               Text("   Perfect " ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold , fontSize: 32),),
               Text("Dream House" , style: TextStyle(color: Color(0xff6C63FF),fontSize: 32,fontWeight: FontWeight.bold),),

             ],
           ),
           SizedBox(height: 20,),
           Text("Explore and locate your ideal dream home" ,style: TextStyle(color: Color(0xffA09695) ,fontSize: 15),),
            SizedBox(height: 30,),
            SizedBox(
              height: 70,
              width: 350,
              child: ElevatedButton(onPressed: (){
               Get.to((()=>  SignUp()),
                );
              },
                  child: Text("Sign up" , style: TextStyle(color: Colors.white , fontSize: 18,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(backgroundColor:Color(0xff6C63FF),
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20),
    ) ,
                ),
    ),
            ),
            SizedBox(height: 20,),

            SizedBox(
              height: 70,
              width: 350,
              child: ElevatedButton(onPressed: (){
             Get.to(() =>  SignIn(),
                );
              },
                child: Text("Sign in" , style: TextStyle(color: Colors.white , fontSize: 18,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(backgroundColor:Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ) ,
                ),
              ),
            ),

    ]),
        ),
      ));
  }


}