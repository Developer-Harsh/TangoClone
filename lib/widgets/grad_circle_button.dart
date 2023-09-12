import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GradientIconButton extends StatelessWidget {
  final List<Color> gradientColors;
  final String svgAsset;
  final Color iconColor;
  final Function onPressed;

  GradientIconButton({
    required this.gradientColors,
    required this.svgAsset,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            svgAsset,
            color: iconColor,
            width: 26.0,
            height: 26.0,
          ),
        ),
      ),
    );
  }
}
