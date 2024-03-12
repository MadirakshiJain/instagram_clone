import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../screens.dart/edit_profile.dart';
//import 'package:flutter_application_2/presentation/pages/auth/edit_profle.dart';

class ProfileHeaderCard extends StatelessWidget {
  ProfileHeaderCard({
    super.key,
    required this.userId,
  });
  final String userId;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<DocumentSnapshot>(
        future: users.doc(userId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print(data);
            return ProfileCard(
              userData: data,
            );
          }

          return Text("loading");
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.userData,
  });

  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        //decoration: BoxDecoration(
        //color: Color(0xFF1B1618)
        //borderRadius: BorderRadius.only(
        //bottomRight: Radius.circular(40),
        //bottomLeft: Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      //margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.blueGrey)),
                      child: Center(
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                            userData['profileUrl'],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 22,
                      right: 0,
                      child: Container(
                          height: 0,
                          decoration: BoxDecoration(
                            // boxShadow: Color.
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: FirebaseAuth.instance.currentUser!.uid ==
                                      userData['id']
                                  ? IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    EditProfile(
                                                        userDetails:
                                                            userData))));
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: const Color.fromARGB(
                                            255, 17, 112, 190),
                                      ))
                                  : SizedBox()
                              // child: IconButton(
                              //   Icons.add_circle,
                              //   color: const Color.fromARGB(255, 17, 112, 190),
                              // ),
                              )),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ProfileCountTitle(
                  count: '12',
                  title: 'Posts',
                ),
                CustomDivider(),
                ProfileCountTitle(
                  count: '800',
                  title: 'Followers',
                ),
                CustomDivider(),
                ProfileCountTitle(
                  count: '250',
                  title: 'Following',
                ),
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userData['userName'],
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                FirebaseAuth.instance.currentUser!.uid == userData['id']
                    ? IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) =>
                                  EditProfile(userDetails: userData))));
                        },
                        icon: Icon(Icons.edit))
                    : SizedBox()
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Text(
              userData['bio'],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.grey.shade400,
              ),
            ),
            // Text(
            //   userData['description'],
            //   style: TextStyle(
            //       fontSize: 15,
            //       color: Colors.grey.shade400,
            //       fontWeight: FontWeight.w500),
            // ),
            // Text(
            //   "Beginning to become an App Developer in Flutter",
            //   style: TextStyle(
            //       fontSize: 15,
            //       color: Colors.grey.shade400,
            //       fontWeight: FontWeight.w500),
            // ),

            SizedBox(
              height: 40,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    userData['url'],
                  )),
            )
          ],
        ));
  }
}

class ProfileCountTitle extends StatelessWidget {
  const ProfileCountTitle({
    super.key,
    required this.count,
    required this.title,
  });
  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        )
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(color: Colors.grey.shade600, width: 2.0))),
    );
  }
}
