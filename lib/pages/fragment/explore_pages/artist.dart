import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/LiveUsers.dart';
import '../../../utils/colors.dart';
import '../../../widgets/grad_circle_button.dart';
import '../../../widgets/user_list.dart';

import 'package:http/http.dart' as http;
import 'package:tango/utils/config.dart';

class ArtistExplorePage extends StatelessWidget {
  //const ArtistExplorePage({super.key});

  List<dynamic> liveUsersData = [];
  final int following = 0;
  final int selectedIndex = 0;

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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
