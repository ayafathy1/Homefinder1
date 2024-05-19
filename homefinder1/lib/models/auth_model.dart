import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  String? status;
  String? message;
  String? token;
  String? userId;
  int? statusCode;

  AuthModel({
    this.status,
    this.message,
    this.token,
    this.userId,
    this.statusCode,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    userId: json["userId"],
    statusCode: json['statusCode'],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "userId": userId,
    "statusCode":statusCode
  };
}