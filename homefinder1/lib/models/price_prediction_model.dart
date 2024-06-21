// To parse this JSON data, do
//
//     final pricePeridectionModel = pricePeridectionModelFromJson(jsonString);

import 'dart:convert';

PricePeridectionModel pricePeridectionModelFromJson(String str) => PricePeridectionModel.fromJson(json.decode(str));

String pricePeridectionModelToJson(PricePeridectionModel data) => json.encode(data.toJson());

class PricePeridectionModel {
  String? status;
  int? predictedPrice;
  Residence? residence;

  PricePeridectionModel({
    this.status,
    this.predictedPrice,
    this.residence,
  });

  factory PricePeridectionModel.fromJson(Map<String, dynamic> json) => PricePeridectionModel(
    status: json["status"],
    predictedPrice: json["predictedPrice"],
    residence: json["residence"] == null ? null : Residence.fromJson(json["residence"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "predictedPrice": predictedPrice,
    "residence": residence?.toJson(),
  };
}

class Residence {
  String? residenceId;
  int? id;
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
  String? fireplaceQu;
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
  int? totalbaths;
  int? totalporchsf;
  String? alley;

  Residence({
    this.residenceId,
    this.id,
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
    this.fireplaceQu,
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
    this.alley,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
    residenceId: json["_id"],
    id: json["Id"],
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
    bsmtQual: json["bsmtQual"],
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
    fireplaceQu: json["fireplaceQu"],
    garageType: json["garageType"],
    garageFinish: json["garageFinish"],
    garageCars: json["garageCars"],
    garageQual: json["garageQual"],
    pavedDrive: json["pavedDrive"],
    poolArea: json["poolArea"],
    miscVal: json["miscVal"],
    moSold: json["moSold"],
    saleType: json["saleType"],
    saleCondition: json["saleCondition"],
    salePrice: json["salePrice"]?.toDouble(),
    houseage: json["houseage"],
    houseremodelage: json["houseremodelage"],
    totalsf: json["totalsf"],
    totalarea: json["totalarea"],
    totalbaths: json["totalbaths"],
    totalporchsf: json["totalporchsf"],
    alley: json["alley"],
  );

  Map<String, dynamic> toJson() => {
    "_id": residenceId,
    "Id": id,
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
    "heatingQc": heatingQc,
    "centralAir": centralAir,
    "electrical": electrical,
    "lowQualFinSF": lowQualFinSf,
    "bedroomAbvGr": bedroomAbvGr,
    "kitchenAbvGr": kitchenAbvGr,
    "kitchenQual": kitchenQual,
    "totRmsAbvGrd": totRmsAbvGrd,
    "Functional": functional,
    "fireplaces": fireplaces,
    "fireplaceQu": fireplaceQu,
    "garageType": garageType,
    "garageFinish": garageFinish,
    "garageCars": garageCars,
    "garageQual": garageQual,
    "pavedDrive": pavedDrive,
    "poolArea": poolArea,
    "miscVal": miscVal,
    "moSold": moSold,
    "saleType": saleType,
    "saleCondition": saleCondition,
    "salePrice": salePrice,
    "houseage": houseage,
    "houseremodelage": houseremodelage,
    "totalsf": totalsf,
    "totalarea": totalarea,
    "totalbaths": totalbaths,
    "totalporchsf": totalporchsf,
    "alley": alley,
  };
}
