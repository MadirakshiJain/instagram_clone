//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth.dart/userData.dart';
import 'package:flutter_application_2/auth.dart/user_model.dart';
//import 'package:flutter_application_2/auth.dart/userModel.dart';

import 'edit_user.dart';
import 'login.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  var userlist = [];
  List<User> userData = [];

  loadApiUser() async {
    try {
      List<User> data = await UserServices.fetchUsers();
      setState(() {
        userData = data;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();

    loadApiUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Users"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, Index) {
              var data = userData[Index];

              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Column(
                  children: [
                    Text("User Name : ${data.userName}"),
                    SizedBox(
                      height: 15,
                    ),
                    Text("User Email :  ${data.email}"),
                    SizedBox(
                      height: 15,
                    ),
                    Text("User Phone Number : ${data.phone} "),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditUserData(
                                          data: data,
                                        )));
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
