// To parse this JSON data, do
//
//     final getAllResidencesModel = getAllResidencesModelFromJson(jsonString);

import 'dart:convert';

GetAllResidencesModel getAllResidencesModelFromJson(String str) => GetAllResidencesModel.fromJson(json.decode(str));

String getAllResidencesModelToJson(GetAllResidencesModel data) => json.encode(data.toJson());

class GetAllResidencesModel {
  String? status;
  int? count;
  List<Residence>? residences;

  GetAllResidencesModel({
    this.status,
    this.count,
    this.residences,
  });

  factory GetAllResidencesModel.fromJson(Map<String, dynamic> json) => GetAllResidencesModel(
    status: json["status"],
    count: json["count"],
    residences: json["residences"] == null ? [] : List<Residence>.from(json["residences"]!.map((x) => Residence.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "residences": residences == null ? [] : List<dynamic>.from(residences!.map((x) => x.toJson())),
  };
}

class Residence {
  bool? isLiked;
  ResidenceLocation? location;
  String? id;
  String? title;
  String? category;
  String? status;
  String? type;
  bool? isSold;
  String? paymentPeriod;
  bool? isCompleted;
  bool? hasGarage;
  bool? hasFireplace;
  bool? hasBasement;
  String? createdAt;
  String? updatedAt;
  int? msSubClass;
  String? mszoning;
  int? lotFrontage;
  int? lotArea;
  String? street;
  String? lotShape;
  String? landContour;
  String? utilities;
  String? lotConfig;
  String? landSlope;
  String? neighborhood;
  String? condition1;
  String? condition2;
  String? bldgType;
  String? houseStyle;
  int? overallQual;
  int? overallCond;
  String? roofStyle;
  String? roofMatl;
  String? exterior1St;
  String? exterior2Nd;
  String? masVnrType;
  int? masVnrArea;
  String? exterQual;
  String? exterCond;
  String? foundation;
  String? bsmtQual;
  String? bsmtCond;
  String? bsmtExposure;
  String? bsmtFinType1;
  int? bsmtUnfSf;
  String? heating;
  String? heatingQc;
  String? centralAir;
  String? electrical;
  int? lowQualFinSf;
  int? bedroomAbvGr;
  int? kitchenAbvGr;
  String? kitchenQual;
  int? totRmsAbvGrd;
  String? functional;
  int? fireplaces;
  String? garageType;
  String? garageFinish;
  int? garageCars;
  String? garageQual;
  String? pavedDrive;
  int? poolArea;
  int? miscVal;
  int? moSold;
  String? saleType;
  String? saleCondition;
  double? salePrice;
  int? houseage;
  int? houseremodelage;
  int? totalsf;
  int? totalarea;
  double? totalbaths;
  int? totalporchsf;
  List<ImageElement>? images;
  String? alley;
  List<dynamic>? likedUsers;
  List<Review>? reviews;
  int? avgRating;
  String? fireplaceQu;

  Residence({
    this.isLiked,
    this.location,
    this.id,
    this.title,
    this.category,
    this.status,
    this.type,
    this.isSold,
    this.paymentPeriod,
    this.isCompleted,
    this.hasGarage,
    this.hasFireplace,
    this.hasBasement,
    this.createdAt,
    this.updatedAt,
    this.msSubClass,
    this.mszoning,
    this.lotFrontage,
    this.lotArea,
    this.street,
    this.lotShape,
    this.landContour,
    this.utilities,
    this.lotConfig,
    this.landSlope,
    this.neighborhood,
    this.condition1,
    this.condition2,
    this.bldgType,
    this.houseStyle,
    this.overallQual,
    this.overallCond,
    this.roofStyle,
    this.roofMatl,
    this.exterior1St,
    this.exterior2Nd,
    this.masVnrType,
    this.masVnrArea,
    this.exterQual,
    this.exterCond,
    this.foundation,
    this.bsmtQual,
    this.bsmtCond,
    this.bsmtExposure,
    this.bsmtFinType1,
    this.bsmtUnfSf,
    this.heating,
    this.heatingQc,
    this.centralAir,
    this.electrical,
    this.lowQualFinSf,
    this.bedroomAbvGr,
    this.kitchenAbvGr,
    this.kitchenQual,
    this.totRmsAbvGrd,
    this.functional,
    this.fireplaces,
    this.garageType,
    this.garageFinish,
    this.garageCars,
    this.garageQual,
    this.pavedDrive,
    this.poolArea,
    this.miscVal,
    this.moSold,
    this.saleType,
    this.saleCondition,
    this.salePrice,
    this.houseage,
    this.houseremodelage,
    this.totalsf,
    this.totalarea,
    this.totalbaths,
    this.totalporchsf,
    this.images,
    this.alley,
    this.likedUsers,
    this.reviews,
    this.avgRating,
    this.fireplaceQu,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    isLiked: json["isLiked"],
    location: json["location"] == null ? null : ResidenceLocation.fromJson(json["location"]),
    id: json["_id"],
    title: json["title"],
    category: json["category"],
    status: json["status"],
    type: json["type"],
    isSold: json["isSold"],
    paymentPeriod:json["paymentPeriod"],
    isCompleted: json["isCompleted"],
    hasGarage: json["hasGarage"],
    hasFireplace: json["hasFireplace"],
    hasBasement: json["hasBasement"],
    createdAt: json["createdAt"] ,
    updatedAt: json["updatedAt"] ,
    msSubClass: json["msSubClass"],
    mszoning: json["mszoning"],
    lotFrontage: json["lotFrontage"],
    lotArea: json["lotArea"],
    street: json["street"],
    lotShape: json["lotShape"],
    landContour: json["landContour"],
    utilities: json["utilities"],
    lotConfig: json["lotConfig"],
    landSlope: json["landSlope"],
    neighborhood: json["neighborhood"],
    condition1: json["condition1"],
    condition2: json["condition2"],
    bldgType: json["bldgType"],
    houseStyle: json["houseStyle"],
    overallQual: json["overallQual"],
    overallCond: json["overallCond"],
    roofStyle: json["roofStyle"],
    roofMatl: json["roofMatl"],
    exterior1St: json["exterior1st"],
    exterior2Nd: json["exterior2nd"],
    masVnrType: json["masVnrType"],
    masVnrArea: json["masVnrArea"],
    exterQual: json["exterQual"],
    exterCond: json["exterCond"],
    foundation: json["foundation"],
    bsmtQual:json["bsmtQual"],
    bsmtCond: json["bsmtCond"],
    bsmtExposure: json["bsmtExposure"],
    bsmtFinType1: json["bsmtFinType1"],
    bsmtUnfSf: json["bsmtUnfSF"],
    heating: json["heating"],
    heatingQc: json["heatingQc"],
    centralAir: json["centralAir"],
    electrical: json["electrical"],
    lowQualFinSf: json["lowQualFinSF"],
    bedroomAbvGr: json["bedroomAbvGr"],
    kitchenAbvGr: json["kitchenAbvGr"],
    kitchenQual: json["kitchenQual"],
    totRmsAbvGrd: json["totRmsAbvGrd"],
    functional: json["Functional"],
    fireplaces: json["fireplaces"],
    garageType: json["garageType"],
    garageFinish:json["garageFinish"],
    garageCars: json["garageCars"],
    garageQual: json["garageQual"],
    pavedDrive: json["pavedDrive"],
    poolArea: json["poolArea"],
    miscVal: json["miscVal"],
    moSold: json["moSold"],
    saleType: json["saleType"],
    saleCondition:json["saleCondition"],
    salePrice: json["salePrice"]?.toDouble(),
    houseage: json["houseage"],
    houseremodelage: json["houseremodelage"],
    totalsf: json["totalsf"],
    totalarea: json["totalarea"],
    totalbaths: json["totalbaths"]?.toDouble(),
    totalporchsf: json["totalporchsf"],
    images: json["images"] == null ? [] : List<ImageElement>.from(json["images"]!.map((x) => ImageElement.fromJson(x))),
    alley: json["alley"],
    likedUsers: json["likedUsers"] == null ? [] : List<dynamic>.from(json["likedUsers"]!.map((x) => x)),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    avgRating: json["avgRating"],
    fireplaceQu: json["fireplaceQu"],
  );

  Map<String, dynamic> toJson() => {
    "isLiked": isLiked,
    "location": location?.toJson(),
    "_id": id,
    "title": title,
    "category": category,
    "status": status,
    "type": type,
    "isSold": isSold,
    "paymentPeriod":paymentPeriod,
    "isCompleted": isCompleted,
    "hasGarage": hasGarage,
    "hasFireplace": hasFireplace,
    "hasBasement": hasBasement,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "msSubClass": msSubClass,
    "mszoning": mszoning,
    "lotFrontage": lotFrontage,
    "lotArea": lotArea,
    "street": street,
    "lotShape": lotShape,
    "landContour": landContour,
    "utilities": utilities,
    "lotConfig": lotConfig,
    "landSlope": landSlope,
    "neighborhood": neighborhood,
    "condition1": condition1,
    "condition2": condition2,
    "bldgType": bldgType,
    "houseStyle": houseStyle,
    "overallQual": overallQual,
    "overallCond": overallCond,
    "roofStyle": roofStyle,
    "roofMatl": roofMatl,
    "exterior1st": exterior1St,
    "exterior2nd": exterior2Nd,
    "masVnrType": masVnrType,
    "masVnrArea": masVnrArea,
    "exterQual": exterQual,
    "exterCond": exterCond,
    "foundation": foundation,
    "bsmtQual": bsmtQual,
    "bsmtCond": bsmtCond,
    "bsmtExposure": bsmtExposure,
    "bsmtFinType1": bsmtFinType1,
    "bsmtUnfSF": bsmtUnfSf,
    "heating": heating,
    "heatingQc":heatingQc,
    "centralAir": centralAir,
    "electrical": electrical,
    "lowQualFinSF": lowQualFinSf,
    "bedroomAbvGr": bedroomAbvGr,
    "kitchenAbvGr": kitchenAbvGr,
    "kitchenQual": kitchenQual,
    "totRmsAbvGrd": totRmsAbvGrd,
    "Functional": functional,
    "fireplaces": fireplaces,
    "garageType": garageType,
    "garageFinish": garageFinish,
    "garageCars": garageCars,
    "garageQual": garageQual,
    "pavedDrive": pavedDrive,
    "poolArea": poolArea,
    "miscVal": miscVal,
    "moSold": moSold,
    "saleType":saleType,
    "saleCondition": saleCondition,
    "salePrice": salePrice,
    "houseage": houseage,
    "houseremodelage": houseremodelage,
    "totalsf": totalsf,
    "totalarea": totalarea,
    "totalbaths": totalbaths,
    "totalporchsf": totalporchsf,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "alley": alley,
    "likedUsers": likedUsers == null ? [] : List<dynamic>.from(likedUsers!.map((x) => x)),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    "avgRating": avgRating,
    "fireplaceQu": fireplaceQu,
  };
}



class ImageElement {
  String? id;
  String? url;

  ImageElement({
    this.id,
    this.url,
  });

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
    id: json["_id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "url": url,
  };
}





class ResidenceLocation {
  String? type;
  List<double>? coordinates;
  String? fullAddress;
  String? city;
  String? state;
  String? country;

  ResidenceLocation({
    this.type,
    this.coordinates,
    this.fullAddress,
    this.city,
    this.state,
    this.country,
  });

  factory ResidenceLocation.fromJson(Map<String, dynamic> json) => ResidenceLocation(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    fullAddress: json["fullAddress"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    "fullAddress": fullAddress,
    "city": city,
    "state": state,
    "country": country,
  };
}



class Review {
  int? unLikes;
  String? id;
  String? residenceId;
  String? userId;
  int? rating;
  int? reviewLikes;
  List<dynamic>? likedBy;
  String? createdAt;
  String? updatedAt;
  int? v;

  Review({
    this.unLikes,
    this.id,
    this.residenceId,
    this.userId,
    this.rating,
    this.reviewLikes,
    this.likedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    unLikes: json["unLikes"],
    id: json["_id"],
    residenceId: json["residenceId"],
    userId: json["userId"] ,
    rating: json["rating"],
    reviewLikes: json["reviewLikes"],
    likedBy: json["likedBy"] == null ? [] : List<dynamic>.from(json["likedBy"]!.map((x) => x)),
    createdAt: json["createdAt"] ,
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "unLikes": unLikes,
    "_id": id,
    "residenceId": residenceId,
    "userId": userId,
    "rating": rating,
    "reviewLikes": reviewLikes,
    "likedBy": likedBy == null ? [] : List<dynamic>.from(likedBy!.map((x) => x)),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class UserId {
  UserIdImage? image;
  UserIdLocation? location;
  String? id;
  String? username;

  UserId({
    this.image,
    this.location,
    this.id,
    this.username,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    image: json["image"] == null ? null : UserIdImage.fromJson(json["image"]),
    location: json["location"] == null ? null : UserIdLocation.fromJson(json["location"]),
    id: json["_id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "image": image?.toJson(),
    "location": location?.toJson(),
    "_id": id,
    "username": username,
  };
}

class UserIdImage {
  String? url;
  String? publicId;

  UserIdImage({
    this.url,
    this.publicId,
  });

  factory UserIdImage.fromJson(Map<String, dynamic> json) => UserIdImage(
    url: json["url"],
    publicId: json["public_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "public_id": publicId,
  };
}

class UserIdLocation {
  String? fullAddress;

  UserIdLocation({
    this.fullAddress,
  });

  factory UserIdLocation.fromJson(Map<String, dynamic> json) => UserIdLocation(
    fullAddress: json["fullAddress"],
  );

  Map<String, dynamic> toJson() => {
    "fullAddress": fullAddress,
  };
}








