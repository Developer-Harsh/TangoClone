class Notifications {
  final String userId;
  final String message;
  final String img;
  final String title;

  Notifications({
    required this.userId,
    required this.message,
    required this.img,
    required this.title,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      userId: json['userId'],
      message: json['message'],
      img: json['img'],
      title: json['title'],
    );
  }
}
