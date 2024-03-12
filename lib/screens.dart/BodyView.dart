import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens.dart/search_view.dart';

import '../post.dart/post_view.dart';
import '../profile.dart/profile_view.dart';
import 'home_view.dart';
import 'navBar.dart';


class BodyView extends StatefulWidget {
  const BodyView({super.key});

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  int currentIndex = 0;
  var pageViewList = [
    HomeView(),
    //PHome1(),
    SearchView(),
    //ExplorePage(),
    //PostPage(),
    PostView(),
    //ReelPage(),
    //ProfilePage(),
    //Profile1(),
    ProfileView(userId: FirebaseAuth.instance.currentUser!.uid),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
      ),
      body: pageViewList[currentIndex],
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
