import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth.dart/user_model.dart';
import 'package:flutter_application_2/auth.dart/users.dart';

import 'package:uuid/uuid.dart';


import '../services.dart/auth_services.dart';
import '../services.dart/firestore_services.dart';
import '../services.dart/userServices.dart';
import '../services.dart/validator.dart';

class EditUserData extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  EditUserData({super.key, required this.data});

  // final String userId;
  final User data;

  @override
  State<EditUserData> createState() => EditUserDataState();
}

class EditUserDataState extends State<EditUserData> {
  var appvalidator = AppValidator();
  var authServices = AuthService();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  var isLoader = false;
  var db = FirestoreService();
  var uuid = Uuid();

  singleUser() async {
    //var userData = await db.getUser(userId);
    setState(() {
      _userNameController.text = widget.data.userName ?? "";
      _emailController.text = widget.data.email ?? "";
      _phoneController.text = widget.data.phone.toString() ?? "";
      _passwordController.text = widget.data.password ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    singleUser();
  }

  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
    });
    if (_formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "email": _emailController.text,
        "phone": _phoneController.text,
        "userName": _userNameController.text,
        "password": _passwordController.text,
      };
      // await db.addUser(data, id);

      //await db.updateUser(data, widget.userId);
      var response = await UserServices.updateUsers(data, widget.data.id);
      setState(() {
        isLoader = false;
      });
      ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Account Updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.black,
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => Login()),
                  //         );
                  //       },
                  //       child: Text(
                  //         "<--",
                  //         style: TextStyle(color: Colors.white),
                  //       )),
                  // ),
                  Text(
                    "Update Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Color.fromARGB(255, 35, 34, 34),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    obscureText: !_isPasswordVisible,
                    validator: appvalidator.validatePassword,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: _submitForm,
                      child: isLoader
                          ? Center(child: CircularProgressIndicator())
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

                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Users()),
                        );
                      },
                      child: isLoader
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                              "View All",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                      //color: Colors.red,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
