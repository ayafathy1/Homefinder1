import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homefinder1/Screens/add_listing/controller/add_listing_controller.dart';
import 'package:homefinder1/models/first_complete_model.dart';
import 'package:homefinder1/models/fourth_complete_model.dart';
import 'package:homefinder1/models/get_sold_for_profile_model.dart';
import '../models/create_residence_first.dart';
import '../models/get_all_reesidences_model.dart';
import '../models/get_one_residence_model.dart';
import '../models/second_complete_model.dart';
import '../utilities/api_service.dart';
import '../utilities/memory.dart';
import '../utilities/services.dart';
import 'package:http/http.dart' as http;

class ResidenceServices {
  String? houseId;
  static ApiService api = ApiService();

  static Future<CreateResidence?> createResidence(String title, String type,
      String category, BuildContext context,) async {
    print(title + "," + type + "," + category + ",");
    print(Services.createResidence);

    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(
        context: context, Services.createResidence, "POST", data: {
      "title": title,
      "type": type,
      "category": category,
    }, headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return CreateResidence.fromJson(data);
    }
    return null;
  }

  static Future<FirstCompleteModel?> FirstComplete(String neighborhood,
      String mszoning,
      String saleCondition, int moSold, int salePrice,
      String paymentPeriod, String saleType,
      List<String> utilities,
      String lotShape,
      String electrical,
      String foundation,
      String bldgType,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.firstCompleteEndPoint + residanceId,
        "POST",
        data: {
          "neighborhood": neighborhood,
          "mszoning": mszoning,
          "saleCondition": saleCondition,
          "moSold": moSold,
          "salePrice": salePrice,
          "paymentPeriod": paymentPeriod,
          "saleType": saleType,
          "utilities": utilities,
          "lotShape": lotShape,
          "electrical": electrical,
          "foundation": foundation,
          "bldgType": bldgType,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FirstCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<SecondCompleteModel?> secondComplete(String roofStyle,
      String roofMatl,
      String houseStyle
      , String msSubClass,
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
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.secondCompleteEndPoint + residanceId,
        "POST",
        data: {
          "roofStyle": roofStyle,
          "roofMatl": roofMatl,
          "houseStyle": houseStyle,
          "msSubClass": msSubClass,
          "centralAir": centralAir,
          "street": street,
          "alley": alley,
          "heating": heating,
          "heatingQc": heatingQc,
          "masVnrType": masVnrType,
          "masVnrArea": masVnrArea,
          "exterior1st": exterior1st,
          "exterior2nd": exterior2nd,
          "exterCond": exterCond,
          "exterQual": exterQual,
          "condition1": condition1,
          "condition2": condition2
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return SecondCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<FourthCompleteModel?> fourthComplete(String lotConfig,
      String landContour,
      String landSlope,
      String pavedDrive,
      int poolArea,
      int overallQual,
      int overallCond,
      int totalarea,
      int totalporchsf,
      int lotArea,
      int lotFrontage,
      int totalsf,
      int lowQualFinSF,
      int miscVal,
      int houseage,
      int houseremodelage,
      BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.fourthCompleteEndPoint + residanceId,
        "POST",
        data: {
          "lotConfig": lotConfig,
          "landContour": landContour,
          "landSlope": landSlope,
          "pavedDrive": pavedDrive,
          "poolArea": poolArea,
          "overallQual": overallQual,
          "overallCond": overallCond,
          "totalarea": totalarea,
          "totalporchsf": totalporchsf,
          "lotArea": lotArea,
          "lotFrontage": lotFrontage,
          "totalsf": totalsf,
          "lowQualFinSF": lowQualFinSF,
          "miscVal": miscVal,
          "houseage": houseage,
          "houseremodelage": houseremodelage,
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FourthCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<FourthCompleteModel?> deleteOneResidence(BuildContext context,
      String residanceId,) async {
    var token = Get
        .find<StorageService>()
        .getToken;
    print(token);
    var data = await api.request(context: context,
        Services.deleteOneResidenceEndPoint + residanceId,
        "DELETE",
        data: {
        },
        headers: {"Authorization": token});
    if (data != null) {
      print(data);
      return FourthCompleteModel.fromJson(data);
    }
    return null;
  }

  static Future<GetSoldForProfileModel?> fetchUserSoldData(int counter,
      {int page = 1}) async {
    const String getUserEndPoint = 'https://home-finder-back-end-i7ca.onrender.com/api/v1/residence/sold';

    try {
      final response = await http.get(
        Uri.parse('$getUserEndPoint?page=$page'),
        headers: {
          "Authorization": await Get
              .find<StorageService>()
              .getToken, // Replace with your token retrieval method
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'success') {
          return GetSoldForProfileModel.fromJson(jsonData);
        } else {
          print('API Error: ${jsonData['message']}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

    return null;
  }

  static Future<GetSoldForProfileModel?> fetchUserpendingData(
      int counter) async {
    const String getUserEndPoint = 'https://home-finder-back-end-i7ca.onrender.com/api/v1/residence/pending';

    try {
      final response = await http.get(
        Uri.parse('$getUserEndPoint?page=$counter'),
        headers: {
          "Authorization": await Get
              .find<StorageService>()
              .getToken, // Replace with your token retrieval method
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'success') {
          return GetSoldForProfileModel.fromJson(jsonData);
        } else {
          print('API Error: ${jsonData['message']}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

    return null;
  }

  static Future<GetSoldForProfileModel?> fetchUserapprovedData(
      int counter) async {
    const String getUserEndPoint = 'https://home-finder-back-end-i7ca.onrender.com/api/v1/residence/approved';

    try {
      final response = await http.get(
        Uri.parse('$getUserEndPoint?page=$counter'),
        headers: {
          "Authorization": await Get
              .find<StorageService>()
              .getToken, // Replace with your token retrieval method
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'success') {
          return GetSoldForProfileModel.fromJson(jsonData);
        } else {
          print('API Error: ${jsonData['message']}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

    return null;
  }


// Adjusted getDataOfResidences method to handle pagination and merging responses
  static Future<GetAllResidencesModel?> fetchAllResidences(int counter, BuildContext context) async {
    const String endPoint = 'residence/all';

    try {
      final response = await ApiService().request(
        '$endPoint?page=$counter',
        'GET',
        headers: {
          "Authorization": await Get.find<StorageService>().getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetAllResidencesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }
  static Future<GetOneResidencesModel?> fetchOneResidences(String resId, BuildContext context) async {
    const String endPoint = 'residence/get/';

    try {
      final response = await ApiService().request(
        '$endPoint$resId',
        'GET',
        headers: {
          "Authorization": await Get.find<StorageService>().getToken, // Ensure token retrieval is correct
        },
        context: context,
      );

      if (response != null && response['status'] == 'success') {
        print(response);
        return GetOneResidencesModel.fromJson(response);
      } else {
        print('API Error: ${response['message']}');
      }
    } catch (e) {
      print('Error fetching residences data: $e');
    }

    return null;
  }



}



