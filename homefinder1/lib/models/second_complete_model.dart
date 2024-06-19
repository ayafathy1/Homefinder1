// To parse this JSON data, do
//
//     final secondCompleteModel = secondCompleteModelFromJson(jsonString);

import 'dart:convert';

SecondCompleteModel secondCompleteModelFromJson(String str) => SecondCompleteModel.fromJson(json.decode(str));

String secondCompleteModelToJson(SecondCompleteModel data) => json.encode(data.toJson());

class SecondCompleteModel {
  String? status;
  Residence? residence;

  SecondCompleteModel({
    this.status,
    this.residence,
  });

  factory SecondCompleteModel.fromJson(Map<String, dynamic> json) => SecondCompleteModel(
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
  String? residenceId;
  String? ownerId;
  int? id;
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
  List<Image>? images;
  String? createdAt;
  String? updatedAt;
  String? electrical;
  String? foundation;
  String? lotShape;
  int? moSold;
  String? mszoning;
  String? neighborhood;
  String? paymentPeriod;
  String? saleCondition;
  int? salePrice;
  String? saleType;
  String? utilities;
  String? centralAir;
  String? condition1;
  String? condition2;
  String? exterCond;
  String? exterQual;
  String? exterior1St;
  String? exterior2Nd;
  String? heating;
  String? heatingQc;
  String? houseStyle;
  String? roofMatl;
  String? roofStyle;
  String? street;

  Residence({
    this.isLiked,
    this.location,
    this.residenceId,
    this.ownerId,
    this.id,
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
    this.electrical,
    this.foundation,
    this.lotShape,
    this.moSold,
    this.mszoning,
    this.neighborhood,
    this.paymentPeriod,
    this.saleCondition,
    this.salePrice,
    this.saleType,
    this.utilities,
    this.centralAir,
    this.condition1,
    this.condition2,
    this.exterCond,
    this.exterQual,
    this.exterior1St,
    this.exterior2Nd,
    this.heating,
    this.heatingQc,
    this.houseStyle,
    this.roofMatl,
    this.roofStyle,
    this.street,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    isLiked: json["isLiked"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    residenceId: json["_id"],
    ownerId: json["ownerId"],
    id: json["Id"],
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
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    likedUsers: json["likedUsers"] == null ? [] : List<dynamic>.from(json["likedUsers"]!.map((x) => x)),
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
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    electrical: json["electrical"],
    foundation: json["foundation"],
    lotShape: json["lotShape"],
    moSold: json["moSold"],
    mszoning: json["mszoning"],
    neighborhood: json["neighborhood"],
    paymentPeriod: json["paymentPeriod"],
    saleCondition: json["saleCondition"],
    salePrice: json["salePrice"],
    saleType: json["saleType"],
    utilities: json["utilities"],
    centralAir: json["centralAir"],
    condition1: json["condition1"],
    condition2: json["condition2"],
    exterCond: json["exterCond"],
    exterQual: json["exterQual"],
    exterior1St: json["exterior1st"],
    exterior2Nd: json["exterior2nd"],
    heating: json["heating"],
    heatingQc: json["heatingQc"],
    houseStyle: json["houseStyle"],
    roofMatl: json["roofMatl"],
    roofStyle: json["roofStyle"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "isLiked": isLiked,
    "location": location?.toJson(),
    "_id": residenceId,
    "ownerId": ownerId,
    "Id": id,
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
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "electrical": electrical,
    "foundation": foundation,
    "lotShape": lotShape,
    "moSold": moSold,
    "mszoning": mszoning,
    "neighborhood": neighborhood,
    "paymentPeriod": paymentPeriod,
    "saleCondition": saleCondition,
    "salePrice": salePrice,
    "saleType": saleType,
    "utilities": utilities,
    "centralAir": centralAir,
    "condition1": condition1,
    "condition2": condition2,
    "exterCond": exterCond,
    "exterQual": exterQual,
    "exterior1st": exterior1St,
    "exterior2nd": exterior2Nd,
    "heating": heating,
    "heatingQc": heatingQc,
    "houseStyle": houseStyle,
    "roofMatl": roofMatl,
    "roofStyle": roofStyle,
    "street": street,
  };
}

class Image {
  String? url;
  String? publicId;
  String? id;

  Image({
    this.url,
    this.publicId,
    this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    publicId: json["public_id"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
    "_id": id,
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}
