// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/instahome.dart';
// import 'package:flutter_application_2/profilepage.dart';
// //import 'package:flutter_application_2/profilepage.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int _currentIndex = 0;
//   var _screens = [
//     ProfilePage(),
//     HomeScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _screens[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//             onTap: (i) {
//               setState(() {
//                 _currentIndex = i;
//               });
//             },
//             currentIndex: _currentIndex,
//             items: [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person), label: "Profile"),
//             ]));
//   }
// }
