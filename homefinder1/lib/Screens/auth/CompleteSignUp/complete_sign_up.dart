import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Upload%20Photo/upload_photo.dart';
import 'package:homefinder1/Screens/auth/CompleteSignUp/controller/complete_sign_up_controller.dart';
import 'package:homefinder1/Widget/custom_arrow_back.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';

import '../Signup/signup.dart';

class CompleteSignUp extends StatefulWidget{
  

  @override
  State<CompleteSignUp> createState() => _CompleteSignUpState();
}

class _CompleteSignUpState extends State<CompleteSignUp> {
  @override

  Widget build(BuildContext context) {
    return GetBuilder(
      init: CompleteSignUpController(),
        builder:( CompleteSignUpController controller){
          return Scaffold(
              appBar: AppBar(title: Text('                      Welcome!',
                  style: TextStyle(fontSize: 0, color: Colors.transparent)),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                  child: Center(
                      child: Form(
                        key: controller.formkey,
                        child: Column(
                            children: [
                              CustomArrowBack(),

                              Text("Fill in bio to get" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40),),
                              Row(
                                children: [
                                  Text("     started" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40),),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Text("  This data will be displayed in your account profile " , style: TextStyle(fontSize: 15),),
                              Row(children:[
                                Text("      for seccurity" , style: TextStyle(fontSize: 15),)
                              ] ),

                            CustomTextFieldWidget(Controller: controller.fisrtnameController, validator: controller.fisrtnameValidator, keyboardType: TextInputType.text,textfieldHint: "First Name", textfieldIcon:Icon(Icons.abc,color: Colors.transparent,), ispasswordField:false, obscureText: false, stextfieldIcon:Icon(Icons.abc,color: Colors.transparent,),),
                           // SizedBox(height: 2,),

                            CustomTextFieldWidget(Controller: controller.lastnameController, validator: controller.lastnameValidator, keyboardType: TextInputType.text,textfieldHint: "Last Name", textfieldIcon: Icon(Icons.abc,color: Colors.transparent,), ispasswordField:false, obscureText: false, stextfieldIcon: Icon(Icons.abc,color: Colors.transparent,),),
                              CustomTextFieldWidget(Controller: controller.genderController, validator: controller.genderValidator, keyboardType: TextInputType.text, textfieldHint: "Gender", textfieldIcon: Icon(Icons.abc,color: Colors.transparent,), ispasswordField: false, obscureText: false, stextfieldIcon:  Icon(Icons.abc,color: Colors.transparent,),),
                              CustomTextFieldWidget(Controller: controller.phoneController, validator: controller.phoneValidator, keyboardType: TextInputType.phone, textfieldHint: "Phone Number", textfieldIcon: Icon(Icons.abc,color: Colors.transparent,), ispasswordField: false, obscureText: false, stextfieldIcon: Icon(Icons.abc,color: Colors.transparent,),),

                              SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(onPressed: (){
                                  if (controller.formkey.currentState!.validate()) {
                                   Get.to(()=>  UploadPhoto(),
                                    );

                                  }
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

                            ]
                        ),
                      )

                  )
              ));
          
    }
          
    );


}}