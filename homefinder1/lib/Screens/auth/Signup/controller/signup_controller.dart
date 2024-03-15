import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

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

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}