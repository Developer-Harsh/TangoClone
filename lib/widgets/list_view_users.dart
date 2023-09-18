import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/widgets/grad_circle_button.dart';

import '../models/User.dart';
import '../utils/colors.dart';

class ListUserWidget extends StatelessWidget {
  final User data;

  const ListUserWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image(
              image: NetworkImage(
                data.profile,
              ),
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    data.name,
                    style: TextStyle(
                      color: UIColors.highText,
                      fontSize: 14,
                      fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/diamond.svg',
                          width: 12,
                          color: UIColors.lowText,
                          height: 12,
                        ),
                      ),
                      Text(
                        data.point,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: UIColors.lowText,
                          fontSize: 12,
                          fontFamily:
                              GoogleFonts.getFont('Readex Pro').fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                          left: 10,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/users_fill.svg',
                          width: 12,
                          color: UIColors.mediumText,
                          height: 12,
                        ),
                      ),
                      Text(
                        data.following,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: UIColors.mediumText,
                          fontSize: 12,
                          fontFamily:
                              GoogleFonts.getFont('Readex Pro').fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          GradientIconButton(
            gradientColors: [
              Color.fromARGB(255, 255, 69, 205),
              Color.fromARGB(255, 255, 0, 93),
            ],
            svgAsset: 'assets/icons/plus.svg',
            iconColor: UIColors.scaffold,
            height: 40,
            width: 40,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
