// To parse this JSON data, do
//
//     final userLoginResDart = userLoginResDartFromJson(jsonString);

import 'dart:convert';

UserLoginResDart userLoginResDartFromJson(String str) => UserLoginResDart.fromJson(json.decode(str));

String userLoginResDartToJson(UserLoginResDart data) => json.encode(data.toJson());

class UserLoginResDart {
    int id;
    int type;

    UserLoginResDart({
        required this.id,
        required this.type,
    });

    factory UserLoginResDart.fromJson(Map<String, dynamic> json) => UserLoginResDart(
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
    };
}
