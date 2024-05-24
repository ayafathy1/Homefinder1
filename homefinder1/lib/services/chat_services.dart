import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/auth_model.dart';
import '../utilities/api_service.dart';
import '../utilities/memory.dart';
import '../utilities/services.dart';

class ChatServices{
  static ApiService api = ApiService();
  static Future<AuthModel?> sendingMessage(String messageText,String receiverId,BuildContext context) async {
    var data = await api.request(context: context,Services.sendMessageEndPoint+receiverId, "POST",headers: {
      "BearerToken": Get.find<StorageService>().getToken,
    },data: {
      "messageContent":messageText,

    });
    if (data != null) {
      return AuthModel.fromJson(data);

    }
    return null;
  }
  static Future<AuthModel?> getMessagesList(String receiverId,BuildContext context) async {
    var data = await api.request(context: context,Services.getConversationEndPoint+receiverId, "GET",headers: {
      "BearerToken": Get.find<StorageService>().getToken,
    },);
    if (data != null) {

      return AuthModel.fromJson(data);

    }
    return null;
  }
  static Future<AuthModel?> getUsersList(BuildContext context) async {
    var data = await api.request(context: context,Services.getUsersChatListEndPoint, "GET",headers: {
      "BearerToken": Get.find<StorageService>().getToken,
    },);
    if (data != null) {

      return AuthModel.fromJson(data);

    }
    return null;
  }
  static Future<AuthModel?> getSearchInUsersList(String searchKeyword,BuildContext context) async {
    var data = await api.request(context: context,Services.getSearchInUsersChatListEndPoint, "GET",headers: {
      "BearerToken": Get.find<StorageService>().getToken,
    },queryParameters: {
      "search":searchKeyword,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> editMessage(String messageId,String newMessageText,BuildContext context) async {
    var data = await api.request(context: context,Services.editMessageEndPoint+messageId, "PATCH",headers: {
      "BearerToken": Get.find<StorageService>().getToken,
    },queryParameters: {
      "messageContent":newMessageText,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> deleteMessage(String messageId,BuildContext context) async {
    var data = await api.request(context: context,Services.deleteMessageEndPoint+messageId, "PATCH",headers: {
      "BearerToken": Get.find<StorageService>().getToken,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> deleteConversation(String receiverId,BuildContext context) async {
    var data = await api.request(context: context,Services.deleteConversationEndPoint+receiverId, "PATCH",headers: {
      "BearerToken": Get.find<StorageService>().getToken,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
}