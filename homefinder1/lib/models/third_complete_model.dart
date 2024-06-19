// To parse this JSON data, do
//
//     final thirdCompleteModel = thirdCompleteModelFromJson(jsonString);

import 'dart:convert';

ThirdCompleteModel  welcomeFromJson(String str) => ThirdCompleteModel.fromJson(json.decode(str));

String welcomeToJson(ThirdCompleteModel data) => json.encode(data.toJson());

class ThirdCompleteModel {
  String? status;
  Residence? residence;

  ThirdCompleteModel({
    this.status,
    this.residence,
  });

  factory ThirdCompleteModel.fromJson(Map<String, dynamic> json) =>  ThirdCompleteModel(
    status: json["status"],
    residence: json["residence"] == null ? null : Residence.fromJson(json["residence"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "residence": residence?.toJson(),
  };
}

class Residence {
  bool? isLiked;
  Location? location;
  String? id;
  String? ownerId;
  bool? isSold;
  bool? isCompleted;
  String? status;
  int? avgRating;
  String? title;
  String? type;
  String? category;
  bool? hasGarage;
  bool? hasFireplace;
  bool? hasBasement;
  List<dynamic>? reviews;
  List<dynamic>? likedUsers;
  String? alley;
  int? poolArea;
  int? garageCars;
  String? garageFinish;
  String? garageType;
  String? garageQual;
  int? fireplaces;
  String? fireplaceQu;
  String? bsmtExposure;
  String? bsmtFinType1;
  String? bsmtCond;
  String? bsmtQual;
  int? bsmtUnfSf;
  String? masVnrType;
  int? masVnrArea;
  int? msSubClass;
  int? totalporchsf;
  int? lotFrontage;
  int? lotArea;
  int? lowQualFinSf;
  int? miscVal;
  int? totalsf;
  int? totalarea;
  int? totalbaths;
  int? houseage;
  int? houseremodelage;
  List<dynamic>? images;
  String? createdAt;
  String? updatedAt;
  int? kitchenAbvGr;
  int? bedroomAbvGr;
  String? kitchenQual;
  int? totRmsAbvGrd;

  Residence({
    this.isLiked,
    this.location,
    this.id,
    this.ownerId,
    this.isSold,
    this.isCompleted,
    this.status,
    this.avgRating,
    this.title,
    this.type,
    this.category,
    this.hasGarage,
    this.hasFireplace,
    this.hasBasement,
    this.reviews,
    this.likedUsers,
    this.alley,
    this.poolArea,
    this.garageCars,
    this.garageFinish,
    this.garageType,
    this.garageQual,
    this.fireplaces,
    this.fireplaceQu,
    this.bsmtExposure,
    this.bsmtFinType1,
    this.bsmtCond,
    this.bsmtQual,
    this.bsmtUnfSf,
    this.masVnrType,
    this.masVnrArea,
    this.msSubClass,
    this.totalporchsf,
    this.lotFrontage,
    this.lotArea,
    this.lowQualFinSf,
    this.miscVal,
    this.totalsf,
    this.totalarea,
    this.totalbaths,
    this.houseage,
    this.houseremodelage,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.kitchenAbvGr,
    this.bedroomAbvGr,
    this.kitchenQual,
    this.totRmsAbvGrd,
  });

  factory Residence.fromJson(Map<String, dynamic> json) =>  Residence(
    isLiked: json["isLiked"],
    location: Location.fromJson(json["location"]),
    id: json["_id"],
    ownerId: json["ownerId"],
    isSold: json["isSold"],
    isCompleted: json["isCompleted"],
    status: json["status"],
    avgRating: json["avgRating"],
    title: json["title"],
    type: json["type"],
    category: json["category"],
    hasGarage: json["hasGarage"],
    hasFireplace: json["hasFireplace"],
    hasBasement: json["hasBasement"],
    reviews:  List<dynamic>.from(json["reviews"].map((x) => x)),
    likedUsers:  List<dynamic>.from(json["likedUsers"].map((x) => x)),
    alley: json["alley"],
    poolArea: json["poolArea"],
    garageCars: json["garageCars"],
    garageFinish: json["garageFinish"],
    garageType: json["garageType"],
    garageQual: json["garageQual"],
    fireplaces: json["fireplaces"],
    fireplaceQu: json["fireplaceQu"],
    bsmtExposure: json["bsmtExposure"],
    bsmtFinType1: json["bsmtFinType1"],
    bsmtCond: json["bsmtCond"],
    bsmtQual: json["bsmtQual"],
    bsmtUnfSf: json["bsmtUnfSF"],
    masVnrType: json["masVnrType"],
    masVnrArea: json["masVnrArea"],
    msSubClass: json["msSubClass"],
    totalporchsf: json["totalporchsf"],
    lotFrontage: json["lotFrontage"],
    lotArea: json["lotArea"],
    lowQualFinSf: json["lowQualFinSF"],
    miscVal: json["miscVal"],
    totalsf: json["totalsf"],
    totalarea: json["totalarea"],
    totalbaths: json["totalbaths"],
    houseage: json["houseage"],
    houseremodelage: json["houseremodelage"],
    images:  List<dynamic>.from(json["images"].map((x) => x)),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    kitchenAbvGr: json["KitchenAbvGr"],
    bedroomAbvGr: json["bedroomAbvGr"],
    kitchenQual: json["kitchenQual"],
    totRmsAbvGrd: json["totRmsAbvGrd"],
  );

  Map<String, dynamic> toJson() => {
    "isLiked": isLiked,
    "location": location?.toJson(),
    "_id": id,
    "ownerId": ownerId,
    "isSold": isSold,
    "isCompleted": isCompleted,
    "status": status,
    "avgRating": avgRating,
    "title": title,
    "type": type,
    "category": category,
    "hasGarage": hasGarage,
    "hasFireplace": hasFireplace,
    "hasBasement": hasBasement,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "likedUsers": likedUsers == null ? [] : List<dynamic>.from(likedUsers!.map((x) => x)),
    "alley": alley,
    "poolArea": poolArea,
    "garageCars": garageCars,
    "garageFinish": garageFinish,
    "garageType": garageType,
    "garageQual": garageQual,
    "fireplaces": fireplaces,
    "fireplaceQu": fireplaceQu,
    "bsmtExposure": bsmtExposure,
    "bsmtFinType1": bsmtFinType1,
    "bsmtCond": bsmtCond,
    "bsmtQual": bsmtQual,
    "bsmtUnfSF": bsmtUnfSf,
    "masVnrType": masVnrType,
    "masVnrArea": masVnrArea,
    "msSubClass": msSubClass,
    "totalporchsf": totalporchsf,
    "lotFrontage": lotFrontage,
    "lotArea": lotArea,
    "lowQualFinSF": lowQualFinSf,
    "miscVal": miscVal,
    "totalsf": totalsf,
    "totalarea": totalarea,
    "totalbaths": totalbaths,
    "houseage": houseage,
    "houseremodelage": houseremodelage,
    "images":  images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "KitchenAbvGr": kitchenAbvGr,
    "bedroomAbvGr": bedroomAbvGr,
    "kitchenQual": kitchenQual,
    "totRmsAbvGrd": totRmsAbvGrd,
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>  Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}
