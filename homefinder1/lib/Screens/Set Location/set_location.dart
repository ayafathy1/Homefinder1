import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Sign%20up%20Sucess%20Notification/sign_up_sucess_notification.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';

class SetLocation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('                      Welcome!',
        style: TextStyle(fontSize: 0, color: Colors.transparent)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
    body: SingleChildScrollView(
        child: Column(
          children: [
           CustomArrowBack(),
            Text("Set Your Location" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35),),


            SizedBox(height: 15,),
            Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
            Row(children:[
              Text("      for seccurity" , style: TextStyle(fontSize: 15),),
            ] ),
            SizedBox(height: 70,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffDEE4E7),
              ),
              height: 200,
              width: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.location_on ,color: Color(0xff6C63FF),),
                        Text("  Your Location"),
                      ],
                    ),
                  ),
                  SizedBox(height: 80,),
                  SizedBox(
                    height: 70,
                    width: 280,
                    child: ElevatedButton(onPressed: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  SignIn()),
                      //);
                    },
                      child: Text("Set Location" , style: TextStyle(color: Colors.black , fontSize: 18,fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(backgroundColor:Color(0xffF6F6F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ) ,
                      ),
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: 200,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
                Get.to(()=>  SignUpSucessNotification());
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
          ],
        ),
    ),
    )
    ;
  }

}