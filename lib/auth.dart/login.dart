import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth.dart/sign_up.dart';

import '../services.dart/auth_services.dart';
import '../services.dart/validator.dart';
//import 'package:flutter_application_2/presentation/pages/auth/contact_form.dart';

//import 'package:flutter_application_2/pageview.dart';
//import 'package:flutter_application_2/auth/sign_up.dart';
//import 'package:flutter_application_2/auth/sign_up.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var appvalidator = AppValidator();

  var authServices = AuthService();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  var isLoader = false;

  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
    });
    if (_formkey.currentState!.validate()) {
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };
      await authServices.loginUser(data, context);
      setState(() {
        isLoader = false;
      });
      // ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
      //   const SnackBar(content: Text('Account created successfully')),
      // );
    }
  }

  // String? _validateUsername(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter a username';
  //   }
  //   return null;
  // }

  // String? _validatePassword(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter a password';
  //   }
  //   return null;
  // }

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
              mainAxisAlignment: MainAxisAlignment.center,
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
                //           MaterialPageRoute(builder: (context) => PageView1()),
                //         );
                //       },
                //       child: Text(
                //         "<--",
                //         style: TextStyle(color: Colors.white),
                //       )),
                // ),

                // Image.asset(
                //   "assets/images/logo.jpg",
                //   height: 150,
                // ),
                SizedBox(
                  height: 30,
                ),
                // Image.asset(
                //   "assets/images/circle.jpg",
                //   height: 100,
                //   width: 150,
                // ),

                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome Back !",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to Continue",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 122, 191, 247),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Email",
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

                //validator: appvalidator.validatePassword,

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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ))
                        : Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    //color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                // Container(
                //   height: 50,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.black,
                //     ),
                //     onPressed: () {
                //       // Navigator.push(
                //       //   context,
                //       //   MaterialPageRoute(builder: (context) => MyForm()),
                //       // );
                //     },
                //     child: Text(
                //       "form",
                //       style: TextStyle(color: Colors.blue, fontSize: 20),
                //     ),
                //     //color: Colors.red,
                //   ),
                // ),

                // Image.asset(
                //   "assets/images/14.jpg",
                //   height: 300,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
