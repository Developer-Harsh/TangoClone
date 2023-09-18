import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/preferences.dart';
import '../../widgets/grad_button.dart';
import '../home/home.dart';

class OnboardPage extends StatefulWidget {
  //const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  bool isArtist = false;
  bool isDating = false;
  bool isNearby = false;
  bool isButtonVisible = false;

  Color datingColor = UIColors.box_color;
  Color datingBorder = UIColors.scaffold;

  Color nearbyColor = UIColors.box_color;
  Color nearbyBorder = UIColors.scaffold;

  Color artistColor = UIColors.box_color;
  Color artistBorder = UIColors.scaffold;

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
                  EasyPrefs.instance.setBool('isOnboarded', true),
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
                    bottom: 120.00,
                    right: 10.00,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (!isArtist) {
                          artistColor = Colors.white;
                          artistBorder = UIColors.box_color;

                          isButtonVisible = true;
                          isArtist = true;
                        } else {
                          artistColor = UIColors.box_color;
                          artistBorder = Colors.white;

                          isButtonVisible = false;
                          isArtist = false;
                        }
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: artistColor,
                        border: Border.all(
                          color: artistBorder,
                          width: 1.3,
                          style: BorderStyle.solid,
                        ),
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
                            'Artist',
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 120.00,
                    left: 10.00,
                    right: 10.00,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (!isDating) {
                          datingColor = Colors.white;
                          datingBorder = UIColors.box_color;

                          isButtonVisible = true;
                          isDating = true;
                        } else {
                          datingColor = UIColors.box_color;
                          datingBorder = Colors.white;

                          isButtonVisible = false;
                          isDating = false;
                        }
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: datingColor,
                        border: Border.all(
                          color: datingBorder,
                          width: 1.3,
                          style: BorderStyle.solid,
                        ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 120.00,
                    left: 10.00,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (!isNearby) {
                          nearbyColor = Colors.white;
                          nearbyBorder = UIColors.box_color;

                          isButtonVisible = true;
                          isNearby = true;
                        } else {
                          nearbyColor = UIColors.box_color;
                          nearbyBorder = Colors.white;

                          isButtonVisible = false;
                          isNearby = false;
                        }
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: nearbyColor,
                        border: Border.all(
                          color: nearbyBorder,
                          width: 1.3,
                          style: BorderStyle.solid,
                        ),
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
                ),
              ],
            ),
          ),
          Visibility(
            visible: blocker(),
            child: Positioned(
              left: 40,
              right: 40,
              bottom: 15,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: GradientButton(
                  string: 'Claim free gift',
                  gradientColors: const [
                    Color.fromARGB(255, 255, 69, 205),
                    Color.fromARGB(255, 255, 0, 93),
                  ],
                  onPressed: () => {
                    EasyPrefs.instance.setBool('isDating', true),
                    EasyPrefs.instance.setBool('isNearby', true),
                    EasyPrefs.instance.setBool('isArtist', true),
                    EasyPrefs.instance.setBool('isOnboarded', true),
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
          ),
        ],
      ),
    );
  }

  bool blocker() {
    if (isArtist) {
      return true;
    } else if (isDating) {
      return true;
    } else if (isNearby) {
      return true;
    } else {
      return false;
    }
  }
}
