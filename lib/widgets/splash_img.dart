import 'package:flutter/material.dart';

class SplashImgWidget extends StatelessWidget {
  final double width;
  final double height;

  const SplashImgWidget({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('assets/images/tango.png'),
      width: width,
      height: height,
    );
  }
}
