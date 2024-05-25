String timeConverter(int timestamp) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  DateTime now = DateTime.now();
  Duration difference = now.difference(time);
  if (difference.inDays >= 1) {
    return "${time.day}/${time.month}/${time.year}";
  } else if (difference.inHours >= 1) {
    return "${difference.inHours} h ago";
  } else if (difference.inMinutes >= 1) {
    return "${difference.inMinutes} m ago";
  } else {
    return "now";
  }
}
