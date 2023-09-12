import 'dart:ffi';

class User {
  String profile, fullName, about, nickname, gender, dob;
  bool isDating, isNearby, isArtists;

  User({
    required this.profile,
    required this.fullName,
    required this.about,
    required this.nickname,
    required this.gender,
    required this.dob,
    required this.isDating,
    required this.isNearby,
    required this.isArtists,
  });
}
