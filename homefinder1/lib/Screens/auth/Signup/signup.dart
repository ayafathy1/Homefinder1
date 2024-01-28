import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/verficationcode.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';
import 'package:homefinder1/Screens/auth/Signup/controller/signup_controller.dart';

class SignUp extends StatefulWidget{

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  bool rememberMe = false;

  void _onRememberMeChanged(bool? newValue) => setState(() {
    rememberMe = newValue?? true;

    if (rememberMe) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });


  @override
  Widget build(BuildContext context) {


  return GetBuilder(
      init : SignUpController(),
      builder: (SignUpController controller ){
      return   Scaffold(

        body: SafeArea(
          child: Container(
            color: Color(0xffFFFFFF),
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
            child: Center(
            child: Form(
            key: controller.formkey,
            child: Column(
            children: [
            Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
            Container(
            width: 250,
            child: Image.asset('lib/assets/images/logo-white.png',
            fit: BoxFit.contain,
            ),
            ),
            Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text("  Home Finder", style: TextStyle(color: Colors.black , fontSize: 22 , fontWeight: FontWeight.bold)),
            ),
            ],
            ),
            SizedBox(height: 5,),
            Row(
            children: [
            Text("     by creating a free account" , style: TextStyle(color: Color(0xff252525)),),
            ],
            ),

            CustomTextFieldWidget(
            Controller:controller.usernameController , validator:controller.usernameValidator , keyboardType: TextInputType.text, textfieldHint: "User Name", textfieldIcon: Icon(Icons.person), ispasswordField: false, obscureText: false),
            CustomTextFieldWidget(
                Controller: controller.emailaddressController, validator: controller.emailValidator, keyboardType: TextInputType.emailAddress, textfieldHint:"EmailAddress", textfieldIcon: Icon(Icons.email), ispasswordField: false, obscureText: false),

            CustomTextFieldWidget(Controller: controller.passwordController, validator: controller.passwordValidator, keyboardType: TextInputType.visiblePassword, textfieldHint: "Password", textfieldIcon: Icon(Icons.lock), ispasswordField: true, obscureText: true),
            CustomTextFieldWidget(Controller: controller.passwordController, validator:controller.passwordValidator, keyboardType: TextInputType.visiblePassword, textfieldHint: "Confirm Password", textfieldIcon:Icon(Icons.lock), ispasswordField:true, obscureText: true),
            Row(children: [

            Checkbox(
            value: rememberMe,
            onChanged: _onRememberMeChanged
            ),
            Text("by checking the box you agree to our" , style: TextStyle(fontSize: 12),),
            Text("Terms" , style: TextStyle(color: Color(0xff6C63FF)),),
            Text("and"),
            Text("Conditions" , style: TextStyle(color: Color(0xff6C63FF)),),

            ]
            ),


            SizedBox(
            height: 70,
            width: 350,
            child: ElevatedButton(onPressed: (){

            if (controller.formkey.currentState!.validate()) {
             Get.to(() =>  VerficationCode(),
              );

            }
            }



            ,child: Row(
            children: [
            Text("                       Next" , style: TextStyle(color: Colors.white , fontSize: 20,fontWeight: FontWeight.bold),),
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
            SizedBox(height: 30,),
            SizedBox(
            height: 70,
            width: 350,
            child: ElevatedButton(onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  SignUp()),
            );
            },
            child: Text("Sign up with Google" , style: TextStyle(color: Colors.black , fontSize: 18,fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(backgroundColor:Color(0xffF4F4F4),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            ) ,
            ),
            ),
            ),
            SizedBox(height: 30,),
            Row(children: [
            Text("                               Already a member?"),
            Text("Log In" , style: TextStyle(color: Color(0xff6C63FF)),)
            ],)
            ,
            ],
            ),
            ),


      )),
          ),
        ) );
  });
  }
}