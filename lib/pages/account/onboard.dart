import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../home/home.dart';

class OnboardPage extends StatelessWidget {
  Future<void> saveData(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 15,
              ),
              child: TextButton(
                child: Text(
                  'Skip',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: UIColors.lowText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                  ),
                ),
                onPressed: () async => {
                  // onclick
                  saveData('isSkipped', true),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 110,
              ),
              child: Column(
                children: [
                  Text(
                    'Choose your interests',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: UIColors.highText,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'and get a Free gift.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: UIColors.mediumText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 60,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/cat_hi.png'),
                      width: 230,
                      height: 230,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 90.00,
                    right: 10.00,
                  ),
                  child: Container(
                    height: 70,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: UIColors.box_color,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/images/piano.png'),
                          width: 25,
                          height: 25,
                        ),
                        Text(
                          'Artists',
                          style: TextStyle(
                            color: UIColors.mediumText,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily:
                                GoogleFonts.getFont('Readex Pro').fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 90.00,
                    left: 10.00,
                    right: 10.00,
                  ),
                  child: Container(
                    height: 70,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: UIColors.box_color,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/images/dating.png'),
                          width: 25,
                          height: 25,
                        ),
                        Text(
                          'Dating',
                          style: TextStyle(
                            color: UIColors.mediumText,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily:
                                GoogleFonts.getFont('Readex Pro').fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 90.00,
                    left: 10.00,
                  ),
                  child: Container(
                    height: 70,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: UIColors.box_color,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/images/nearby.png'),
                          width: 25,
                          height: 25,
                        ),
                        Text(
                          'Nearby',
                          style: TextStyle(
                            color: UIColors.mediumText,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily:
                                GoogleFonts.getFont('Readex Pro').fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
