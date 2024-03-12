import 'package:flutter/material.dart';

class constant {
  var primarycolor = const Color.fromARGB(255, 6, 95, 52);

  var subHeadingStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 209, 255, 7));
  String fun1(String name) {
    var t = "Hii $name";
    return t;
  }
}
