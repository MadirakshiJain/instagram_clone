// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String? email;
  String? userName;
  dynamic phone;
  String? id;
  String? password;

  User({
    this.email,
    this.userName,
    this.phone,
    this.id,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        userName: json["userName"],
        phone: json["phone"],
        id: json["id"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "userName": userName,
        "phone": phone,
        "id": id,
        "password": password,
      };
}
