import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/models/Notifications.dart';
import 'package:tango/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'package:tango/utils/config.dart';
import 'package:tango/utils/preferences.dart';
import 'package:tango/widgets/notifications_list.dart';

class NotificationsPage extends StatelessWidget {
  // const NotificationsPage({super.key});

  List<Notifications> notifications = [];
  Future<List<Notifications>> fetchData(String userId) async {
    final apiUrl = Config.base_url +
        Config.notifications +
        '?userId=$userId'; // Replace with your API endpoint

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      for (var item in jsonData) {
        notifications.add(Notifications.fromJson(item));
      }

      return notifications;
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => {},
                    child: SvgPicture.asset(
                      'assets/icons/left.svg',
                      color: UIColors.highText,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily:
                              GoogleFonts.getFont('Readex Pro').fontFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<List<dynamic>?>(
                future: fetchData(EasyPrefs.instance.getString('userId')),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data == null) {
                    return Text('No data available');
                  } else {
                    List<dynamic> data = snapshot.data!;

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return NotificationsWidget(data: data[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
