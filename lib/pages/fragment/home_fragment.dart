import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 10,
              left: 10,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'img/profile_picture.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ),
                  child: Image.asset(
                    'img/coin.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                Text(
                  '0',
                  style: TextStyle(
                    color: Color(0xFF383A3E),
                    fontSize: 16,
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'img/leaderboard.png',
                          width: 26,
                          height: 26,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'img/feeds.png',
                          width: 26,
                          height: 26,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'img/notifications.png',
                          width: 26,
                          height: 26,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
