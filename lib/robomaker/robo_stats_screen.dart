import 'dart:ui';

import 'package:flutter/material.dart';

import 'robo_info_screen.dart';

class RoboStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/vct/bg.jpg"))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  border:
                  Border.all(color: Colors.pinkAccent[700], width: 2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                    ),
                  ]),
            ),
          ),
        ),
        Center(child: RobotInfo()),
      ],
    ));
  }
}
