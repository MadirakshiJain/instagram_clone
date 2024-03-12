import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/profile.dart/profile_reelscard.dart';
import 'package:flutter_application_2/profile.dart/profile_savecard.dart';

//import 'package:flutter_application_2/presentation/pages/upload_post/post_view.dart';


import '../auth.dart/allUsers.dart';
import '../auth.dart/login.dart';
import 'profile_headercard.dart';
import 'profile_postcard.dart';

class ProfileView extends StatelessWidget {
  ProfileView({
    super.key,
    required this.userId,
  });
  final String userId;

  // List<Map<String, dynamic>> postimages = [];
  @override
  Widget build(BuildContext context) {
    // var images = post.postData['postImages'][0];

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            //elevation: 0,
            //leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            backgroundColor: Colors.black,
            title: Text("PROFILE"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Badge(
                      textColor: Colors.white,
                      label: Text("5"),
                      child: Icon(Icons.notifications))),
              PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => Login())));
                        },
                      )),
                      // PopupMenuItem(
                      //     child: ListTile(
                      //   leading: Icon(Icons.edit),
                      //   title: Text("Edit Profile"),
                      //   onTap: () async {
                      //     // await FirebaseAuth.instance.signOut();
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: ((context) => EditProfile(userDetails:userData))));
                      //   },
                      // ))
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.person_2),
                        title: Text("All Users"),
                        onTap: () async {
                          // await FirebaseAuth.instance.signOut();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Users())));
                        },
                      ))
                    ];
                  }),
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  ProfileHeaderCard(
                    userId: userId,
                  )
                ];
              },
              body: Column(
                children: [
                  TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.play_circle_outline),
                    ),
                    Tab(
                      icon: Icon(Icons.bookmark_border),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(children: [
                      ProfilePostCard(),
                      ProfileReelsCard(),
                      ProfileSaveCard(),
                    ]),
                  )
                ],
              ))),
    );
  }
}
