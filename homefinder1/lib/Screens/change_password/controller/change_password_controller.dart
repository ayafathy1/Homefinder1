import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  void onInit() {
    super.onInit();
    oldPasswordVisible = false;
    newPasswordVisible = false;
    confirmPasswordVisible = false;
  }
  bool oldPasswordVisible = false;
  bool newPasswordVisible = false;
  bool confirmPasswordVisible = false;


  final  formkey =  GlobalKey<FormState>();
  final oldPasswordController =  TextEditingController();
  final newPasswordController =  TextEditingController();
  final confirmPasswordController =  TextEditingController();
  String? passwordValidator(password) {
    if (RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password!)) {

    } else {
      return "   Enter Correct password";
    }
  }
  String? confirmValidator (String? val){
    if(val!.isEmpty)
      return 'Empty';
    else if(val != newPasswordController.text)
      return 'Not Match';
    else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(val))
    {
      return "Please Enter a Valid password";
    }else return null;
  }
}