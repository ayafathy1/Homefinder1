import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  final  formkey =  GlobalKey<FormState>();

  final usernameController =  TextEditingController();

  final emailaddressController =  TextEditingController();

  final passwordController =  TextEditingController();

  @override

  String? usernameValidator (username){
    if(username!.isEmpty)

       { return 'Please Enter Your Name';}
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

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}