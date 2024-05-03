import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/auth/CompleteSignUp/complete_sign_up.dart';
import 'package:homefinder1/utilities/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
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
  Future<void> registerWithEmail() async{
    try{
      var headers={"Content-Type":"application/json"};
      var url = Uri.parse(Services.baseEndPoint+Services.signingUpEndPoint);
  Map body={
    "username":usernameController,
    "email":emailaddressController,
    "password":passwordController,
    "confirmPass":confirmPasswordController,
  };
  http.Response response = await http.post(url,body:jsonEncode(body),headers: headers);
    if(response.statusCode==200){
      final json=jsonDecode(response.body);
      if(json['code']==0){
        var token = json['data']['token'];
        print(token);
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString("token", token);
        usernameController.clear();
        emailaddressController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        Get.to(()=>CompleteSignUp());
      }else{
        throw jsonDecode(response.body)["message"]??"unknown error occured";
      }
    }else{
      throw jsonDecode(response.body)["message"]??"unknown error occured";
    }
    }catch(e){
        Get.back();
        showDialog(context: Get.context!,
            builder: (context){
          return SimpleDialog(
            title: Text("Error"),
            contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
          );
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}