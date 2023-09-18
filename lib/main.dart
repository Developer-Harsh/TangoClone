import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tango/utils/preferences.dart';

import 'pages/splash.dart';

void main() {
  WidgetsFlutterBinding();
  EasyPrefs.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: "Starline",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
      },
    );
  }
}
