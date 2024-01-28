import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homefinder1/Screens/Forgot%20Password/forgot_password.dart';

class SignUpSucessNotification extends StatelessWidget{
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
              SizedBox(height: 80,),
               Image(image: AssetImage('lib/assets/images/Congrats.png')),
              SizedBox(height: 30,),
              Text("Congrats!" , style: TextStyle(color: Color(0xff9292FD), fontSize: 40),),
              SizedBox(height: 15,),
              Text("Your Profile Is Ready To Use" , style: TextStyle(color: Colors.black , fontSize: 28 , fontWeight: FontWeight.bold)  ,),
              SizedBox(height: 200,),
              SizedBox(
                height: 50,
                width: 170,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ForgotPassword()));
                }
                  ,
                  child: Row(
                    children: [
                      Text("       Start" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),

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