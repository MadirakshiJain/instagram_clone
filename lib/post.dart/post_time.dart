import 'dart:math';

class PostTime {
  String getTime(timestamp) {
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    DateTime now = DateTime.now();

    int differenceInSeconds = max(0, now.difference(dateTime).inSeconds);

    String timeAgo = getTimeAgoString(differenceInSeconds);

    print('Time ago: $timeAgo');
    return timeAgo;
  }

  String getTimeAgoString(int differenceInSeconds) {
    if (differenceInSeconds < 60) {
      return "$differenceInSeconds seconds ago";
    } else {
      int differenceInMinutes = differenceInSeconds ~/ 60;
      if (differenceInMinutes < 60) {
        return "$differenceInMinutes minutes ago";
      } else {
        int differenceInHours = differenceInMinutes ~/ 60;
        if (differenceInHours < 24) {
          return "$differenceInHours hours ago";
        } else {
          int differenceInDays = differenceInHours ~/ 24;
          return "$differenceInDays days ago";
        }
      }
    }
  }
}
