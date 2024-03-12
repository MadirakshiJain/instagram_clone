import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/post.dart/post_bottom_sheet.dart';
import 'package:uuid/uuid.dart';

import '../services.dart/firestore_services.dart';
import 'media_picker.dart';
//import 'package:flutter_application_2/presentation/pages/upload_post/widget/post_data.dart';

// import '../../../services/firestore_services.dart';
// import 'widgets/media_picker.dart';
// import 'widgets/post_bottom_sheet.dart';
// import 'widgets/post_time.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  var mediapicker = MediaPicker();
  var isLoader = false;

  var uuid = Uuid();
  List<Map<String, dynamic>> _mediafiles = [];
  final firestoreService = FirestoreService();

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

  uploadStory() async {
    await UploadFile();
    var storyusername =
        await firestoreService.getUser(FirebaseAuth.instance.currentUser!.uid);
    var id = uuid.v4();
    var createAtTime = DateTime.now().microsecondsSinceEpoch;
    var storyData = {
      "id": id,
      "userName": storyusername['userName'],
      "createAt": createAtTime,
      "storyImages": imageUrlList,
    };

    await firestoreService.addStory(storyData);
    setState(() {
      isLoader = false;
    });
  }

  //var mediaBottomSheet = MediaBottomSheet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  uploadStory();
                },
                child: isLoader
                    ? Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ))
                    : Text("Story")),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(" UPLOAD STORY "),
        backgroundColor: const Color.fromARGB(255, 56, 55, 55),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
