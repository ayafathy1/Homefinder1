import 'dart:convert';

SignOutModel welcomeFromJson(String str) => SignOutModel.fromJson(json.decode(str));

String welcomeToJson(SignOutModel data) => json.encode(data.toJson());

class SignOutModel {
  String status;
  String message;
  String token;
  String userId;

  SignOutModel({
    required this.status,
    required this.message,
    required this.token,
    required this.userId,
  });

  factory SignOutModel.fromJson(Map<String, dynamic> json) => SignOutModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "userId": userId,
  };
}
