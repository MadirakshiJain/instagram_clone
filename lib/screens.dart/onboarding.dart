import 'package:flutter/material.dart';
//import 'package:flutter_application_2/homepage.dart';
import 'package:get/get.dart';

import '../auth.dart/login.dart';
//import 'package:flutter_application_2/homepage.dart';
//import 'package:flutter_application_2/homepage.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        width: 500,
        height: 900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                " INSTAGRAM ",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://docs.flutter.dev/assets/images/dash/Dashatars.png',
                    scale: 1,
                    width: 350,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "WELCOME TO THE APP",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      " best quality app space between nxbsbuuyuknxigy dhidihojdojdo welcome to the insta like app  ",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text("SUBMIT"),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.all(20),
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("LOGIN"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.all(20),
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/reels');
                    },
                    child: Text("next"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.all(20),
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //
    );
  }
}
