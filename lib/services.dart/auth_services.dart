import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_2/presentation/pages/widgets/BodyView.dart';
//import 'package:flutter_application_2/services/firestore_services.dart';
import 'package:get/get.dart';

import 'firestore_services.dart';

// import '../presentation/pages/Profile/widgets/profileview.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreService = FirestoreService();

  Future<void> creatUser(Map<String, dynamic> data, context) async {
    var createAt = DateTime.now().millisecond;
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );

      var userData = {
        "id": credential.user!.uid,
        "create": createAt,
        "bio": "Bio",
        "description": "using instafeed app",
        "url": "google.com",
        "profileUrl":
            "https://tse1.mm.bing.net/th?id=OIP.0_INywwz74o8LLO4Lz7vCAHaEo&pid=Api&P=0&h=180"
      };

      var userDetails = {
        ...data,
        ...userData,
      };

      // data['id'] = credential.user!.uid;
      // data['createAt'] = createAt;
      await firestoreService.addUser(
        userDetails,
        // credential.user!.uid,
      );
      Get.offAllNamed('/');
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sign Up failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future<void> loginUser(data, context) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Get.offAllNamed('/');
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login failed"),
              content: Text(e.toString()),
            );
          });
    }
  }
}
