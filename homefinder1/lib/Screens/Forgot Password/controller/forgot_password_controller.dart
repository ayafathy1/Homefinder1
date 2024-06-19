// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ForgotPasswordController extends GetxController{


  final  formkey =  GlobalKey<FormState>();

  final emailaddressController =  TextEditingController();
  final passwordController =  TextEditingController();


  String? emailValidator (email) {
    if (RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email!)) {

    }
    else {
      return "   Enter Correct Email";
    }
    return null;
  }


  String? passwordValidator(password) {
    if (RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password!)) {

    } else {
      return "   Enter Correct password";
    }
    return null;
  }

  saveAndValidate() {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      // ignore: avoid_print
      print("valide");
    }
    else {
      print("not valide");
    }
  }

}
