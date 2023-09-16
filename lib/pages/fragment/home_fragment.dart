import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'package:tango/utils/config.dart';

import '../../models/LiveUsers.dart';
import '../../widgets/grad_circle_button.dart';
import '../../widgets/user_list.dart';

class HomeFragment extends StatelessWidget {
  //const HomeFragment({super.key});
  List<dynamic> liveUsersData = [];
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
              //mf
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder<List<dynamic>?>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                            return UserWidget(data: LiveUsers.fromJson(item));
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: GradientIconButton(
                gradientColors: [
                  Color.fromARGB(255, 255, 69, 205),
                  Color.fromARGB(255, 255, 0, 93),
                ],
                svgAsset: 'assets/icons/video.svg',
                iconColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
