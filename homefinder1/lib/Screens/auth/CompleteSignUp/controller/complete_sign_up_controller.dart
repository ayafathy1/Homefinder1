import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompleteSignUpController extends GetxController{

  final  formkey =  GlobalKey<FormState>();

  final fisrtnameController =  TextEditingController();
  final lastnameController =  TextEditingController();
  final genderController  = TextEditingController();
  final phoneController = TextEditingController();


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
  }

  @override
  Widget build(BuildContext context) {
    return Container();

  }
