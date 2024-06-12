import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/delete_account_model.dart';
import '../../../services/auth_service.dart';
import '../../../utilities/memory.dart';
import '../../SplashScreen/splash_Screen.dart';

class DeleteAccountController extends GetxController{
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
  }
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> deleteAccount(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      DeleteAccountModel? data = await AuthServices.deleteAccount(passwordController.text,context);
      if (data?.status == "success") {
        StorageService s = StorageService(prefs);
        s.loggingOut();
        Get.to(() => SplashScreen());
      }
    } catch (e) {
      // Handle bad request error
      String errorMessage = "$e";
      String part = errorMessage.substring(0, errorMessage.length);
      // Show error message on the screen
      print(part);
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Error",
        text: part,
      );
    }
  }
}

