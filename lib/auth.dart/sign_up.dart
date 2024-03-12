import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth.dart/user_model.dart';
import 'package:flutter_application_2/services.dart/validator.dart';

//import 'package:flutter_application_2/presentation/pages/auth/users.dart';

import 'package:uuid/uuid.dart';


import '../services.dart/auth_services.dart';
import '../services.dart/firestore_services.dart';
import '../services.dart/userServices.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
  List<User> userData = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    setState(() {
      isLoader = true;
    });
    List<User> data = await UserServices.fetchUsers();
    setState(() {
      userData = data;
      isLoader = false;
    });
  }

  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
      // CircularProgressIndicator(
      //   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      // );
    });
    if (_formkey.currentState!.validate()) {
      // var id = uuid.v4();
      Map<String, dynamic> data = {
        // "id": id,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "userName": _userNameController.text,
        "password": _passwordController.text,
      };
      var response = await UserServices.postUsers(data);
      if (response) {
        fetchData();
        // ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
        //     const SnackBar(content: Text('Account created successfully')));
      } else {
        ScaffoldMessenger.of(_formkey.currentContext!)
            .showSnackBar(const SnackBar(content: Text('Error')));
      }

      // await db.addUser(data, id);
      // await authServices.creatUser(data, context); //use like this in firebase

      setState(() {
        isLoader = false;
      });
      // ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
      //     const SnackBar(content: Text('Account created successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //backgroundColor: Color.fromARGB(255, 124, 208, 247),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              isLoader
                  ? Container(
                      height: 150,
                      child: Center(child: CircularProgressIndicator()))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: userData.length,
                      itemBuilder: (context, index) {
                        var user = userData[index];

                        return Text("${user.email}");
                      }),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),

                      // Image.asset(
                      //   "assets/images/circle.jpg",
                      //   height: 100,
                      //   width: 150,
                      // ),

                      // SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        "Create Your Account",
                        style: TextStyle(
                          color: Colors.white,
                          //color: const Color.fromARGB(255, 122, 191, 247),
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign Up for Immegram !",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 122, 191, 247),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 40,
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
                            // fillColor: const Color.fromARGB(255, 176, 224, 247),

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
                        height: 20.0,
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ))
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
                            backgroundColor: Colors.black,
                            // backgroundColor: Color.fromARGB(255, 124, 208, 247)
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          //color: Colors.red,
                        ),
                      ),
                      // Image.asset(
                      //   "assets/images/7.jpg",
                      //   height: 130,
                      // ),
                      SizedBox(
                        height: 16.0,
                      ),
                      // Image.asset(
                      //   "assets/images/Untitled design (7).png",
                      //   height: 90,
                      // ),
                      // Container(
                      //   height: 50,
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.black,
                      //     ),
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const Users()),
                      //       );
                      //     },
                      //     child: isLoader
                      //         ? Center(child: CircularProgressIndicator())
                      //         : Text(
                      //             "View All",
                      //             style: TextStyle(
                      //                 color: const Color.fromARGB(
                      //                     255, 255, 38, 38),
                      //                 fontSize: 20),
                      //           ),
                      //     //color: Colors.red,
                      //   ),
                      // ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
