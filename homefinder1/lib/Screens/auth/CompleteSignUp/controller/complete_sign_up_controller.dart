import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/edit_profile/edit_profile.dart';
import 'package:homefinder1/Screens/home/home_screen.dart';

import '../../../../models/auth_model.dart';
import '../../../../services/auth_service.dart';
import '../../../../utilities/memory.dart';

class CompleteSignUpController extends GetxController{

  final  formkey =  GlobalKey<FormState>();

  final  fisrtnameController =  TextEditingController();
  final  lastnameController =  TextEditingController();
  final  genderController  = TextEditingController();
  final  phoneController = TextEditingController();


  @override
  String? fisrtnameValidator (username){
    if (RegExp(
        r"^[\p{L} ,.'-]*$",
        caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(username!)
    ) {

    } else {
      return "   Enter Correct First Name";

    }
  }

  @override
  String? lastnameValidator (username){
    if (RegExp(
        r"^[\p{L} ,.'-]*$",
        caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(username!)
    ) {

    } else {
      return "   Enter Correct last Name";

    }
  }


@override
  String? genderValidator (gender){
    if( RegExp(r'^Female|female|Male|male').hasMatch(gender!)){

    } else {
      return "   Enter Correct Gender" ; }
  }

  @override
  String? phoneValidator (phone){
    if( RegExp(r'^(?:[+0]9)?[0-9]{11}$').hasMatch(phone!)){

    } else {
      return "   Enter Correct Phone No." ; }
  }




Future<void> CompleteSignUp(BuildContext context) async {
  try {
    AuthModel? data = await AuthServices.completeSigningUp(
        fisrtnameController.text,
        lastnameController .text,
        genderController.text,
        phoneController.text,
        context
    );
    if (data?.status == "success") {
      Get.to(() =>UploadPhotoScreen());
    }
  } catch (e) {
    String errorMessage = " $e";
    String part = errorMessage.substring(26, 35);
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: "Error",
      text: part,
    );
  }

}


  @override
  saveAndValidate() {
    final  formkey =  GlobalKey<FormState>();
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("valide");
    }
    else {
      print("not valide");
    }
  }}

  @override
  Widget build(BuildContext context) {
    return Container();

  }
