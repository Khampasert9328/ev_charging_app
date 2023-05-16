// To parse this JSON data, do
//
//     final loginModels = loginModelsFromJson(jsonString);

import 'dart:convert';

LoginModels loginModelsFromJson(String str) => LoginModels.fromJson(json.decode(str));

String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
    String? accessToken;
    ExpiresToken? expiresToken;

    LoginModels({
        this.accessToken,
        this.expiresToken,
    });

    factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
        accessToken: json["access_token"],
        expiresToken: json["expires_token"] == null ? null : ExpiresToken.fromJson(json["expires_token"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expires_token": expiresToken?.toJson(),
    };
}

class ExpiresToken {
    String? role;

    ExpiresToken({
        this.role,
    });

    factory ExpiresToken.fromJson(Map<String, dynamic> json) => ExpiresToken(
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
    };
}
