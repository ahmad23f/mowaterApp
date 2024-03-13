String calculateTimeDifference(String postDate) {
  DateTime postDateTime = DateTime.parse(postDate);
  DateTime currentDateTime = DateTime.now();

  Duration difference = currentDateTime.difference(postDateTime);

  if (difference.inSeconds < 60) {
    return "Just now";
  } else if (difference.inMinutes < 60) {
    int minutes = difference.inMinutes;
    return " $minutes ${minutes == 1 ? 'minute' : 'minutes'} ago";
  } else if (difference.inHours < 24) {
    int hours = difference.inHours;
    return "$hours ${hours == 1 ? 'hour' : 'hours'} ago";
  } else {
    int days = difference.inDays;
    return "$days ${days == 1 ? 'day' : 'days'} ago";
  }
}
