import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddListingSecondDetailController extends GetxController{
  ScrollController scroll= ScrollController();
  final List <String> roofStyle=[
    "Flat",
    "Gable",
    "Gambrel",
    "Hip",
    "Shed"
  ];
  int selectedRoofStyleIndex=0;
  final List <String> roofMaterial=[
    "'clay or tile",
    "standard shingle",
    "membran",
    "roll",
    "gravel & tar",
    "wood shakes"

  ];
  int selectedRoofMaterialIndex=0;
  final TextEditingController masonryVeneerAreaController=TextEditingController();
  final  formkey =  GlobalKey<FormState>();
  final String masonryVeneerArea='';
  final List<String> houseStyle=[
    "1Story",
    "1.5Fin",
    "1.5Unf",
    "2Story",
    "2.5Fin",
    "SLvl"
  ];
  int selectedHouseStyleIndex=0;
  final List<String> typeOfResidence=[
    "2 family conversion",
    "multilevel and split",
    "duplex",
    "split foyer",
    "multi-level",
    "1 story unfinished attic",
    "2story and older",
    "2story and newer"
        "1story and older",
    "1story and newer"
  ];
  String? selectedValue;
  final List<String> centralAir=[
    "Yes",
    "No",
  ];
  int selectedCentralAirIndex=0;
  final List<String> street=[
    "paved",
    "gravel",
  ];
  int selectedStreetIndex=0;
  final List<String> alley=[
    "Paved",
    "Gravel",
    "no alley accesss",
  ];
  int selectedAlleyIndex=0;

  final List<String> exteriorCoveringOnHouse1=[
    "asbestos shingles",
    "asphalt shingles",
    "brick face",
    "brick common",
    "cement board",
    "hardboard",
    "hardboard siding",
    "metal siding",
    "plywood",
    "precast concrete",
    "stucco",
    "vinyl siding",
    "wood siding",
    "wood shingles",
    "cinder block",
    "stone",
    "imitation stucco",
    "Other"
  ];
  String? selectedValue1;
  final List<String> exteriorCoveringOnHouse2=[
    "asbestos shingles",
    "asphalt shingles",
    "brick face",
    "brick common",
    "cement board",
    "hardboard",
    "hardboard siding",
    "metal siding",
    "plywood",
    "precast concrete",
    "stucco",
    "vinyl siding",
    "wood siding",
    "wood shingles",
    "cinder block",
    "stone",
    "imitation stucco",
    "Other"
  ];
  String? selectedValue2;

  final List<String> heating=[
    "floor",
    "gas",
    "gas water",
    "gravity",
    "other water",
    "Wall"
  ];
  int selectedHeatingIndex=0;
  final List<String> heatingQuality=[
    "excellent",
    "good",
    "average",
    "fair",

  ];
  int selectedHeatingQualityIndex=0;
  int selectedMasonryVeneerTypeIndex=0;
  final List<String> masonryVeneerType=[
    "brick face",
    "brick common",
    "cinder block",
    "Stone",
    "None",

  ];
  int selectedExteriorConditionIndex=0;
  final List<String> exteriorCondition=[
    "excellent",
    "good",
    "average",
    "fair",
  ];
  int selectedExteriorQualityIndex=0;
  final List<String> exteriorQuality=[
    "excellent",
    "good",
    "average",
    "fair",
    "poor"
  ];

  String? selectedValue3;
  final List<String> condition1=[
    "normal",
    "adjacent to feeder street",
    "adjacent to arterial street",
    "adjacent to east west railroad",
    "adjacent to north south",
    "within 200 of east west",
    "within 200 of north South",
    "adjacent to positive off site feature",
    "near positive off-site feature",

  ];
  String? selectedValue4;
  final List<String> condition2=[
    "normal",
    "adjacent to feeder street",
    "adjacent to arterial street",
    "adjacent to east west railroad",
    "adjacent to north south",
    "within 200 of east west",
    "within 200 of north South",
    "adjacent to positive off site feature",
    "near positive off-site feature",

  ];
}