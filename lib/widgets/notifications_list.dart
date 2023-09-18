import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/models/Notifications.dart';
import 'package:tango/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'package:tango/utils/config.dart';

import '../models/User.dart';

class NotificationsWidget extends StatelessWidget {
  final Notifications data;

  Future<User?> fetchUserData(String userId) async {
    final apiUrl = Config.base_url + Config.user + '?user_id=$userId';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  const NotificationsWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    final User? userData = fetchUserData(data.userId) as User?;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 13,
        right: 13,
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              userData!.profile,
              width: 40,
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 13,
              right: 13,
            ),
            child: Column(
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    color: UIColors.highText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text(
                    data.message,
                    style: TextStyle(
                      color: UIColors.lowText,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            data.img,
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
