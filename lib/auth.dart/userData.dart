import 'dart:convert';


import 'package:flutter_application_2/auth.dart/user_model.dart';
import 'package:http/http.dart' as http;



class UserServices {
  static Future<List<User>> fetchUsers() async {
    final response = await http
        .get(Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users1"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      print("${jsonData}");

      return jsonData.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<bool> postUsers(data) async {
    final response = await http.post(
        Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users1"),
        body: data);
    print("code ${response.statusCode}");

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<bool> updateUsers(data, id) async {
    final response = await http.put(
        Uri.parse("https://64d62912754d3e0f1361b4a8.mockapi.io/users1/$id"),
        body: data);
    print("code ${response.statusCode}");

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
