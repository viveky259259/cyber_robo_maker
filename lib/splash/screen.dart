import 'package:flutter/material.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/dashbaord/screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1)).then((value) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (context) => DashBoardScreen())));
    return Scaffold(
      body: Center(
        child: Text(
          'Robo',
          style: TextStyleSelection.strokeStyle(),
        ),
      ),
    );
  }
}
