import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  // CollectionReference Des =
  //     FirebaseFirestore.instance.collection('description');
  CollectionReference tag = FirebaseFirestore.instance.collection('tags');
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  CollectionReference stories =
      FirebaseFirestore.instance.collection('stories');
  CollectionReference likes = FirebaseFirestore.instance.collection('likes');
  // addPost() async {
  //   var postData = {"title": "thdbdbb", "des": "thdbdbb"};

  //   await post.add(postData);
  // }

  // Future<void> addUser(data, id) {
  //   return users
  //       .doc('id')
  //       .set(data)
  //       .then((value) => print("user added"))
  //       .catchError((Error) => print("failed to add user:$Error"));
  // }

  Future<void> addUser(data) async {
    try {
      await users.doc(data['id']).set(data);
      // .then((value) => print("user added"));
    } catch (error) {
      print("Failed to add user : $error");
      throw error;
    }
  }

  Future<void> updateUser(data, id) {
    return users
        .doc(id)
        .update(data)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  fetchUsers() async {
    try {
      var dataList = [];
      await users.get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          dataList.add(doc.data());
        }
      });
      return dataList;
    } catch (error) {
      print("Error fetching user : $error");
      return [];
    }
  }

  getUser(userId) async {
    var userData = {};
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        userData = documentSnapshot.data() as Map<String, dynamic>;
        print('Document exists on the database');
      } else {
        userData = {};
      }
    });
    return userData;
  }

  Future<void> deleteUser(id) {
    return users
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> updateProfile(data, context) async {
    try {
      await users.doc(data['id']).update(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Account Updated")));
    } catch (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Updation failed"),
              content: Text(error.toString()),
            );
          });
      throw error;
    }
  }

  // Future<void> addDescription(data) async {
  //   try {
  //     await Des.doc().set(data);
  //   } catch (error) {
  //     print("Failed to add user : $error");
  //     throw error;
  //   }
  // }

  Future<void> addTag(data1) async {
    try {
      await tag.doc().set(data1);
    } catch (error) {
      print("Failed to add user : $error");
      throw error;
    }
  }

  Future<String> uploadFile(File selectedFile) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);

    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<void> addPost(postData) async {
    try {
      await posts.doc(postData['id']).set(postData);
    } catch (error) {
      print("Failed to add user : $error");
      throw error;
    }
  }

  Future<List<Map<String, dynamic>>> getPost() async {
    List<Map<String, dynamic>> postData = [];
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          postData.add(doc.data() as Map<String, dynamic>);
        });
      });
      return postData;
    } catch (e) {
      return [];
    }
  }

  Future<void> addStory(storyData) async {
    try {
      await stories.doc(storyData['id']).set(storyData);
    } catch (error) {
      print("Failed to add user : $error");
      throw error;
    }
  }

  Future<List<Map<String, dynamic>>> getStory() async {
    List<Map<String, dynamic>> storyData = [];
    try {
      await FirebaseFirestore.instance
          .collection('stories')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          storyData.add(doc.data() as Map<String, dynamic>);
        });
      });
      return storyData;
    } catch (e) {
      return [];
    }
  }

  Future<bool> checkDocumentExists(postId, userId) async {
    try {
      DocumentSnapshot snapshot =
          await posts.doc(postId).collection("likes").doc(userId).get();
      return snapshot.exists;
    } catch (e) {
      return false;
    }
  }

  islike(value, postId, userId) async {
    if (value) {
      var data = {
        "likeAt": DateTime.timestamp(),
        "postId": postId,
        "userId": userId,
      };
      await posts.doc(postId).collection("likes").doc(userId).set(data);
      await posts.doc(postId).update({"likesCount": FieldValue.increment(1)});
    } else {
      await posts.doc(postId).collection("likes").doc(userId).delete();
      await posts.doc(postId).update({"likesCount": FieldValue.increment(-1)});
    }
  }
}
