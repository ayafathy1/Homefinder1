import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddListingFirstDetailController extends GetxController{
  ScrollController scroll= ScrollController();
  final List <String> msZoning=[
    "agricultural",
    "Commercial",
    "industrial",
    "floating village"
  ];
  int selectedMsZoningIndex=0;
  final List <String> SaleCondition=[
    "normal",
    "abnormal",
    "Adjoining land purshase",
    "Allocation"
  ];
   int selectedSaleConditionIndex=0;
  final TextEditingController monthOfSoldController=TextEditingController();
  final  formkey =  GlobalKey<FormState>();
  final TextEditingController sellPriceController=TextEditingController();
final String monthOfSold='';
final String sellPrice='';
final List<String> paymentPeriod=[
  "monthly",
  "yearly"
];
  int selectedPaymentPeriodIndex=0;
  final List<String> saleType=[
    "conventional",
    "cash",
    "va-Loan",
    "new",
    "court officer deed/estate",
    "contract Low-Interest",
    "contract 15% Down payment regular terms",
    "Contract Low Down payment and low intere"
    "contract Low Down",
    "Other"
  ];
  String? selectedValue;
  final List<String> utilities=[
    "gas",
    "Electricity",
    "water"
  ];
  int selectedUtilitiesIndex=0;
  final List<String> lotShape=[
    "regular",
    "irregular",
    "moderately"
  ];
  int selectedLotShapeIndex=0;
  final List<String> electricity=[
    "average",
    "poor",
    "fair",
    "mixed",
    "standard circuit breakers & romex",
  ];
  String? selectedValue1;

  final List<String> foundation=[
    "slab",
    "stone",
    "Wood",
    "brick and tile",
    "poured contrete'"
  ];
  int selectedFoundationIndex=0;
  final List<String> buildingType=[
    "single family",
    "duplex",
    "townhouse end unit",
    "townhouse inside unit",
    "2 family conversion"
  ];
  int selectedBuildingTypeIndex=0;
}