import 'package:flutter/material.dart';

import '../screens.dart/home_view.dart';
import '../services.dart/firestore_services.dart';
// import 'package:flutter_application_2/presentation/pages/home/home_view.dart';
// import 'package:flutter_application_2/services/firestore_services.dart';

class PostsView extends StatefulWidget {
  const PostsView({
    super.key,
    required this.postData,
  });

  final List<Map<String, dynamic>> postData;

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  var firestoreService = FirestoreService();
  List<Map<String, dynamic>> postsData = [];

  void initState() {
    getPosts();
    super.initState();
  }

  getPosts() async {
    var post = await firestoreService.getPost();
    setState(() {
      postsData = post;
    });
    print(postsData);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: postsData.length,
        itemBuilder: (context, index) {
          // var item = postData[index]['likesImage'] as List;
          // print(item.length);
          return PostCard(
            likeImages: [],
            postData: postsData[index],
          );
        });
  }
}
