class User {
  final String userId;
  final String name;
  final String profile;
  final String viewers;
  final String username;
  final String phoneNumber;
  final String gender;
  final String age;
  final String point;
  final String followers;
  final String following;
  final String country;
  final String city;
  final String createdAt;
  final String invitedBy;
  final String isBlock;

  User({
    required this.userId,
    required this.name,
    required this.profile,
    required this.viewers,
    required this.username,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.point,
    required this.followers,
    required this.following,
    required this.country,
    required this.city,
    required this.createdAt,
    required this.invitedBy,
    required this.isBlock,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['USER_ID'],
      name: json['NAME'],
      profile: json['PROFILE'],
      viewers: json['VIEWERS'],
      username: json['USERNAME'],
      phoneNumber: json['PHONE_NUMBER'],
      gender: json['GENDER'],
      age: json['AGE'],
      point: json['POINT'],
      followers: json['FOLLOWERS'],
      following: json['FOLLOWING'],
      country: json['COUNTRY'],
      city: json['CITY'],
      createdAt: json['CREATED_AT'],
      invitedBy: json['INVITED_BY'],
      isBlock: json['IS_BLOCK'],
    );
  }
}
