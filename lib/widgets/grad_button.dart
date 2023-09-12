import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/utils/colors.dart';

class GradientButton extends StatelessWidget {
  final List<Color> gradientColors;
  final String string;
  final Function onPressed;

  GradientButton({
    required this.string,
    required this.gradientColors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 18,
            bottom: 18,
            left: 50,
            right: 50,
          ),
          child: Text(
            string,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: UIColors.scaffold,
              fontFamily: GoogleFonts.getFont('Readex Pro').fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
