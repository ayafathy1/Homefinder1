import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/SignIn/controller/signin_controller.dart';
import 'package:homefinder1/Screens/auth/Signup/signup.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';
import 'package:homefinder1/utilities/constants.dart';

<<<<<<< Updated upstream
import '../../verficationcode.dart';
class SignIn  extends StatefulWidget{
=======
import '../../../services/auth_service.dart';
import '../../verification_code/verfication_code_screen.dart';

class SignIn extends StatefulWidget {
>>>>>>> Stashed changes
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue ?? true;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignInController(),
        builder: (SignInController controller) {
          return Scaffold(
              body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xffFFFFFF),
                width: Get.width,
                height: Get.height,
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
                              child: Image.asset(
                                'lib/assets/images/logo-white.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text("  Home Finder",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                  fontFamily: kRegularFont)),
                            ),
                          ],
                        ),

<<<<<<< Updated upstream
                            SizedBox(height: 40,),
                            Text(" sign in to acess your account"),
                            CustomTextFieldWidget(Controller: controller.emailaddressController, validator: controller.emailValidator, keyboardType:TextInputType.emailAddress, textfieldHint: "Enter Your EmailAddress", textfieldIcon: Image(image: AssetImage("lib/assets/images/MessageIcon.png"),), ispasswordField:false, obscureText:false, suffixIcon:Icon(Icons.abc,color: Colors.transparent,),),
                            CustomTextFieldWidget(Controller: controller.passwordController, validator: controller.passwordValidator, keyboardType: TextInputType.visiblePassword, textfieldHint: "Enter Your Password", textfieldIcon:Image(image: AssetImage("lib/assets/images/LockIcon.png"),), ispasswordField: true, obscureText: true, suffixIcon:Image(image: AssetImage("lib/assets/images/Eye.png"),)),

=======
                        Text(" sign in to acess your account"),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 8),
                          child: CustomTextFieldWidget(
                            Controller: controller.emailaddressController,
                            validator: controller.emailValidator,
                            keyboardType: TextInputType.emailAddress,
                            textfieldHint: "Enter Your EmailAddress",
                            textfieldIcon: Image(
                              image:
                                  AssetImage("lib/assets/images/MessageIcon.png"),
                            ),
                            ispasswordField: false,
                            obscureText: false,
                            suffixIcon: Icon(
                              Icons.abc,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 8),
                          child: CustomTextFieldWidget(
                            Controller: controller.passwordController,
                            validator: (e){},
                            keyboardType: TextInputType.visiblePassword,
                            textfieldHint: "Enter Your Password",
                            textfieldIcon: Image(
                              image: AssetImage("lib/assets/images/LockIcon.png"),
                            ),
                            ispasswordField: true,
                            obscureText: !controller.passwordVisible1,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.passwordVisible1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  controller.passwordVisible1 = !controller.passwordVisible1;
                                });
                              },
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
>>>>>>> Stashed changes
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Checkbox(
                                      value: rememberMe,
                                      onChanged: _onRememberMeChanged),
                                ),
                                Text("Remember Me"),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Color(0xff6C63FF),fontSize: 12,fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 60,
                            width: 300,
                            child: CustomElevatedButtonWidget(
                              text: "Sign in",
                              onPressed: () {
                                if (controller.formkey.currentState!
                                    .validate()) {
                                  AuthServices.signingIn(controller.emailaddressController.text,controller.passwordController.text);
                                }
                              },
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,fontFamily: kRegularFont),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff6C63FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                          Container(color: Colors.black,height: 0.5,width: 134.59,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Text("or",style: TextStyle(
                            fontFamily: kRegularFont,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                          ),),
                        ),
                          Container(color: Colors.black,height: 0.5,width: 134.59,),
                        ],),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 57,
                            width: 302,
                              decoration: BoxDecoration(
                                color: Color(0xffF4F4F4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Image(image: AssetImage("lib/assets/images/google-icon 2.png"),),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Sign in with Google",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                      fontFamily: kRegularFont),
                                    ),
                                  ),
                                ],
                              ),

                          ),
                        ),
                        SizedBox(
                          height: 10
                        ),
                        Row(
                          children: [
                            Center(
                                child: Text(
                                    "                              New Member?")),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => SignUp());
                                },
                                child: Text(
                                  "Register Now",
                                  style: TextStyle(color: Color(0xff6C63FF)),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
        });
  }
}
