import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/verification_code/verfication_code_screen.dart';
import 'package:homefinder1/Widget/custom_text_field_widget.dart';
import 'package:homefinder1/Screens/auth/Signup/controller/signup_controller.dart';
import 'package:homefinder1/utilities/colors.dart';

import '../../../utilities/constants.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        init: SignUpController(),
        builder: (SignUpController controller) {
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
                              height: 240,
                              child: Image.asset(
                                'lib/assets/images/logo-white.png',

                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text("  Home Finder",
                                  style: TextStyle(
                                      color:kDarkBlueColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                  fontFamily: kRegularFont)),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 110.0,
                              ),
                              child: Text(
                                "     by creating a free account",
                                style: TextStyle(color: Color(0xff252525)),
                              ),
                            ),
                          ],
                        ),
                        CustomTextFieldWidget(
                          Controller: controller.usernameController,
                          validator: (e){},
                          keyboardType: TextInputType.text,
                          textfieldHint: "User Name",
                          textfieldIcon: Image(
                            image:
                                AssetImage("lib/assets/images/ProfileIcon.png"),
                          ),
                          ispasswordField: false,
                          obscureText: false,
                          suffixIcon: Icon(
                            Icons.abc,
                            color: Colors.transparent,
                          ),
                        ),
                        CustomTextFieldWidget(
                          Controller: controller.emailaddressController,
                          validator: controller.emailValidator,
                          keyboardType: TextInputType.emailAddress,
                          textfieldHint: "EmailAddress",
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
                          validator: controller.passwordValidator,
                          keyboardType: TextInputType.visiblePassword,
                          textfieldHint: "Password",
                          textfieldIcon: Image(
                            image: AssetImage("lib/assets/images/LockIcon.png"),
                          ),
                          ispasswordField: true,
                          obscureText:  !controller.passwordVisible1,
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
                          ),
                        ),
                        CustomTextFieldWidget(
                          Controller: controller.confirmPasswordController,
                          validator: controller.confirmValidator,
                          keyboardType: TextInputType.visiblePassword,
                          textfieldHint: "Confirm Password",
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
                        Row(children: [
                          Checkbox(
                              value: rememberMe, onChanged: _onRememberMeChanged),
                          Text(
                            "by checking the box you agree to our",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Terms",
                            style: TextStyle(color: Color(0xff6C63FF)),
                          ),
                          Text("and"),
                          Text(
                            "Conditions",
                            style: TextStyle(color: Color(0xff6C63FF)),
                          ),
                        ]),
                        SizedBox(
                          height: 55,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.formkey.currentState!.validate()) {
                                Get.to(
                                  () => VerficationCode(),
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                  fontFamily: kRegularFont),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  size: 30,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff6C63FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 55,
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
                            Text(
                                "                               Already a member?"),
                            Text(
                              "Log In",
                              style: TextStyle(color: Color(0xff6C63FF)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ),
          ));
        });
  }
}
