import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/edit_listing/widget/photos.dart';
import 'package:homefinder1/models/update_residence_model.dart';
import 'package:homefinder1/services/residences_services.dart';

import '../../../utilities/colors.dart';

class EditListingController extends GetxController{

  Color contColor1=kLightGreyColor;

  Color contColor2=kLightGreyColor;

  Color contColor3=kLightGreyColor;

  Color contColor4=kLightGreyColor;

  Color contColor5=kLightGreyColor;

  Color contColor6=kLightGreyColor;

  Color contColor7=kLightGreyColor;

  Color textColor1 = kDarkBlueColor;

  Color textColor2 = kDarkBlueColor;

  Color textColor3 = kDarkBlueColor;

  Color textColor4 = kDarkBlueColor;

  Color textColor5 = kDarkBlueColor;

  Color textColor6 = kDarkBlueColor;

  Color textColor7 = kDarkBlueColor;

  Color garden = kDarkBlueColor ;

  Color gardenText = kDarkBlueColor;

  Color gym = kDarkBlueColor ;

  Color gymText = kDarkBlueColor;

  Color homeTheatre = kDarkBlueColor ;

  Color homeTheatreText = kDarkBlueColor;

  Color kidsFriend = kDarkBlueColor ;

  Color kidsFriendText = kDarkBlueColor;

  Color hotel = kDarkBlueColor ;

  Color hotelText = kDarkBlueColor;

  Color villa = kDarkBlueColor ;

  Color villaText = kDarkBlueColor;

  Color cottege = kDarkBlueColor ;

  Color cottegeText = kDarkBlueColor;

  Color house = kDarkBlueColor ;

  Color houseText = kDarkBlueColor;

  Color apartment = kDarkBlueColor ;

  Color apartmentText = kDarkBlueColor;


  Color bed2 = kDarkBlueColor;

  Color bedtext2 = kDarkBlueColor;

  final List gridview = [
    {
      "image" : "lib/assets/images/Shape1.png",
    },
    {
      "image" : "lib/assets/images/Shape2.png",
    },
    {
      "image" : "lib/assets/images/Shape3.png",
    }
  ];

  final List gridview1 = [
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "2",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "3",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "4",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "5",
    },
    {
      "image" : "lib/assets/images/Bed.png" ,
      "number" : "6",
    },
  ];


  var selectedIndex;

  int counter1 = 1;
  int counter2 = 1;
  int counter3 = 1;

  void incrementCounter1() {

      counter1++;
      update();

  }

  void decrementCounter1() {

      counter1--;
      update();

  }

  void incrementCounter2() {

      counter2++;
      update();

  }

  void decrementCounter2() {

      counter2--;
      update();

  }

  void incrementCounter3() {

      counter3++;
      update();
  }

  void decrementCounter3() {

      counter3--;
      update();

  }


  static String? houseId;
  int selectedIndex1=0;
  TextEditingController propertyTitle=TextEditingController();
  ScrollController scroll=ScrollController();
  List<String> rOrS=["Rent","Sell"];
  int selectedIndex2=0;
  String propertyType="rent";
  String propertyCategory="house";
  List<String> hOrAOrHOrVOrC=["House","Apartment","Hotel","Villa","Cottage"];
  Future<void> updateResidance(String title,String type,String category,BuildContext context) async {
    try {
      UpdateResidence? data = await ResidenceServices.updateResidence(
          propertyTitle.text,
          propertyType,
          propertyCategory,
          context
      );
      if (data?.status == "success") {
        EditListingController.houseId=data?.residence?.id;
        print(houseId);
        Get.to(() =>ImagePickerExample1(data?.residence?.id??"",));
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



}