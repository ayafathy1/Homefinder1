import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/Forgot%20Password/forgot_password.dart';
import 'package:homefinder1/Screens/auth/SignIn/controller/signin_controller.dart';
import 'package:homefinder1/Screens/auth/Signup/signup.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';
import 'package:homefinder1/Widget/custom_elevated_button_widget.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';
import 'package:homefinder1/services/auth_service.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:homefinder1/utilities/constants.dart';

import '../../verification_code/verfication_code_screen.dart';

class SignIn extends StatefulWidget {
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
            child: Container(
              color: Color(0xffFFFFFF),
              width: Get.width,
              height: Get.height,
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: controller.formkey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
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
                                        color: kDarkBlueColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(" sign in to acess your account"),
                          CustomTextFieldWidget(
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
                          CustomTextFieldWidget(
                            Controller: controller.passwordController,
                            validator: (e) {},
                            keyboardType: TextInputType.visiblePassword,
                            textfieldHint: "Enter Your Password",
                            textfieldIcon: Image(
                              image: AssetImage("lib/assets/images/LockIcon.png"),
                            ),
                            ispasswordField: true,
                            obscureText:  !controller.passwordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  controller.passwordVisible = !controller.passwordVisible;
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: rememberMe,
                                      onChanged: _onRememberMeChanged),
                                  Text("Remember Me"),
                                ],
                              ),

                              TextButton(
                                onPressed: () {
                                  Get.to(() => ForgotPassword());
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Color(0xff6C63FF)),
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
                                    AuthServices.signingIn(
                                        controller.emailaddressController.text,
                                        controller.passwordController.text);
                                    Get.to(() => HomeScreen());
                                  }
                                },
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: kRegularFont),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff6C63FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 134.59,
                                height: 0.5,
                                color: Colors.black,
                              ),
                              Text(
                                "or",
                                style: TextStyle(
                                    fontFamily: kRegularFont,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Container(
                                width: 134.59,
                                height: 0.5,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 57,
                            width: 302,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  child: Image(
                                    image: AssetImage(
                                        "lib/assets/images/google-icon 2.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Sign in with Google",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: kRegularFont),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffC4C4C4).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          SizedBox(
                            height: 15,
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
            ),
          ));
        });
  }
}
