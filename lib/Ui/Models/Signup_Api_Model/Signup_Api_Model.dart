// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

WelcomeS welcomeSFromJson(String str) => WelcomeS.fromJson(json.decode(str));

String welcomeSToJson(WelcomeS data) => json.encode(data.toJson());

class WelcomeS {
  WelcomeS({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory WelcomeS.fromJson(Map<String, dynamic> json) => WelcomeS(
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
    required this.name,
    required this.id,
    required this.email,
    required this.type,
  });

  String name;
  int id;
  String email;
  int type;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    id: json["id"],
    email: json["email"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "email": email,
    "type": type,
  };
}
