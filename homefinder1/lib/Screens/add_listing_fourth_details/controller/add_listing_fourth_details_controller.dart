import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddListingFourthDetailsController extends GetxController{
  ScrollController scroll= ScrollController();
  final  formkey =  GlobalKey<FormState>();
  final List<String>lotConfig=[
    "inside",
    "corner",
    "cul de sac",
    "frontage on 2",
    "frontage on 3"
  ];
  int selectedLotConfigIndex=0;
  final List<String>landContour=[
    "level",
    "banked",
    "hillside",
    "depression"
  ];
  int selectedLandContourIndex=0;
  final List<String>landSlope=[
    "gentle",
    "moderate",
    "severe"
  ];
  int selectedLandSlopeIndex=0;
  final List<String>pavedDrive=[
    "paved",
    "gravel",
    "partial"
  ];
  int selectedPavedDriveIndex=0;
  TextEditingController poolAreaController= TextEditingController();
  TextEditingController overallQualityontroller= TextEditingController();
  TextEditingController overallConditionController= TextEditingController();
  TextEditingController totalAreaController= TextEditingController();
  TextEditingController  lotFrontageController= TextEditingController();
  TextEditingController totalSquareFeetController= TextEditingController();
  TextEditingController lowQualitySquareFeetController= TextEditingController();
  TextEditingController valueOfMiscellaneousFeatureController= TextEditingController();
  TextEditingController  houseAgeController= TextEditingController();
  TextEditingController houseRemodelageController= TextEditingController();

}