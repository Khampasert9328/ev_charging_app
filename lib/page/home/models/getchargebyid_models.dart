// To parse this JSON data, do
//
//     final getChargeByIdModels = getChargeByIdModelsFromJson(jsonString);

import 'dart:convert';

GetChargeByIdModels getChargeByIdModelsFromJson(String str) => GetChargeByIdModels.fromJson(json.decode(str));

String getChargeByIdModelsToJson(GetChargeByIdModels data) => json.encode(data.toJson());

class GetChargeByIdModels {
    Data data;

    GetChargeByIdModels({
        required this.data,
    });

    factory GetChargeByIdModels.fromJson(Map<String, dynamic> json) => GetChargeByIdModels(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    String id;
    String name;
    String imagecpn;
    int amount;
    String pictureplace;
    String province;
    String district;
    String village;
    String nameplace;
    double latLocation;
    double lngLacation;
    List<Constainner> constainner;
    List<Facility> facilities;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Data({
        required this.id,
        required this.name,
        required this.imagecpn,
        required this.amount,
        required this.pictureplace,
        required this.province,
        required this.district,
        required this.village,
        required this.nameplace,
        required this.latLocation,
        required this.lngLacation,
        required this.constainner,
        required this.facilities,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        imagecpn: json["imagecpn"],
        amount: json["amount"],
        pictureplace: json["pictureplace"],
        province: json["province"],
        district: json["district"],
        village: json["village"],
        nameplace: json["nameplace"],
        latLocation: json["lat_location"]?.toDouble(),
        lngLacation: json["lng_lacation"]?.toDouble(),
        constainner: List<Constainner>.from(json["constainner"].map((x) => Constainner.fromJson(x))),
        facilities: List<Facility>.from(json["facilities"].map((x) => Facility.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "imagecpn": imagecpn,
        "amount": amount,
        "pictureplace": pictureplace,
        "province": province,
        "district": district,
        "village": village,
        "nameplace": nameplace,
        "lat_location": latLocation,
        "lng_lacation": lngLacation,
        "constainner": List<dynamic>.from(constainner.map((x) => x.toJson())),
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Constainner {
    String count;
    String brand;
    String generation;
    String model;
    List<TypeCharge> typeCharge;
    String id;

    Constainner({
        required this.count,
        required this.brand,
        required this.generation,
        required this.model,
        required this.typeCharge,
        required this.id,
    });

    factory Constainner.fromJson(Map<String, dynamic> json) => Constainner(
        count: json["count"],
        brand: json["brand"],
        generation: json["generation"],
        model: json["model"],
        typeCharge: List<TypeCharge>.from(json["type_charge"].map((x) => TypeCharge.fromJson(x))),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "brand": brand,
        "generation": generation,
        "model": model,
        "type_charge": List<dynamic>.from(typeCharge.map((x) => x.toJson())),
        "_id": id,
    };
}

class TypeCharge {
    String typeCharging;
    String id;

    TypeCharge({
        required this.typeCharging,
        required this.id,
    });

    factory TypeCharge.fromJson(Map<String, dynamic> json) => TypeCharge(
        typeCharging: json["type_charging"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "type_charging": typeCharging,
        "_id": id,
    };
}

class Facility {
    String facilitie;
    String id;

    Facility({
        required this.facilitie,
        required this.id,
    });

    factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        facilitie: json["facilitie"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "facilitie": facilitie,
        "_id": id,
    };
}
