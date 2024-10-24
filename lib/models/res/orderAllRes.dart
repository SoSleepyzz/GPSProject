// orderAllResDart.dart

import 'dart:convert';

List<OrderAllResDart> orderAllResDartFromJson(String str) => List<OrderAllResDart>.from(json.decode(str).map((x) => OrderAllResDart.fromJson(x)));

String orderAllResDartToJson(List<OrderAllResDart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderAllResDart {
    int odId;
    int oId;
    String image;
    int status;

    OrderAllResDart({
        required this.odId,
        required this.oId,
        required this.image,
        required this.status,
    });

    factory OrderAllResDart.fromJson(Map<String, dynamic> json) => OrderAllResDart(
        odId: json["odID"],
        oId: json["oID"],
        image: json["image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "odID": odId,
        "oID": oId,
        "image": image,
        "status": status,
    };
}

class OrderDetails {
  final String senderName;
  final String recipientName;
  final String riderName;
  final List<OrderAllResDart> images;

  OrderDetails({
    required this.senderName,
    required this.recipientName,
    required this.riderName,
    required this.images,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      senderName: json['sender_name'],
      recipientName: json['recipient_name'],
      riderName: json['rider_name'],
      images: List<OrderAllResDart>.from(json['images'].map((x) => OrderAllResDart.fromJson(x))),
    );
  }
}
