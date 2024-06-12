// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GetUserModel welcomeFromJson(String str) => GetUserModel.fromJson(json.decode(str));

String welcomeToJson(GetUserModel data) => json.encode(data.toJson());

class GetUserModel {
  String? status;
  int? soldCount;
  int? pendingCount;
  int? approvedCount;
  User? user;

  GetUserModel({
    this.status,
    this.soldCount,
    this.pendingCount,
    this.approvedCount,
    this.user,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
    status: json["status"],
    soldCount: json["soldCount"],
    pendingCount: json["pendingCount"],
    approvedCount: json["approvedCount"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "soldCount": soldCount,
    "pendingCount": pendingCount,
    "approvedCount": approvedCount,
    "user": user?.toJson(),
  };
}

class User {
  Image? image;
  String? id;
  String? username;
  String? email;
  String? role;
  List<dynamic>? wishlist;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.image,
    this.id,
    this.username,
    this.email,
    this.role,
    this.wishlist,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    role: json["role"],
    wishlist: json["wishlist"] == null ? [] : List<dynamic>.from(json["wishlist"]!.map((x) => x)),
    isVerified: json["isVerified"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "image": image?.toJson(),
    "_id": id,
    "username": username,
    "email": email,
    "role": role,
    "wishlist": wishlist == null ? [] : List<dynamic>.from(wishlist!.map((x) => x)),
    "isVerified": isVerified,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Image {
  String? url;
  String? publicId;

  Image({
    this.url,
    this.publicId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
  };
}
