import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/SignIn/controller/signin_controller.dart';
import 'package:homefinder1/Screens/auth/Signup/signup.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';

import '../../verficationcode.dart';
class SignIn  extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
      init:  SignInController(),
        builder: (SignInController controller){
          return Scaffold(
            
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

                            SizedBox(height: 40,),
                            Text(" sign in to acess your account"),
                            CustomTextFieldWidget(Controller: controller.emailaddressController, validator: controller.emailValidator, keyboardType:TextInputType.emailAddress, textfieldHint: "Enter Your EmailAddress", textfieldIcon: Image(image: AssetImage("lib/assets/images/MessageIcon.png"),), ispasswordField:false, obscureText:false, suffixIcon: Icon(Icons.abc,color: Colors.transparent,),),
                            CustomTextFieldWidget(Controller: controller.passwordController, validator: controller.passwordValidator, keyboardType: TextInputType.visiblePassword, textfieldHint: "Enter Your Password", textfieldIcon:Image(image: AssetImage("lib/assets/images/LockIcon.png"),), ispasswordField: true, obscureText: true, suffixIcon:Image(image: AssetImage("lib/assets/images/Eye.png"),),),

                            Row(
                              children: [
                                Checkbox(
                                    value: rememberMe,
                                    onChanged: _onRememberMeChanged
                                ),
                                Text("Remember Me"),
                                SizedBox(width: 110,),
                                TextButton(onPressed: (){},
                                  child: Text("Forget Password?", style: TextStyle(color: Color(0xff6C63FF)),), ),


                              ],
                            ),

                            SizedBox(height: 20,),

                            SizedBox(
                              height: 70,
                              width: 350,
                              child: CustomElevatedButtonWidget(text: "Sign in", onPressed: (){

                                if (controller.formkey.currentState!.validate()) {
                                 Get.to(() =>  VerficationCode(),
                                  );

                                }
                              }, textStyle: TextStyle(color: Colors.white , fontSize: 18,fontWeight: FontWeight.bold),
                                  style: ElevatedButton.styleFrom(backgroundColor:Color(0xff6C63FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ) ,
                                  ),)
                            ),

                            SizedBox(height: 40,),

                            Text("-------------------------------or-----------------------------------"),
                            SizedBox(height: 40,),

                            SizedBox(
                              height: 70,
                              width: 350,
                              child: ElevatedButton(onPressed: (){
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) =>  SignUp()),
                                // );
                              },
                                child: Text("Sign in with Google" , style: TextStyle(color: Colors.black , fontSize: 18,fontWeight: FontWeight.bold),),
                                style: ElevatedButton.styleFrom(backgroundColor:Color(0xffF4F4F4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ) ,
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),
                            Row(children: [
                              Center(child: Text("                              New Member?")),
                              TextButton(onPressed: (){Get.to(()=>SignUp());}, child:Text("Register Now" , style: TextStyle(color: Color(0xff6C63FF)),) )

                            ],)

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        }


    );
  }
}