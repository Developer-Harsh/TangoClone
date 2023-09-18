import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

class MyAccountPage extends StatelessWidget {
  //const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: UIColors.scaffold,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 10,
              ),
              child: SvgPicture.asset(
                'assets/icons/left.svg',
                width: 30,
                height: 30,
                color: UIColors.highText,
              ),
            ),
            Text(
              'My Account',
            ),
          ],
        ),
        titleTextStyle: TextStyle(
          color: UIColors.highText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
        ),
        elevation: 0.00,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
              left: 15,
              bottom: 25,
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    right: 13,
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/profile_picture.png'),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harshuu',
                      style: TextStyle(
                        color: UIColors.highText,
                        fontSize: 16,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                    Text(
                      'admin@gmail.com',
                      style: TextStyle(
                        color: UIColors.lowText,
                        fontSize: 16,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/chev_right.svg',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                'Special Programs',
                style: TextStyle(
                  color: UIColors.lowText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Referral Program',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Loyalty Program',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/family.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Starline Families',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/card_auction.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Star Card Auction',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: UIColors.lowText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/user.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Account',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Privacy',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/settings.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'General',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                'Creator Tools',
                style: TextStyle(
                  color: UIColors.lowText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Get Money',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/stats.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Statistics',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/gifts.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Top Gifters',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Moments Archive',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'My Fans',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Manage Admins',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 70,
              ),
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/users.svg',
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      'Version 1.0 | 2023',
                      style: TextStyle(
                        color: UIColors.lowText,
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: UIColors.mediumText,
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          fontFamily:
                              GoogleFonts.getFont('Readex Pro').fontFamily,
                        ),
                      ),
                      Text(
                        'and',
                        style: TextStyle(
                          color: UIColors.mediumText,
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          fontFamily:
                              GoogleFonts.getFont('Readex Pro').fontFamily,
                        ),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: UIColors.mediumText,
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          fontFamily:
                              GoogleFonts.getFont('Readex Pro').fontFamily,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Copyright © 2023 Starine All Rights Reserved',
                    style: TextStyle(
                      color: UIColors.lowText,
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                      fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
