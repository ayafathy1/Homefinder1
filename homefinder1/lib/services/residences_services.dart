import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing/controller/add_listing_controller.dart';
import 'package:homefinder1/models/first_complete_model.dart';
import '../models/create_residence_first.dart';
import '../models/second_complete_model.dart';
import '../utilities/api_service.dart';
import '../utilities/memory.dart';
import '../utilities/services.dart';

class ResidenceServices{
  String? houseId;
  static ApiService api = ApiService();
  static Future<CreateResidence?> createResidence(String title,String type,String category,BuildContext context,) async {
    print(title+","+type+","+category+",");
    print(Services.createResidence);

    var token = Get.find<StorageService>().getToken;
    print(token);
    var data = await api.request(context: context,Services.createResidence, "POST",data: {
      "title":title,
      "type":type,
      "category":category,
    },headers: {"Authorization": token});
    if (data != null) {

      print(data);
      return CreateResidence.fromJson(data);

    }
    return null;
  }
  static Future<FirstCompleteModel?> FirstComplete(String neighborhood,String mszoning,
      String saleCondition,int moSold,int salePrice,
      String paymentPeriod,String saleType,
      List<String> utilities,
      String lotShape,
      String electrical,
      String foundation,
      String bldgType,
      BuildContext context,
      String residanceId,
      ) async {

    var token = Get.find<StorageService>().getToken;
    print(token);
    var data = await api.request(context: context,Services.firstCompleteEndPoint+residanceId, "POST",data: {
      "neighborhood":neighborhood,
      "mszoning":mszoning,
      "saleCondition":saleCondition,
      "moSold":moSold,
      "salePrice":salePrice,
      "paymentPeriod":paymentPeriod,
      "saleType":saleType,
      "utilities":utilities,
      "lotShape":lotShape,
      "electrical":electrical,
      "foundation":foundation,
      "bldgType":bldgType,
    },headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FirstCompleteModel.fromJson(data);
    }
    return null;
  }
  static Future<SecondCompleteModel?> secondComplete(
      String roofStyle,
      String roofMatl,
      String houseStyle
      ,String msSubClass,
      String centralAir,
      String street,
      String alley,
      String heating,
      String heatingQc,
      String masVnrType,
      int masVnrArea,
      String exterior1st,
      String exterior2nd,
      String exterCond,
      String exterQual,
      String condition1,
      String condition2,
      BuildContext context,
      String residanceId,
      ) async {

    var token = Get.find<StorageService>().getToken;
    print(token);
    var data = await api.request(context: context,Services.secondCompleteEndPoint+residanceId, "POST",data: {
      "roofStyle":roofStyle,
      "roofMatl":roofMatl,
      "houseStyle":houseStyle,
      "msSubClass":msSubClass,
      "centralAir":centralAir,
      "street":street,
      "alley":alley,
      "heating":heating,
      "heatingQc":heatingQc,
      "masVnrType":masVnrType,
      "masVnrArea":masVnrArea,
      "exterior1st":exterior1st,
      "exterior2nd":exterior2nd,
      "exterCond":exterCond,
      "exterQual":exterQual,
      "condition1":condition1,
      "condition2":condition2
    },headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return SecondCompleteModel.fromJson(data);
    }
    return null;
  }

}