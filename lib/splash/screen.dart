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
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Get.off(AppSliderScreen()));
    return Scaffold(
      body: Column(
        children: <Widget>[
          Lottie.asset('asset/lottie/lottieRobo.json',
              animate: true,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7),
          Text(
            'Robo Maker',
            style: CustomTextStyle.glowStyle(),
          )
        ],
      ),
    );
  }
}
