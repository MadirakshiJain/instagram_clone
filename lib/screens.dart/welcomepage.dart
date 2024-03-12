import 'package:flutter/material.dart';
import 'package:get/get.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 600,
            height: 900,
            child: Image.asset("assets/images/welcomescreen.png",
                fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 100,
              child: IconButton(
                  onPressed: () {
                    Get.offAllNamed('/onboarding');
                    // Get.offAllNamed('/apiForm');
                  },
                  icon: Icon(
                    Icons.arrow_right_alt,
                    color: const Color.fromARGB(255, 7, 65, 166),
                    size: 35,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
