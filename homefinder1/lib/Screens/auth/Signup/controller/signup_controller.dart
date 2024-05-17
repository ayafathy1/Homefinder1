import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/CompleteSignUp/complete_sign_up.dart';
import 'package:homefinder1/Screens/verification_code/verfication_code_screen.dart';
import 'package:homefinder1/utilities/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../models/auth_model.dart';
import '../../../../services/auth_service.dart';
import '../../../../utilities/memory.dart';
class SignUpController extends GetxController{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final  formkey =  GlobalKey<FormState>();

  final usernameController =  TextEditingController();

  final emailaddressController =  TextEditingController();

  final passwordController =  TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    passwordVisible = false;
    passwordVisible1= false;
  }
  bool passwordVisible = false;
  bool passwordVisible1 = false;


  @override



  String? usernameValidator (username){
    if (RegExp(
        r"^[\p{L} ,.'-]*$",
            caseSensitive: false, unicode: true, dotAll: true)
            .hasMatch(username!)
    ) {

    } else {
    return "   Enter Correct User Name";

  }
  }


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

  @override
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
  String? confirmValidator (String? val){
    if(val!.isEmpty)
      return 'Empty';
    else if(val != passwordController.text)
      return 'Not Match';
    else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(val))
    {
      return "Please Enter a Valid password";
    }else return null;
  }
  Future<void> registerWithEmail(context) async{
    AuthModel? data =await AuthServices.signingUp(usernameController.text, emailaddressController.text, passwordController.text, confirmPasswordController.text);
    if(data?.status == "success"){
      await  Get.find<StorageService>().saveAccountId(data?.userId??"");
      await  Get.find<StorageService>().saveAccountToken(data?.token??"");
    Get.to(()=>VerficationCode());
    }else{
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "sorry an error has been occured",
          text: data?.message??"",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}