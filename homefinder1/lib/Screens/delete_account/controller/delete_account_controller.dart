import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    passwordVisible = false;
  }
  bool passwordVisible = false;


  final  formkey =  GlobalKey<FormState>();
  final passwordController =  TextEditingController();
  String? passwordValidator(password) {
    if (RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password!)) {

    } else {
      return "   Enter Correct password";
    }
    return null;
  }
}