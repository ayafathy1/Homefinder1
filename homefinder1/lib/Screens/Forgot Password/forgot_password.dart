import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Forgot%20Password/controller/forgot_password_controller.dart';
import 'package:homefinder1/Screens/Succes%20Notification/success_notification.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';

import '../../services/auth_service.dart';

class ForgotPassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ForgotPasswordController(),
        builder:( ForgotPasswordController controller)
    {
      return Scaffold(
        appBar: AppBar(title: Text('                      Welcome!',
            style: TextStyle(fontSize: 0, color: Colors.transparent)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Forgot Password?" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              ),
              SizedBox(height: 30,),
              Center(child: Image(image: AssetImage('lib/assets/images/Forgot password-amico 1.png'))),
              SizedBox(height: 20,),
              Text("Dont Worry." ,style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              Text("Enter Your Email To Reset" ,style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              Text("your password", style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 30),),
              SizedBox(height: 70,),

              CustomTextFieldWidget(Controller: controller.emailaddressController, validator: controller.emailValidator, keyboardType: TextInputType.emailAddress, textfieldHint: "Enter Your Email", textfieldIcon: Image(image: AssetImage("lib/assets/images/MessageIcon.png"),), ispasswordField: false, obscureText: false, suffixIcon: Icon(Icons.abc,color: Colors.transparent,),),

              SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(onPressed: (){
                  AuthServices.forgetPassword(controller.emailaddressController.text);
                  Get.to(
                          () =>  SuccessNotification());
                }
                  ,
                  child: Row(
                    children: [
                      Text("           Send" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),

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
      );
    }



    );}

}