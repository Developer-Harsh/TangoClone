import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'package:tango/utils/config.dart';

import '../../models/LiveUsers.dart';
import '../../widgets/user_list.dart';

class FollowingFragment extends StatelessWidget {
  //const HomeFragment({super.key});
  List<dynamic> liveUsersData = [];
  final int following = 0;

  Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse(Config.base_url + Config.live_users));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Stack(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: UIColors.scaffold,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 15,
                      right: 15,
                      bottom: 5,
                    ),
                    child: Row(
                      children: [
                        const ClipOval(
                          child: Image(
                            image:
                                AssetImage('assets/images/profile_picture.png'),
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Image(
                            image: AssetImage('assets/images/coin.png'),
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                          ),
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.getFont('Readex Pro').fontFamily,
                              color: UIColors.highText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/leaderboard.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 14,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/feeds.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/notification.svg',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (following == 0)
                        Padding(
                          padding: EdgeInsets.only(
                            top: 26,
                            bottom: 26,
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/users.svg',
                                width: 30,
                                height: 30,
                                color: UIColors.lowText,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  'No active followings yet',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.getFont('Readex Pro')
                                            .fontFamily,
                                    color: UIColors.lowText,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        FutureBuilder<List<dynamic>?>(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.data == null) {
                              return Text('No data available');
                            } else {
                              List<dynamic> data = snapshot.data!;

                              return GridView.builder(
                                physics: ScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                ),
                                itemCount: data.length,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final item = data[index];
                                  return UserWidget(
                                      data: LiveUsers.fromJson(item));
                                },
                              );
                            }
                          },
                        ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            'You may also like',
                            style: TextStyle(
                                fontFamily: GoogleFonts.getFont('Readex Pro')
                                    .fontFamily,
                                color: UIColors.highText,
                                fontWeight: FontWeight.w200,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      FutureBuilder<List<dynamic>?>(
                        future: fetchData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.data == null) {
                            return Text('No data available');
                          } else {
                            List<dynamic> data = snapshot.data!;

                            return GridView.builder(
                              physics: ScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: data.length,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                return UserWidget(
                                    data: LiveUsers.fromJson(item));
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
