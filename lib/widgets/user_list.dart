import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/LiveUsers.dart';
import '../utils/colors.dart';

class UserWidget extends StatelessWidget {
  final LiveUsers data;

  const UserWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(
                  data.cover,),
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(70, 2, 2, 2),
              ),
              width: double.infinity,
              height: 250.0,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/eye.svg',
                    width: 16,
                    height: 16,
                    color: UIColors.scaffold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      data.viewers,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily:
                            GoogleFonts.getFont('Readex Pro').fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipOval(
                    child: Image(
                      image: NetworkImage(data.profile),
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily:
                                GoogleFonts.getFont('Readex Pro').fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/diamond.svg',
                                width: 12,
                                color: UIColors.scaffold,
                                height: 12,
                              ),
                            ),
                            Text(
                              data.point,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: GoogleFonts.getFont('Readex Pro')
                                    .fontFamily,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
