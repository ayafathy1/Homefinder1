
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homefinder1/models/serification_model.dart';

import '../models/auth_model.dart';
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
  static forgetPassword(String email,BuildContext context) async {
    var data = await api.request(context: context,Services.forgetPasswordEndPoint, "POST",data: {
      "email":email,
    });
    if (data != null) {

    }
    return null;
  }
}