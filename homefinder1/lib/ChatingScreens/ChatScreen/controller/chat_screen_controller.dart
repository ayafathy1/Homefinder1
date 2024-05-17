import 'dart:async';


import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utilities/memory.dart';


class ChatScreenController extends GetxController{
List<String>? chatList = [];
bool isLoading = true;
final String receiverId;
final TextEditingController msgController =  TextEditingController();
Timer? timer;
bool appBarDataIsLoading = true;
late String? employeeData ;
  ChatScreenController(this.receiverId);
@override
  void onInit() {
  getData();
  getAppBarData();
    // TODO: implement onInit
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => getData());
  }
@override
  onClose() {
  timer?.cancel();
}
getAppBarData() async {
  // employeeData = await EmployeesServices.getEmployeeProfile(receiverId);
  appBarDataIsLoading = false;
  update();
}
getData() async {
   // var userToken =  Get.find<StorageService>().getToken;
  // chatList = await ChatServices.messageList("$employeeId", receiverId);
   isLoading = false;
   update();
}

detectWhoWroteTheMessage( senderId){
  bool theUserIsSender = false;
  var employeeId =  Get.find<StorageService>().getId;
  if(
  senderId == employeeId
  ){
    theUserIsSender = true;
  }
  return theUserIsSender;
}

sendMessage(context) async {
  // ResponseModel? status = await ChatServices.sendMessage(Get.find<StorageService>().getId,receiverId,msgController.text);
  if("status?.msg"=="succeeded"){

  getData();
  }else{
    update();
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: "sorry an error has been occured",
      text:" data?.message??""",
    );
  }
}
}
