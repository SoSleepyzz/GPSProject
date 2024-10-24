// To parse this JSON data, do
//
//     final riderAllResDart = riderAllResDartFromJson(jsonString);

import 'dart:convert';

List<RiderAllResDart> riderAllResDartFromJson(String str) => List<RiderAllResDart>.from(json.decode(str).map((x) => RiderAllResDart.fromJson(x)));

String riderAllResDartToJson(List<RiderAllResDart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RiderAllResDart {
    int rId;
    String fname;
    String lname;
    String phone;
    String image;
    String plate;
    String password;
    int type;

    RiderAllResDart({
        required this.rId,
        required this.fname,
        required this.lname,
        required this.phone,
        required this.image,
        required this.plate,
        required this.password,
        required this.type,
    });

    factory RiderAllResDart.fromJson(Map<String, dynamic> json) => RiderAllResDart(
        rId: json["rID"],
        fname: json["Fname"],
        lname: json["Lname"],
        phone: json["Phone"],
        image: json["image"],
        plate: json["plate"],
        password: json["Password"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "rID": rId,
        "Fname": fname,
        "Lname": lname,
        "Phone": phone,
        "image": image,
        "plate": plate,
        "Password": password,
        "type": type,
    };
}
