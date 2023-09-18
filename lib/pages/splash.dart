import 'package:flutter/material.dart';
import 'package:tango/pages/account/my_account.dart';
import 'package:tango/pages/home/home.dart';
import 'package:tango/utils/preferences.dart';
import '../utils/colors.dart';
import '../widgets/splash_img.dart';
import './account/onboard.dart';

class SplashPage extends StatelessWidget {
  bool isDevelopment = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => isDevelopment == true
                ? MyAccountPage()
                : EasyPrefs.instance.getBool('isOnboarded') == true
                    ? const HomePage()
                    : OnboardPage(),
          ),
        );
      },
    );

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
