import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:retro_saving_world/app_slider/screen.dart';
import 'package:retro_saving_world/common/text_styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4))
        .then((value) => Get.off(AppSliderScreen()));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/vct/bg.jpg"))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
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
          Column(
            children: <Widget>[
              Lottie.asset('assets/lottie/lottieRobo.json',
                  animate: true,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7),
              Text(
                'Robo Maker',
                style: CustomTextStyle.glowStyle(fontSize: 40.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
