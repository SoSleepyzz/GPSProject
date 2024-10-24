// To parse this JSON data, do
//
//     final userAllResDart = userAllResDartFromJson(jsonString);

import 'dart:convert';

List<UserAllResDart> userAllResDartFromJson(String str) => List<UserAllResDart>.from(json.decode(str).map((x) => UserAllResDart.fromJson(x)));

String userAllResDartToJson(List<UserAllResDart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAllResDart {
    int uId;
    String fname;
    String lname;
    String phone;
    String password;
    String address;
    double lati;
    double longti;
    String image;
    int type;

    UserAllResDart({
        required this.uId,
        required this.fname,
        required this.lname,
        required this.phone,
        required this.password,
        required this.address,
        required this.lati,
        required this.longti,
        required this.image,
        required this.type,
    });

    factory UserAllResDart.fromJson(Map<String, dynamic> json) => UserAllResDart(
        uId: json["uID"],
        fname: json["Fname"],
        lname: json["Lname"],
        phone: json["Phone"],
        password: json["password"],
        address: json["address"],
        lati: json["Lati"]?.toDouble(),
        longti: json["Longti"]?.toDouble(),
        image: json["image"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "uID": uId,
        "Fname": fname,
        "Lname": lname,
        "Phone": phone,
        "password": password,
        "address": address,
        "Lati": lati,
        "Longti": longti,
        "image": image,
        "type": type,
    };
}
