import 'dart:convert';

//import 'package:flutter_application_2/presentation/pages/auth/users.dart';
import 'package:http/http.dart' as http;

import '../auth.dart/user_model.dart';
//import 'user_model.dart';

class UserServices {
  static Future<List<User>> fetchUsers() async {
    final response = await http
        .get(Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      print("${jsonData}");

      return jsonData.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
// 2nd method to get from api :-

  // static Future<List<User>> fetchUsers() async {
  //   final response = await http
  //       .get(Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users"));

  //   print("code ${response.statusCode}");

  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonData = json.decode(response.body);

  //     var userData = jsonData.map((data) => User.fromJson(data)).toList();

  //     return userData;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  static Future<bool> postUsers(data) async {
    final response = await http.post(
        Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users"),
        body: data);
    print("code ${response.statusCode}");

    if (response.statusCode == 201) {
      //final List<dynamic> jsonData = json.decode(response.body);

      //var userData = jsonData.map((data) => User.fromJson(data)).toList();

      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

// static Future<Map<User,String>> getUsers() async {
//     final response = await http
//         .get(Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users"));

//     if (response.statusCode == 200) {
//       final Map<dynamic,String> jsonData = json.decode(response.body);

//       print("${jsonData}");

//       return jsonData.map<String,dynamic>(Map<(data) => User.fromJson(data)).toString();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

  // Future<User> getUser(int id) async {
  //   final response = await http
  //       .get(Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users"));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonData = json.decode(response.body);

  //    return  User.fromJson(data).toString();

  //   } else
  //      throw Exception('Failed to load data');
  // }
//   Future<User> getUser(int id) async {
//     final response = await http
//         .get(Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users"));

//     if (response.statusCode == 200) {
//       //return userFromJson(response.body);
//       return User.fromJson(response.)
//     } else
//       return null;
//   }

  static Future<bool> updateUsers(data, id) async {
    final response = await http.put(
        Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users/$id"),
        body: data);
    print("code ${response.statusCode}");

    if (response.statusCode == 200) {
      //final List<dynamic> jsonData = json.decode(response.body);

      //var userData = jsonData.map((data) => User.fromJson(data)).toList();

      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
