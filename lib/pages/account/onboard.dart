import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home.dart';

class OnboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 32,
                top: 643,
                child: Container(
                  width: 330,
                  height: 78,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 228,
                        top: 0,
                        child: Container(
                          width: 102,
                          height: 78,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 102,
                                  height: 78,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF6F6F8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 30,
                                top: 51,
                                child: Text(
                                  'Nearby',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.getFont('Readex Pro')
                                            .fontFamily,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 33,
                                top: 13,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("/img/nearby.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 114,
                        top: 0,
                        child: Container(
                          width: 102,
                          height: 78,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 102,
                                  height: 78,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF6F6F8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 32,
                                top: 51,
                                child: Text(
                                  'Dating',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.getFont('Readex Pro')
                                            .fontFamily,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 33,
                                top: 13,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("/img/dating.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 102,
                          height: 78,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 102,
                                  height: 78,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF6F6F8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 32,
                                top: 51,
                                child: Text(
                                  'Artists',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.getFont('Readex Pro')
                                            .fontFamily,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 33,
                                top: 13,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("/img/piano.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 98,
                top: 258,
                child: Container(
                  width: 198,
                  height: 198,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("/img/cat_hi.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 129,
                top: 133,
                child: Text(
                  'and get a Free Gift',
                  style: TextStyle(
                    color: Color(0xFF383A3E),
                    fontSize: 15,
                    fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 86,
                top: 101,
                child: Text(
                  'Choose your interests',
                  style: TextStyle(
                    color: Color(0xFF191A1C),
                    fontSize: 20,
                    fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 348,
                top: 40,
                child: GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isSkipped', true);

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFF787C86),
                      fontSize: 12,
                      fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
