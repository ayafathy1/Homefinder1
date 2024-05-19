import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class ApiService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._();
  factory ApiService() => _apiUtil;

  final String baseUrl = "https://home-finder-back-end-i7ca.onrender.com";

  Future<dynamic> request<T>(
      String endPoint,
      String method, {
        dynamic data,
        Map<String, String>? headers,
        Map<String, dynamic>? queryParameters,
        Function(String errorMsg)? errorDialog,
        Function(String? successMsg)? onSuccess,
        Function(String errorMsg)? errorMessage,
        required BuildContext context, // Add BuildContext parameter
      }) async {
    try {
      Uri uri = Uri.parse(baseUrl + endPoint);
      HttpClient httpClient = HttpClient();
      HttpClientRequest request;

      if (method == 'GET') {
        request = await httpClient.getUrl(uri);
      } else {
        request = await httpClient.postUrl(uri);
        request.headers.contentType = ContentType.json;
        request.write(jsonEncode(data));
      }

      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.add(key, value);
        });
      }

      HttpClientResponse response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        String responseBody = await response.transform(utf8.decoder).join();
        if (onSuccess != null) {
          onSuccess(responseBody);
        }
        return json.decode(responseBody);
      } else {
        String errorMessage = await response.transform(utf8.decoder).join();
        throw errorMessage;
      }
    } catch (e, stackTrace) {
      String Message = " $e";
      String part = Message.substring(29, Message.length-2);
      print("Error: $part");
      print("StackTrace: $stackTrace");
      if (errorDialog == null && errorMessage == null) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Sorry!",
          text: part,
        );
      }
      if (errorDialog != null) {
        errorDialog("Error: $part");
      }
      if (errorMessage != null) {
        errorMessage("Error: $part");
      }
      return null;
    }
  }
}