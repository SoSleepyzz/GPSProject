// To parse this JSON data, do
//
//     final userLoginReqDart = userLoginReqDartFromJson(jsonString);

import 'dart:convert';

UserLoginReqDart userLoginReqDartFromJson(String str) => UserLoginReqDart.fromJson(json.decode(str));

String userLoginReqDartToJson(UserLoginReqDart data) => json.encode(data.toJson());

class UserLoginReqDart {
    String phone;
    String password;

    UserLoginReqDart({
        required this.phone,
        required this.password,
    });

    factory UserLoginReqDart.fromJson(Map<String, dynamic> json) => UserLoginReqDart(
        phone: json["Phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "Phone": phone,
        "password": password,
    };
}
