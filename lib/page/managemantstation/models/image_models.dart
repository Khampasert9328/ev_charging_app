// To parse this JSON data, do
//
//     final uploadimageModels = uploadimageModelsFromJson(jsonString);

import 'dart:convert';

UploadimageModels uploadimageModelsFromJson(String str) => UploadimageModels.fromJson(json.decode(str));

String uploadimageModelsToJson(UploadimageModels data) => json.encode(data.toJson());

class UploadimageModels {
    String urlImage;
    String imageKey;
    String message;

    UploadimageModels({
        required this.urlImage,
        required this.imageKey,
        required this.message,
    });

    factory UploadimageModels.fromJson(Map<String, dynamic> json) => UploadimageModels(
        urlImage: json["urlImage"],
        imageKey: json["imageKey"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "urlImage": urlImage,
        "imageKey": imageKey,
        "message": message,
    };
}
