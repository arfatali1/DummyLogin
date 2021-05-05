// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

WelcomeL welcomeLFromJson(String str) => WelcomeL.fromJson(json.decode(str));

String welcomeLToJson(WelcomeL data) => json.encode(data.toJson());

class WelcomeL {
  WelcomeL({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory WelcomeL.fromJson(Map<String, dynamic> json) => WelcomeL(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.email,
    required this.id,
    required this.name,
    required this.type,
  });

  String email;
  int id;
  String name;
  int type;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "name": name,
        "type": type,
      };
}
