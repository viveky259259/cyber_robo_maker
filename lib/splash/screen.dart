import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:retro_saving_world/app_slider/screen.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController _controller;
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'asset/video/bgvideo.mp4',
    )
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Get.off(AppSliderScreen()));
    chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        autoPlay: true,
        looping: true,
        allowFullScreen: true,
        autoInitialize: true,
        showControls: false,
        showControlsOnInitialize: false);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Chewie(
                controller: chewieController,
              )),
          Column(
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
        ],
      ),
    );
  }
}
