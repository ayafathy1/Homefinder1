import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/SignIn/signin.dart';
import 'package:homefinder1/Screens/settings/settings_screen.dart';
import 'package:homefinder1/models/auth_model.dart';
import 'package:homefinder1/services/auth_service.dart';

import '../../../models/delete_account_model.dart';
import '../../../utilities/memory.dart';
import '../../home/home_screen.dart';

class ResetPasswordController extends GetxController{
  String email;
  ResetPasswordController(this.email);
  void onInit() {
    super.onInit();

    newPasswordVisible = false;
    confirmPasswordVisible = false;
  }

  bool newPasswordVisible = false;
  bool confirmPasswordVisible = false;


  final  formkey =  GlobalKey<FormState>();

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
  Future<void> resetYourPassword(BuildContext context) async {
    try {
      AuthModel? data = await AuthServices.resetPassword(
          newPasswordController.text,
          confirmPasswordController.text,
          context,
        email
      );
      if (data?.status == "success") {
        Get.to(() => SignIn());
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = " $e";
      String part = errorMessage.substring(26, 35);
      // Show error message on the screen
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: part,
      );
    }

  }
}