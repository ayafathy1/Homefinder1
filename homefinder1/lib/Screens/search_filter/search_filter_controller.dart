import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/utilities/colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchFilterController extends GetxController{
List<String> rentOrSale=["For Rent","For Sale"];
Color activeContainerColor=kPrimaryColor;
Color deActiveContainerColor=kLightGreyColor;
Color activeTextColor=Colors.white;
Color deActiveTextColor=kDarkBlueColor;
int selectedIndex=2;
SfRangeValues values = SfRangeValues(100.0, 5000.0);
final List<String> labels=["\$100","\$500","\$1000","\$1500","\$3000","\$5000"];
List<double> rate=[5,4,3,2];
String? selectedOption = '3';
int selectedIndex1=0;
List<int> bedRoomNumber=[1,3,5,7,9,11];
List<int> bathRoomNumber=[1,2,3,4,5];
int selectedIndex2=0;
ScrollController sController=ScrollController();
int min= 100;
int max=5000;
}