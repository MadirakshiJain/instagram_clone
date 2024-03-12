import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../post.dart/media_picker.dart';
import '../services.dart/auth_services.dart';
import '../services.dart/firestore_services.dart';
import '../services.dart/validator.dart';

//import 'login.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.userDetails});
  final Map<String, dynamic> userDetails;

  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  var appvalidator = AppValidator();

  var authServices = AuthService();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _userNameController = TextEditingController();
  //final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  //final _descriptionController = TextEditingController();
  final _urlController = TextEditingController();
  final firestoreService = FirestoreService();

  var isLoader = false;
  var isLoaderProfile = false;
  var profileUrl;

  @override
  void initState() {
    setState(() {
      _userNameController.text = widget.userDetails['userName'];
      _emailController.text = widget.userDetails['email'];
      _phoneController.text = widget.userDetails['phone'];
      _bioController.text = widget.userDetails['bio'];
      //_descriptionController.text = widget.userDetails['description'];
      _urlController.text = widget.userDetails['url'];
      profileUrl = widget.userDetails['profileUrl'];
    });
    super.initState();
  }

  var mediapicker = MediaPicker();

  imageUpload() async {
    var imagefile = await mediapicker.ImgPicker();
    if (imagefile != null) {
      uploadFile(File(imagefile));
    }
  }

  uploadFile(File selectedFile) async {
    setState(() {
      isLoaderProfile = true;
    });
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);

    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      setState(() {
        profileUrl = downloadUrl;
      });
      setState(() {
        isLoaderProfile = false;
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoaderProfile = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("uploadTask failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
    });
    if (_formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "id": widget.userDetails['id'],
        "email": _emailController.text,
        "phone": _phoneController.text,
        "userName": _userNameController.text,
        "bio": _bioController.text,
        //"description": _descriptionController.text,
        "profileUrl": profileUrl,
        "url": _urlController.text,
      };
      await firestoreService.updateProfile(data, context);
      setState(() {
        isLoader = false;
      });
      // ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
      //   const SnackBar(content: Text('Account created successfully')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 55, 55),
        title: Text("Update Account"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 4, color: Colors.blueGrey)),
                          child: isLoaderProfile
                              ? Center(child: CircularProgressIndicator())
                              : CircleAvatar(
                                  radius: 45,
                                  backgroundImage: NetworkImage(profileUrl),
                                ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: -15,
                      //   right: 0,
                      //   child: IconButton(
                      //     onPressed: () {
                      //       imageUpload();
                      //     },
                      //     icon: Icon(
                      //       Icons.edit_square,
                      //       color: Colors.red,
                      //     ),
                      //     iconSize: 25,
                      //   ),
                      // ),

                      Positioned(
                        bottom: -15,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            imageUpload();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(Icons.email),
                        iconColor: Colors.white,
                        fillColor: Color.fromARGB(255, 35, 34, 34),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    validator: appvalidator.validateEmail,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Phone No.",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Color.fromARGB(255, 35, 34, 34),
                        filled: true,
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    validator: appvalidator.validatePhoneNumber,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _userNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Color.fromARGB(255, 35, 34, 34),
                        filled: true,
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    validator: appvalidator.validateUsername,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _bioController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "Bio",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Color.fromARGB(255, 35, 34, 34),
                        filled: true,
                        suffixIcon: Icon(Icons.edit_note),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  // TextFormField(
                  //   controller: _descriptionController,
                  //   //keyboardType: TextInputType.multiline,
                  //   decoration: InputDecoration(
                  //       labelText: "Description",
                  //       labelStyle: TextStyle(color: Colors.white),
                  //       iconColor: Colors.white,
                  //       fillColor: Color.fromARGB(255, 35, 34, 34),
                  //       filled: true,
                  //       suffixIcon: Icon(Icons.description),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10.0))),
                  // ),

                  // SizedBox(
                  //   height: 16.0,
                  // ),
                  TextFormField(
                    controller: _urlController,
                    //keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "url",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Color.fromARGB(255, 35, 34, 34),
                        filled: true,
                        suffixIcon: Icon(Icons.link),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: _submitForm,
                      child: isLoader
                          ? Center(
                              child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ))
                          : Text(
                              "Update",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                      //color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
