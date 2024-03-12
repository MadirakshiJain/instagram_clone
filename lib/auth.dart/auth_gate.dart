//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_2/presentation/pages/auth/pageview.dart';
//import 'package:flutter_application_2/presentation/pages/widgets/BodyView.dart';
//import 'package:flutter_application_2/auth/login.dart';
//import 'package:flutter_application_2/presentation/pages/auth/sign_up.dart';
//import 'package:flutter_application_2/presentation/pages/widgets/BodyView.dart';

import '../screens.dart/BodyView.dart';
import '../screens.dart/pageview.dart';
//import 'package:flutter_application_2/pageview.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      checkAuthState();
    });
    super.initState();
  }

  void checkAuthState() {
    User? user = _auth.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => BodyView())));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => PageView1())));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
