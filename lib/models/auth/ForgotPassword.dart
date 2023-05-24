// To parse this JSON data, do
//
//     final forgotPasswordModels = forgotPasswordModelsFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModels forgotPasswordModelsFromJson(String str) => ForgotPasswordModels.fromJson(json.decode(str));

String forgotPasswordModelsToJson(ForgotPasswordModels data) => json.encode(data.toJson());

class ForgotPasswordModels {
    String? message;
    Data? data;

    ForgotPasswordModels({
        this.message,
        this.data,
    });

    factory ForgotPasswordModels.fromJson(Map<String, dynamic> json) => ForgotPasswordModels(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    String? id;
    String? role;
    String? name;
    String? email;
    String? password;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.id,
        this.role,
        this.name,
        this.email,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        role: json["role"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "name": name,
        "email": email,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
