// ignore_for_file: non_constant_identifier_names

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../post.dart/post_images.dart';
import '../post.dart/post_time.dart';
import '../post.dart/postsView.dart';
import '../post.dart/story_view.dart';
import '../profile.dart/profile_postcard.dart';
import '../services.dart/constant.dart';
import '../services.dart/firestore_services.dart';

//import 'package:flutter_application_2/auth/sign_up.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    getPost();
    getStory();
    super.initState();
  }

  List<Map<String, dynamic>> postData = [];
  var firestoreService = FirestoreService();

  getPost() async {
    var posts = await firestoreService.getPost();
    setState(() {
      postData = posts;
    });
    // print(posts);
  }

  List<Map<String, dynamic>> storyData = [];
  getStory() async {
    var stories = await firestoreService.getStory();
    setState(() {
      storyData = stories;
    });
    print(stories);
  }

  // var storyData = [
  //   {
  //     "imageUrl":
  //         'https://tse3.mm.bing.net/th?id=OIP.xRT4Iunhn8opElpH3uZrBAHaGo&pid=Api&P=0&h=180',
  //     'Username': 'Ankit'
  //   },
  //   {
  //     "imageUrl":
  //         'https://i.pinimg.com/originals/d6/19/fb/d619fb8abef8935786b3ed0e1f0061f4.jpg',
  //     'Username': 'Queen'
  //   },
  //   {
  //     "imageUrl":
  //         'https://www.imagesjunction.com/images/img/aesthetic_profile_pics.jpg',
  //     'Username': 'Raja'
  //   },
  //   {
  //     "imageUrl":
  //         'https://4.bp.blogspot.com/-kuHjvvKoGAw/W5M8Ty5DUzI/AAAAAAAAAEk/1ynlqmAC8h8F4WDDoDcxx7ruXAusRmcqQCEwYBhgL/s1600/PicsArt_12-11-06.20.45.jpg',
  //     'Username': 'Mehak'
  //   },
  //   {
  //     "imageUrl":
  //         'https://i.pinimg.com/originals/83/70/cf/8370cf91d2e3ec48511b098a47fe2fe2.jpg',
  //     'Username': 'Ankit'
  //   },
  //   {
  //     "imageUrl":
  //         'https://tse3.mm.bing.net/th?id=OIP.xRT4Iunhn8opElpH3uZrBAHaGo&pid=Api&P=0&h=180',
  //     'Username': 'Mohit'
  //   },
  //   {
  //     "imageUrl":
  //         'https://www.imagesjunction.com/images/img/aesthetic_profile_pics.jpg',
  //     'Username': 'Rahul'
  //   },
  // ];

  // var postData = [
  //   {
  //     "imageUrl":
  //         'https://tse3.mm.bing.net/th?id=OIP.xRT4Iunhn8opElpH3uZrBAHaGo&pid=Api&P=0&h=180',
  //     'Username': 'Ankit',
  //     'ProfileImage':
  //         'https://www.imagesjunction.com/images/img/aesthetic_profile_pics.jpg',
  //   },
  //   {
  //     "imageUrl":
  //         'https://i.pinimg.com/originals/d6/19/fb/d619fb8abef8935786b3ed0e1f0061f4.jpg',
  //     'Username': 'Queen',
  //     'ProfileImage':
  //         'https://tse3.mm.bing.net/th?id=OIP.xRT4Iunhn8opElpH3uZrBAHaGo&pid=Api&P=0&h=180',
  //   },
  //   {
  //     "imageUrl":
  //         'https://www.imagesjunction.com/images/img/aesthetic_profile_pics.jpg',
  //     'Username': 'Raja',
  //     'ProfileImage':
  //         'https://i.pinimg.com/originals/d6/19/fb/d619fb8abef8935786b3ed0e1f0061f4.jpg',
  //   },
  //   {
  //     "imageUrl":
  //         'https://4.bp.blogspot.com/-kuHjvvKoGAw/W5M8Ty5DUzI/AAAAAAAAAEk/1ynlqmAC8h8F4WDDoDcxx7ruXAusRmcqQCEwYBhgL/s1600/PicsArt_12-11-06.20.45.jpg',
  //     'Username': 'Mehak',
  //     'ProfileImage':
  //         'https://i.pinimg.com/originals/d6/19/fb/d619fb8abef8935786b3ed0e1f0061f4.jpg'
  //   },
  //   {
  //     "imageUrl":
  //         'https://i.pinimg.com/originals/83/70/cf/8370cf91d2e3ec48511b098a47fe2fe2.jpg',
  //     'Username': 'Ankit',
  //     'ProfileImage':
  //         'https://4.bp.blogspot.com/-kuHjvvKoGAw/W5M8Ty5DUzI/AAAAAAAAAEk/1ynlqmAC8h8F4WDDoDcxx7ruXAusRmcqQCEwYBhgL/s1600/PicsArt_12-11-06.20.45.jpg',
  //   },
  //   {
  //     "imageUrl":
  //         'https://i.pinimg.com/originals/d6/19/fb/d619fb8abef8935786b3ed0e1f0061f4.jpg',
  //     'Username': 'Mohit',
  //     'ProfileImage':
  //         'https://www.imagesjunction.com/images/img/aesthetic_profile_pics.jpg',
  //   },
  //   {
  //     "imageUrl":
  //         'https://www.imagesjunction.com/images/img/aesthetic_profile_pics.jpg',
  //     'Username': 'Rahul',
  //     'ProfileImage':
  //         'https://i.pinimg.com/originals/d6/19/fb/d619fb8abef8935786b3ed0e1f0061f4.jpg'
  //   },
  // ];

  var LikeImageslist = [
    'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
    'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
    'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 40,
              floating: true,
              pinned: false,
              snap: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Instagram",
                    //"Immegram",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                  ),
                  Icon(Icons.message),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProfileStoryCard(),
                    ListView.builder(
                        itemCount: storyData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, Index) {
                          return StoryCard(
                            storyData: storyData[Index]["storyImages"][0],
                            Username: storyData[Index]['userName'],
                          );
                        })
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: PostsView(postData: postData),
            )
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  PostCard({
    super.key,
    this.postData,
    this.likeImages,
  });

  final likeImages;
  final dynamic postData;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  var time = PostTime();

  var post = ProfilePostCard();

  var isLike = false;
  var likeCount = 0;
  var firestoreService = FirestoreService();

  void initState() {
    checkIsLike();
    likeCount = widget.postData['likesCount'];
    super.initState();
  }

  checkIsLike() async {
    bool exits = await firestoreService.checkDocumentExists(
        widget.postData['id'], FirebaseAuth.instance.currentUser!.uid);
    setState(() {
      isLike = exits;
    });
  }

  like() {
    setState(() {
      isLike = !isLike;
      if (isLike) {
        likeCount++;
      } else {
        likeCount--;
      }
      firestoreService.islike(isLike, widget.postData['id'],
          FirebaseAuth.instance.currentUser!.uid);
    });
  }

  //var post = ProfileView(userId: FirebaseAuth.instance.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    var images = widget.postData['postImages'] as List;
    var listImages = widget.postData['likesImage'] as List;
    var posttime = time.getTime(widget.postData['createAt']);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage("${widget.postData['profileUrl']}"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " ${widget.postData["userName"]}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        posttime,
                        style: TextStyle(color: Colors.white60),
                      )
                    ],
                  )
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          // if (postData['postImages'].length as List ! =0)
          // Text("${postData['postImages']}"),
          images.isEmpty
              ? SizedBox()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      height: 200,
                      child: ImageListPage(
                        imagesList: images,
                      )),
                  // child: Image.network(
                  //   postData['postImages'][0],
                  //   height: 280,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${widget.postData['description']}",
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (listImages.isNotEmpty)
                    LikeImages(
                      likesImages: listImages,
                    ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "$likeCount likes",
                    // "${widget.postData['likesCount']} likes",
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      like();
                    },
                    icon: isLike
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 32,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            size: 32,
                          ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.comment_outlined,
                    size: 30,
                  ),
                  //Icon(Icons.bookmark_border_outlined),
                ],
              ),
              Icon(
                Icons.bookmark_border_outlined,
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "View All ${widget.postData['commentsCount']} Comments",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LikeImages extends StatelessWidget {
  LikeImages({
    super.key,
    required this.likesImages,
  });

  final likesImages;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int index = 0; index < likesImages.length; index++)
          Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(left: 25.0 * index),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(likesImages[index]),
            ),
          ),
      ],
    );
  }
}

class StoryCard extends StatelessWidget {
  StoryCard({
    super.key,
    // required this.profileImage,
    required this.Username,
    required this.storyData,
  });

  var constant1 = constant();

  // final String profileImage;
  final String Username;
  final String storyData;

  @override
  Widget build(BuildContext context) {
    // var images = storyData['storyImages'] as List;
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: constant1.primarycolor)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: storyData.isEmpty
                  ? SizedBox()
                  : CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        storyData,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            Username,
          ),
        ],
      ),
    );
  }
}

class ProfileStoryCard extends StatelessWidget {
  ProfileStoryCard({
    super.key,
  });
  // final dynamic userData;
  // var profilePhoto = ProfileHeaderCard(userId:FirebaseAuth.instance.user!.uid );
  @override
  Widget build(BuildContext context) {
    //var photo = profilePhoto.
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://tse4.mm.bing.net/th?id=OIP.0rVie0laYlpBnF7OTAYwTgHaEK&pid=Api&P=0&h=180"
                        //userData['profileUrl'],
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => StoryView())));
              },
              icon: Icon(
                Icons.add_circle,
                size: 25,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
