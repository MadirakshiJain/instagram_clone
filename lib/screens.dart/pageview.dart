import 'package:flutter/material.dart';
//import 'package:flutter_application_2/presentation/pages/auth/login.dart';
import 'package:get/get.dart';
//import 'package:flutter_application_2/sign_up.dart';

class PageView1 extends StatefulWidget {
  PageView1({super.key});

  @override
  State<PageView1> createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  final _pagecontroller = new PageController(initialPage: 0);

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pagecontroller,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                children: [
                  OnbordingScreen(
                    heading: 'and           Fast',
                    headingText: 'Secure ',
                    imageUrl: "assets/images/sicurreimage.jpg",
                    //'https://img.freepik.com/free-vector/abstract-security-protection-digital-data-from-private-key-mobile-data-security-concept-isolated-flat_1150-39299.jpg?w=740&t=st=1690892849~exp=1690893449~hmac=0ca24fbe195cbadfdf0ed71935e21718ebaaf0e7f39da43aa131cbaefb8fe150',
                    paragraph:
                        'This Application is Secure and Fast in Processing. It keeps safe all your data.',
                    subheading: 'Secure  Account',
                  ),
                  OnbordingScreen(
                    heading: 'with your friends',
                    headingText: 'Connect ',
                    imageUrl: ' assets/images/friends.jpg',
                    paragraph:
                        'In this App you can make your friends in all over the world and lets talk with them.',
                    subheading: 'Making  Friends',
                    // imageUrl: 'https://img.freepik.com/premium-vector/refer-friend-concept-with-hand-drawn-people_23-2148279038.jpg?w=900',
                  ),
                  OnbordingScreen(
                    heading: 'your best Moments',
                    headingText: 'Post ',
                    imageUrl: "assets/images/postimage.jpg",
                    paragraph:
                        "In this Application you can share your Photos and Videos with your friends and family.",
                    subheading: 'Create  Post',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        //backgroundColor: const Color.fromARGB(255, 247, 17, 0),
                        backgroundColor: Color.fromARGB(255, 12, 80, 134),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      _currentIndex == 2
                          ? Get.offAllNamed('/login')
                          : _pagecontroller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                    },
                    child: Text(
                      _currentIndex == 2 ? "Get Started" : "Next",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 254, 254),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Icon(Icons.circle,
                        color: index == _currentIndex
                            ? Colors.white
                            : const Color.fromARGB(255, 110, 110, 110));
                  })),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class OnbordingScreen extends StatelessWidget {
  OnbordingScreen(
      {super.key,
      required this.heading,
      required this.subheading,
      required this.headingText,
      required this.paragraph,
      required this.imageUrl});

  final String heading;
  final String subheading;
  final String headingText;
  final String paragraph;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          // Image.network(
          //   "https://cdn.pixabay.com/photo/2016/02/10/20/00/symbol-of-infinity-of-autism-1192408_1280.png",
          //   width: 150,
          //   height: 60,
          // ),
          const SizedBox(
            height: 70,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 250,
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 4, color: Colors.blue),
                ),
              ),
              child: RichText(
                  text: TextSpan(style: TextStyle(fontSize: 30), children: [
                TextSpan(
                    text: headingText, style: TextStyle(color: Colors.blue)),
                TextSpan(text: heading, style: TextStyle(color: Colors.white)),
              ])),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Image.asset("assets/images/secureimage.jpg")
          Image.network(
            imageUrl,
            height: 200,
          ),
          // Image.asset(
          //   imageUrl,
          //   height: 30,
          //   width: 40,
          // ),
          // Image.network(
          //     //"https://firebasestorage.googleapis.com/v0/b/fir-c41ab.appspot.com/o/onboarding2.png?alt=media&token=224cbba6-9cc2-459f-baa5-cd0e154ad0ce&_gl=1*1ilyao7*_ga*MTMyNTIwNzg5Mi4xNjUzMzIzMzkz*_ga_CW55HF8NVT*MTY4NjY0MDc0Ni4xMjcuMC4xNjg2NjQwNzQ2LjAuMC4w",
          //     //  "https://img.freepik.com/premium-vector/refer-friend-concept-with-hand-drawn-people_23-2148279038.jpg?w=900"),
          //     //"https://www.shutterstock.com/image-illustration/3d-social-media-live-streaming-600w-2308091571.jpg"
          //     // "https://img.freepik.com/free-vector/abstract-security-protection-digital-data-from-private-key-mobile-data-security-concept-isolated-flat_1150-39299.jpg?w=740&t=st=1690877298~exp=1690877898~hmac=5e4d5930e25b1c70a7cb0234ec82c69fe9e93285dab723a1d50a49549de4ee3a"
          //     //"https://akm-img-a-in.tosshub.com/sites/cosmo/sites/default/files/inline-images/giphy%20(1)_8.gif?2O.kRNXk1wtP5zUsRs_8ljHtAA7lXezw"
          //     "https://img.freepik.com/free-vector/image-upload-illustration-concept_114360-766.jpg?w=740&t=st=1690886813~exp=1690887413~hmac=cdf5257ed8e4886981ae66f9717c8684ac589b10739d9405d7f68f304fe7cad7"
          //     // "https://img.freepik.com/free-vector/abstract-security-protection-digital-data-from-private-key-mobile-data-security-concept-isolated-flat_1150-39299.jpg?w=740&t=st=1690877298~exp=1690877898~hmac=5e4d5930e25b1c70a7cb0234ec82c69fe9e93285dab723a1d50a49549de4ee3a"
          //
          //sized    ),

          Text(
            subheading,
            style: TextStyle(
              // color: const Color.fromARGB(255, 2, 182, 206),
              // color: Color.fromARGB(255, 46, 112, 255),
              //color: const Color.fromARGB(255, 230, 86, 255),
              color: const Color.fromARGB(255, 122, 191, 247),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            paragraph,
            style: TextStyle(
              //color: Colors.white,
              color: const Color.fromARGB(255, 227, 225, 225),
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
