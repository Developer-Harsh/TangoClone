import 'package:flutter/material.dart';

class UIColors {
  static const Color scaffold = Color(0xFFFFFFFF);

  static const Color highText = Color.fromARGB(255, 34, 34, 37);
  static const Color mediumText = Color.fromARGB(255, 88, 88, 94);
  static const Color lowText = Color.fromARGB(255, 159, 159, 165);
  static const Color box_color = Color.fromARGB(255, 247, 247, 249);
  static const Color pink = Color(0xFFFF1563);

  static const LinearGradient createRoomGradient = LinearGradient(
    begin: Alignment.topLeft, // Start from the top-left corner
    end: Alignment.bottomRight, // End at the bottom-right corner
    colors: [Color(0xFFC049E1), Color(0xFFFF1563)],
  );
}
