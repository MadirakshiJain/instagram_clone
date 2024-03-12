import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/post.dart/post_bottom_sheet.dart';
import 'package:flutter_application_2/post.dart/post_time.dart';

import 'package:uuid/uuid.dart';

import '../profile.dart/profile_postcard.dart';
import '../services.dart/firestore_services.dart';
import 'media_picker.dart';
//import 'package:flutter_application_2/presentation/pages/upload_post/widget/post_data.dart';


class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  var mediapicker = MediaPicker();
  var isLoader = false;

  var uuid = Uuid();
  List<Map<String, dynamic>> _mediafiles = [];
  final firestoreService = FirestoreService();
  var postTime = PostTime();
  var post = ProfilePostCard();

  // var postdata = ProfilePostCard();
  // var postimage =

  void pickImages() async {
    var pickFiles = await mediapicker.pickImage();
    if (pickFiles != null) {
      setState(() {
        _mediafiles.addAll(pickFiles);
      });
    }

    Navigator.pop(context);
  }

  Future<void> takePicture() async {
    var pickFile = await mediapicker.takePicture();
    if (pickFile != null) {
      setState(() {
        _mediafiles.add(pickFile);
      });
    }
    Navigator.pop(context);
  }

  Future<void> pickVideo() async {
    var pickFile = await mediapicker.videoPick();
    if (pickFile != null) {
      setState(() {
        _mediafiles.add(pickFile);
      });
    }
    Navigator.pop(context);
  }

  RemoveMedia(index) {
    setState(() {
      _mediafiles.removeAt(index - 1);
    });
    Navigator.pop(context);
  }

  // final des = FirestoreService();
  final _descriptionController = TextEditingController();

  // uploadDescription() async {
  //   setState(() {
  //     isLoader = true;
  //   });
  //   var data = {"description": _descriptionController.text};

  //   await des.addDescription(
  //     data,
  //   );
  //   setState(() {
  //     isLoader = false;
  //   });
  // }

  final tags = FirestoreService();
  final _hashtagController = TextEditingController();

  uploadTag() async {
    var data1 = {"hashtags": _hashtagController.text};

    await tags.addTag(data1);
  }

  final imageUrlList = [];

  UploadFile() async {
    setState(() {
      isLoader = true;
    });
    for (var i in _mediafiles) {
      var imageUrl =
          await firestoreService.uploadFile(File(i['thumbnailFile']));
      setState(() {
        imageUrlList.add(imageUrl);
      });
    }
  }

  uploadPost() async {
    if (_descriptionController.text.isEmpty && _mediafiles.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please fill details")));
    } else {
      setState(() {
        isLoader = true;
      });
      await UploadFile();
      var post = await firestoreService
          .getUser(FirebaseAuth.instance.currentUser!.uid);

      var id = uuid.v4();
      var createAtTime = DateTime.now().microsecondsSinceEpoch;

      var postData = {
        "id": id,
        "userName": post['userName'],
        "createAt": createAtTime,
        "likesCount": 0,
        "likesImage": [],
        "commentsCount": 0,
        "description": _descriptionController.text,
        "postImages": imageUrlList,
        "profileUrl": post['profileUrl'],
      };
      try {
        await firestoreService.addPost(postData);
        setState(() {
          isLoader = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Post Uploaded")));
      } catch (error) {
        setState(() {
          isLoader = false;
        });
      } finally {
        setState(() {
          _descriptionController.clear();
          _mediafiles = [];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    //backgroundColor: const Color.fromARGB(255, 255, 66, 53)
                    backgroundColor: Colors.blue),
                onPressed: () {
                  uploadTag();
                  uploadPost();
                },
                child: isLoader
                    ? Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ))
                    : Text("Post")),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(" UPLOAD POST "),
        backgroundColor: const Color.fromARGB(255, 56, 55, 55),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Write Something",
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      hintText: 'Discription',
                      filled: true,
                      fillColor: Color.fromARGB(255, 53, 53, 53)),
                ),
                SizedBox(
                  height: 10,
                ),

                // TextField(
                //   controller: _hashtagController,
                //   maxLines: null,
                //   keyboardType: TextInputType.multiline,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(8),
                //           borderSide: BorderSide.none),
                //       contentPadding:
                //           EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //       hintText: 'hashtags',
                //       filled: true,
                //       fillColor: Color.fromARGB(255, 53, 53, 53)),
                // )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _mediafiles.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: IconButton(
                        onPressed: () {
                          // showBottomSheet(
                          //     context: context,
                          //     builder: (context) {
                          //       return Container(
                          //           color: Colors.amber, child: Text("hello"));
                          //     });
                          MediaBottomSheet.show(
                              context, pickImages, takePicture, pickVideo);
                        },
                        icon: Icon(Icons.add_a_photo)),
                  );
                }
                var mediaFile = _mediafiles[index - 1];
                var thumbnailFile = File(mediaFile['thumbnailFile']);
                var isVideo = mediaFile['mediaType'] == 'video';
                return InkWell(
                  onLongPress: () {
                    RemoveMediaBottomSheet.show(context, () {
                      RemoveMedia(index);
                    });
                  },
                  child: Stack(
                    children: [
                      Image.file(
                        thumbnailFile,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      if (isVideo)
                        Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.play_circle_filled,
                              size: 40,
                              color: Colors.white,
                            ))
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
