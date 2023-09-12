import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/splash_img.dart';
import './account/onboard.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnboardPage()),
      );
    });

    return Scaffold(
      backgroundColor: UIColors.scaffold,
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return const SplashImgWidget(
                width: 170,
                height: 170,
              );
            } else if (constraints.maxWidth < 1200) {
              return const SplashImgWidget(
                width: 230,
                height: 230,
              );
            } else {
              return const SplashImgWidget(
                width: 300,
                height: 300,
              );
            }
          },
        ),
      ),
    );
  }
}
