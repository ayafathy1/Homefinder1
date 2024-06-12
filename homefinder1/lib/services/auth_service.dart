
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/models/get_user_model.dart';
import 'package:homefinder1/models/log_out_model.dart';
import 'package:homefinder1/models/serification_model.dart';
import '../models/auth_model.dart';
import '../models/delete_account_model.dart';
import '../models/forget_password_model.dart';
import '../utilities/api_service.dart';
import '../utilities/memory.dart';
import '../utilities/services.dart';

class AuthServices{
  static ApiService api = ApiService();
  static Future<AuthModel?> signingIn(String email,String password,BuildContext context) async {
    var data = await api.request(context: context,Services.signingInEndPoint, "POST",data: {
      "email":email,
      "password":password,
    });
    if (data != null) {
      return AuthModel.fromJson(data);

    }
    return null;
  }
  static Future<AuthModel?> signingUp(String username,String email,String password,String confirmPass,BuildContext context) async {
    var data = await api.request(context: context,Services.signingUpEndPoint, "POST",data: {
     "username":username,
      "email":email,
      "password":password,
      "confirmPass":confirmPass,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> completeSigningUp(String firstName,String lastName,String gender,String phone,BuildContext context) async {
    var data = await api.request(context: context,Services.signingInEndPoint, "POST",data: {
      "firstName":firstName,
      "lastName":lastName,
      "gender":gender,
      "phone":phone,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<VerificationModel?> SendingVerificationCode(BuildContext context,code) async {
    var data = await api.request(context: context,Services.verificationCodeEndPoint, "POST",data: {
      "otp": code,
    },headers:{"authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return VerificationModel.fromJson(data);
    }
    return null;
  }
  static Future<VerificationModel?> reSendingVerificationCode(BuildContext context) async {
    var data = await api.request(context: context,Services.resendVerificationEndPoint, "GET",data: {
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return VerificationModel.fromJson(data);
    }
    return null;
  }
  static Future<ForgetPaaswordModel?> forgetPassword(String email,BuildContext context) async {
    var data = await api.request(context: context,Services.forgetPasswordEndPoint, "POST",data: {
      "email":email,
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return ForgetPaaswordModel.fromJson(data);
    }
    return null;
  }
  static Future<LogOutModel?> signOut(BuildContext context) async {
    var data = await api.request(context: context,Services.signOutEndPoint, "GET",data: {
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return LogOutModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> resetPassword(String password,String confirmPass,BuildContext context) async {
    var data = await api.request(context: context,Services.forgetPasswordEndPoint, "POST",data: {
      "password":password,
      "confirmPass":confirmPass
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<DeleteAccountModel?> deleteAccount(String password,BuildContext context) async {
    var data = await api.request(context: context,Services.deleteAccountEndPoint, "DELETE",data: {
      "password":password,
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return DeleteAccountModel.fromJson(data);
    }
    return null;
  }
  static Future<DeleteAccountModel?>changePassword(String oldPassword,String password,String confirmPass,BuildContext context) async {
    var data = await api.request(context: context,Services.changePasswordEndPoint, "PATCH",data: {
      "oldPassword":oldPassword,
      "newPassword":password,
      "confirmPass":confirmPass
    },headers:{"Authorization":await Get.find<StorageService>().getToken});
    if (data != null) {
      return DeleteAccountModel.fromJson(data);
    }
    return null;
  }
  static Future<GetUserModel?> fetchUserData() async {
    // Replace with your actual API endpoint URL
    const String getUserEndPoint = 'https://home-finder-back-end-i7ca.onrender.com/api/v1/user/get-user'; // Example URL

    try {
      // Make GET request
      final response = await http.get(
        Uri.parse(getUserEndPoint),
        headers: {
          "Authorization":await Get.find<StorageService>().getToken, // Replace with your token retrieval method
        },
      );

      // Check if request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse JSON response
        final jsonData = jsonDecode(response.body);

        // Check if the JSON structure matches the expected format
        if (jsonData['status'] == 'success') {
          return GetUserModel.fromJson(jsonData);
        } else {
          print('API Error: ${jsonData['message']}');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }

    return null; // Return null if there's any error or invalid response
  }

}