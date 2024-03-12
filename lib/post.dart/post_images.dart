import 'package:flutter/material.dart';
import 'package:flutter_application_2/post.dart/video_player.dart';



//import '../../../services/firestore_services.dart';

class ImageListPage extends StatelessWidget {
  // final List<String> imageUrls = [
  final List imagesList;

  String checkMediaType(String url) {
    final extensionPart = url.split('.').last.toLowerCase();
    //print(extension);
    final extensionParts = extensionPart.split("?");
    final extension = extensionParts.first;

    if (extension == "jpg" || extension == "jpeg") {
      return "isImage";
    } else if (extension == "mp4" || extension == "avi") {
      return "isVideo";
    }

    return "others";
  }

  const ImageListPage({super.key, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: imagesList.length,
      itemBuilder: (context, index) {
        return buildImageItem(imagesList[index]);
      },
    );
  }

  Widget buildImageItem(String imageUrl) {
    var type = checkMediaType(imageUrl);
    return Center(
        child: type == "isImage"
            ? Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              )
            : type == "isVideo"
                ? VideoApp(
                    url: imageUrl,
                  )
                : SizedBox());
  }
}
