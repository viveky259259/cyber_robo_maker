import 'package:flutter/material.dart';
import 'package:retro_saving_world/common/themes.dart';

class TextStyleSelection {
  static TextStyle strokeStyle({color: ThemeSelection.neonNew}) => TextStyle(
        letterSpacing: 5,
        fontSize: 50,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = color,
//    fontFamily: "NeonLights",
      );
  static final TextStyle glowStyle = TextStyle(
    letterSpacing: 5,
    fontSize: 50,
    shadows: [
      BoxShadow(
        color: ThemeSelection.neonNew,
        blurRadius: 1.0,
        spreadRadius: 1.0,
      ),
      BoxShadow(
        color: ThemeSelection.neonNew,
        blurRadius: 30.0,
        spreadRadius: 30.0,
      ),
      BoxShadow(
        color: ThemeSelection.neonNew,
        blurRadius: 30.0,
        spreadRadius: 2.0,
      ),
      BoxShadow(
        color: ThemeSelection.neonNew,
        blurRadius: 200.0,
        spreadRadius: 200.0,
      ),
    ],
    color: Colors.white,
//    fontFamily: "NeonLights",
  );
}
