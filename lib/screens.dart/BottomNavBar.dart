import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens.dart/search_view.dart';

import '../post.dart/post_view.dart';
import '../profile.dart/profile_view.dart';
import 'home_view.dart';
// import 'package:flutter_application_2/presentation/pages/home/home_view.dart';
// import 'package:flutter_application_2/presentation/pages/search/search_view.dart';
// import 'package:flutter_application_2/presentation/pages/upload_post/post_view.dart';
// import 'package:flutter_application_2/reelspage.dart';

// import '../Profile/widgets/profileview.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  var pageviewList = [
    HomeView(),
    SearchView(),
    PostView(),
    // ReelPage(),
    ProfileView(userId: FirebaseAuth.instance.currentUser!.uid),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageviewList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_search,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              label: ""),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.play_circle,
          //       color: Colors.white,
          //     ),
          //     label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              label: ""),
        ],
        onTap: (Index) {
          setState(() {
            _currentIndex = Index;
          });
        },
      ),
    );
  }
}
