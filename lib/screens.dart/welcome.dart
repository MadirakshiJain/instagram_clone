import 'package:flutter/material.dart';
//import 'package:flutter_application_2/presentation/pages/auth/pageview.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 202, 238, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(
            children: [
              // Image.asset(
              //   "assets/images/2.jpg",
              //   height: 100,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       "assets/images/circle.jpg",
              //       height: 100,
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Stack(
              //       children: [
              //         Text(
              //           "Immegram",
              //           style: TextStyle(
              //             fontSize: 50,
              //             fontWeight: FontWeight.bold,
              //             foreground: Paint()
              //               ..style = PaintingStyle.stroke
              //               ..strokeWidth = 10
              //               ..color = const Color.fromARGB(255, 120, 202, 240),
              //             fontStyle: FontStyle.italic,
              //           ),
              //         ),
              //         const Text(
              //           "Immegram",
              //           style: TextStyle(
              //             fontSize: 50,
              //             fontWeight: FontWeight.bold,
              //             color: const Color.fromARGB(255, 0, 69, 125),
              //             fontStyle: FontStyle.italic,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 530,
              // ),
              // // Image.asset(
              //   "assets/images/13.jpg",
              //   height: 120,
              // ),

              Stack(
                children: [
                  Image.asset(
                    "assets/images/Blue and White Simple IU UX Design App (1).png",
                    height: 1200,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),

                            padding: EdgeInsets.all(30),
                            //backgroundColor: Colors.white
                          ),
                          onPressed: () {
                            Get.offAllNamed('/onboarding');
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
