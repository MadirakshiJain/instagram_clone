import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens.dart/navBar.dart';

import '../services.dart/constant.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final constant1 = constant();

  @override
  Widget build(BuildContext context) {
    //int number = 5;
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: 500,
        height: 900,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    //color: Colors.blueGrey,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.arrow_back_sharp),
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => NavBar(onDestinationSelected: (int value) {  }, selectedIndex: ,)),
                                      // );
                                    }),
                              ],
                            ),
                            Text(
                              "Atira",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 2),
                            Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.notifications),
                                    onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 100,
                          width: 100,

                          //alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.red, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 5,
                              )
                            ],
                          ),

                          child: CircleAvatar(
                            radius: 50,
                            foregroundImage: NetworkImage(
                              "http://1.bp.blogspot.com/-DT3FkonsqY8/U6179nHA6PI/AAAAAAAALnA/uEcADFSZz5U/s1600/cute-and-beautiful-girls-wallpapers-058.jpg",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 70,
                          width: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "54",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Posts",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "834",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Followers",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "162",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Following",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          //width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Atira Raji",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          //width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "UI Designer",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Follow",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: constant1.primarycolor,
                                        //padding: EdgeInsets.all(20),
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(width: 2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      //OnPressed Logic
                                    },
                                    icon: const Icon(Icons.share),
                                    label: const Text("share"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
