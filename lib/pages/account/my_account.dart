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
        actions: [
          SvgPicture.asset(
            'assets/images/left.svg',
            width: 24,
            height: 24,
          ),
        ],
        backgroundColor: UIColors.scaffold,
        title: Text('My Account'),
        titleTextStyle: TextStyle(
          color: UIColors.highText,
          fontSize: 16,
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
                    right: 7,
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/profile_picture.png'),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Text(
                  'Harshuu',
                  style: TextStyle(
                    color: UIColors.highText,
                    fontSize: 16,
                    fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                  ),
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
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                ),
              ),
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/users.svg',
                width: 24,
                height: 24,
              ),
              Text(
                'Referral Program',
                style: TextStyle(
                  color: UIColors.mediumText,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
