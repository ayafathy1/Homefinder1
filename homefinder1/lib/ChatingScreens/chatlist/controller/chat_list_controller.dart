// ignore_for_file: prefer_is_empty, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ChatListController extends GetxController{
  List<String>? users = [];
  bool isLoading = true;
  bool hasNoData = false;
  @override
  void onInit() {
    super.onInit();
    getChatList();
  }

String returnDateAndTime(String? date){
   String dateOrTime = "" ;
   final format = DateFormat('HH:mm a');
   DateFormat formatDate = DateFormat("MMM dd");
   final dateTime = DateTime.parse(date??"");
   if(dateTime.day == DateTime.now().day){
     dateOrTime = format.format(dateTime);
   }else{
     dateOrTime = formatDate.format(dateTime);
   }
   return dateOrTime;
}
searchForUser(){
  // users =
}
  getChatList() async {
    isLoading = true;
    update();
    // users =
    if(
    users?.length==0||users==[]
    ){
      hasNoData = true;

    }
    isLoading = false;
    update();
  }
}