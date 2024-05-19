import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';

import '../../../../models/auth_model.dart';
import '../../../../services/auth_service.dart';
import '../../../../utilities/memory.dart';

class SignInController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    passwordVisible = false;
  }
  bool passwordVisible = false;


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
}


String? passwordValidator(password) {
  if (RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(password!)) {

  } else {
    return "   Enter Correct password";
  }
}

saveAndValidate() {
  var formdata = formkey.currentState;
  if (formdata!.validate()) {
    formdata.save();
    print("valide");
  }
  else {
    print("not valide");
  }
}
  Future<void> SignInWithEmail(BuildContext context) async {
    try {
      AuthModel? data = await AuthServices.signingIn(
          emailaddressController.text,
          passwordController.text,
          context
      );
      if (data?.status == "success") {
        await Get.find<StorageService>().saveAccountId(data?.userId ?? "");
        await Get.find<StorageService>().saveAccountToken(data?.token ?? "");
        Get.to(() => HomeScreen());
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
