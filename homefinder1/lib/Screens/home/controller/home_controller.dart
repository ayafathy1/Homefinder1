import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  ScrollController scroll= new ScrollController();
  List<String> types=["House","appartment","Hotel","Villa"];
  int selectedIndex=0;
}