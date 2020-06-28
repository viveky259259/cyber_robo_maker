import 'package:flutter/material.dart';
import 'package:retro_saving_world/common/themes.dart';

class CustomTextStyle {
  static TextStyle strokeStyle(
          {color: ThemeSelection.blueNeon, fontSize: 20.0}) =>
      TextStyle(
        letterSpacing: 5,
        fontSize: fontSize,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = color,
//    fontFamily: "NeonLights",
      );

  static TextStyle glowStyle({color: Colors.white,fontSize:20.0}) => TextStyle(
      letterSpacing: 5,
      fontSize: fontSize,
      shadows: [
        BoxShadow(
          color: ThemeSelection.blueNeon,
          blurRadius: 20.0,
          spreadRadius: 20.0,
        ),
        BoxShadow(
          color: ThemeSelection.blueNeon,
          blurRadius: 30.0,
          spreadRadius: 30.0,
        ),
        BoxShadow(
          color: ThemeSelection.blueNeon,
          blurRadius: 30.0,
          spreadRadius: 2.0,
        ),
        BoxShadow(
          color: ThemeSelection.blueNeon,
          blurRadius: 200.0,
          spreadRadius: 200.0,
        ),
      ],
      color: color
//    fontFamily: "NeonLights",
      );
}
