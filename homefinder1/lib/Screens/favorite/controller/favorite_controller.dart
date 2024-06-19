import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{
  ScrollController scroll= ScrollController();
  List<String> types=["All","House","Villa","appartment",];
  int selectedIndex=0;
  void favCategory(int index){
    selectedIndex=index;
    update();
  }
}