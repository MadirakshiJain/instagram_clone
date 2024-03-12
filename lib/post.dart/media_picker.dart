import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class MediaPicker {
  final ImagePicker picker = ImagePicker();

  Future<List<Map<String, dynamic>>> pickImage() async {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      final mediaJsonList = <Map<String, dynamic>>[];
      for (var pickFiles in pickedFiles) {
        final id = DateTime.now().microsecondsSinceEpoch.toString();
        final mediaJson = {
          'id': id,
          'mediaFile': File(pickFiles.path).path,
          'thumbnailFile': File(pickFiles.path).path,
          'mediaType': "image"
        };
        mediaJsonList.add(mediaJson);
      }
      return mediaJsonList;
    } else {
      return [];
    }
  }

  ImgPicker() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile!.path;
  }

  Future<Map<String, dynamic>> takePicture() async {
    final pickFiles = await picker.pickImage(source: ImageSource.camera);
    if (pickFiles != null) {
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': File(pickFiles.path).path,
        'thumbnailFile': File(pickFiles.path).path,
        'mediaType': "image"
      };
      return mediaJson;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> videoPick() async {
    final pickFiles = await picker.pickVideo(source: ImageSource.gallery);
    if (pickFiles != null) {
      final thumbnailFile = await _getThumbnail(File(pickFiles.path));
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': File(pickFiles.path).path,
        'thumbnailFile': thumbnailFile.path,
        'mediaType': "video"
      };
      return mediaJson;
    } else {
      return {};
    }
  }

  Future<File> _getThumbnail(File mediaFile) async {
    final thumbnailFile = await VideoCompress.getFileThumbnail(mediaFile.path,
        quality: 50, // default(100)
        position: -1 // default(-1)
        );
    return thumbnailFile;
  }

  // Future<File> _getThumbnail(File mediaFile) async {
  //   final thumbnailFile = await VideoCompress.getFileThumbnail(mediaFile.path,
  //       quality: 50, // default(100)
  //       position: -1 // default(-1)
  //       );
  //   return thumbnailFile;
  // }
  // Future<Map<String, dynamic>> uploadStory() async {
  //   final pickFiles = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickFiles != null) {
  //     final id = DateTime.now().microsecondsSinceEpoch.toString();
  //     final mediaJson = {
  //       'id': id,
  //       'mediaFile': File(pickFiles.path).path,
  //       'thumbnailFile': File(pickFiles.path).path,
  //       'mediaType': "image"
  //     };
  //     return mediaJson;
  //   } else {
  //     return {};
  //   }
  // }
  // Future<List<Map<String, dynamic>>> uploadStory() async {
  //   final pickedFiles = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFiles != null) {
  //     final mediaJsonList = <Map<String, dynamic>>[];
  //     for (var pickFiles in pickedFiles) {
  //       final id = DateTime.now().microsecondsSinceEpoch.toString();
  //       final mediaJson = {
  //         'id': id,
  //         'mediaFile': File(pickFiles.path).path,
  //         'thumbnailFile': File(pickFiles.path).path,
  //         'mediaType': "image"
  //       };
  //       mediaJsonList.add(mediaJson);
  //     }
  //     return mediaJsonList;
  //   } else {
  //     return [];
  //   }
  // }
}
