// To parse this JSON data, do
//
//     final sendListResDart = sendListResDartFromJson(jsonString);

import 'dart:convert';

List<SendListResDart> sendListResDartFromJson(String str) => List<SendListResDart>.from(json.decode(str).map((x) => SendListResDart.fromJson(x)));

String sendListResDartToJson(List<SendListResDart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SendListResDart {
    int oId;
    int sId;
    int rId;
    int riId;
    int status;
    String detail;

    SendListResDart({
        required this.oId,
        required this.sId,
        required this.rId,
        required this.riId,
        required this.status,
        required this.detail,
    });

    factory SendListResDart.fromJson(Map<String, dynamic> json) => SendListResDart(
        oId: json["oID"],
        sId: json["sID"],
        rId: json["rID"],
        riId: json["riID"],
        status: json["status"],
        detail: json["Detail"],
    );

    Map<String, dynamic> toJson() => {
        "oID": oId,
        "sID": sId,
        "rID": rId,
        "riID": riId,
        "status": status,
        "Detail": detail,
    };
}
