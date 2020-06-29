import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:retro_saving_world/app_slider/sliderTemplate.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/common/widgets/neon_progressbar.dart';
import 'package:retro_saving_world/dashbaord/screen.dart';
import 'package:retro_saving_world/robo_editor/robo_stat.dart';

class AppSliderScreen extends StatelessWidget {
  Widget makeYourOwnRoboButton() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        color: ThemeSelection.bgColor2,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16), topLeft: Radius.circular(16)),
            side: BorderSide(color: ThemeSelection.neonNew)),
        padding: EdgeInsets.all(16),
        onPressed: () {
          Get.to(DashBoardScreen());
        },
        child: Text(
          'Make your retro',
          style: CustomTextStyle.glowStyle(),
        ),
      ),
    );
    // return OutlineButton(
    //   borderSide: BorderSide(color: ThemeSelection.borderColor, width: 5),
    //   shape: RoundedRectangleBorder(
    //     side: BorderSide(
    //       color: ThemeSelection.neonNew,
    //     ),
    //   ),
    //   padding: EdgeInsets.all(32),
    //   onPressed: () {
    //     Get.off(DashBoardScreen());
    //   },
    //   child: Text(
    //     'Make your own Robo',
    //     style: CustomTextStyle.strokeStyle(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List botCards = [
      buildStackSlider(height, width, context,
          botImage: "assets/vct/fullRobo.png",
          botName: "Boom Bot 1.0",
          power1: 0.9,
          power2: 0.4,
          power3: 0.7),
      buildStackSlider(height, width, context,
          botImage: "assets/vct/zookBot.png",
          botName: "Zook Bot 2.0",
          power1: 0.9,
          power2: 0.4,
          power3: 0.7),
      buildStackSlider(height, width, context,
          botImage: "assets/vct/starkBot.png",
          botName: "Stark Bot 1.0",
          power1: 0.4,
          power2: 0.9,
          power3: 0.2),
      buildStackSlider(height, width, context,
          botImage: "assets/vct/shootBot.png",
          botName: "Light Bot 1.0",
          power1: 0.9,
          power2: 0.4,
          power3: 0.7),
    ];
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/vct/bg.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[

            Swiper(
              itemCount: botCards.length,
              autoplay: false,
              loop: false,
              curve: Curves.bounceIn,
              itemBuilder: (BuildContext context, int i) => botCards[i],
              pagination: SwiperPagination(),
              control: SwiperControl(
                disableColor: Colors.grey,
                color: ThemeSelection.neonNew,
              ),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
            ),
            Positioned(
              bottom: 25,
              left: 10,
              right: 10,
              child: makeYourOwnRoboButton(),
            ),
          ],
        ),
      ),
    );
  }

  Stack buildStackSlider(
    double height,
    double width,
    BuildContext context, {
    String botImage,
    String botName,
    double power1,
    double power2,
    double power3,
  }) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: ClipPath(
            clipper: RetroCardPainter(),
            child: Container(
              height: height * .8,
              width: width * .8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff77A1D3),
                    Color(0xff79CBCA),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 80,
          right: 40,
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(botImage),
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Spacer(),
              RichText(
                  textAlign: TextAlign.center,
                  softWrap: true,
                  text: TextSpan(
                      style: CustomTextStyle.glowStyle(fontSize: 14.0),
                      text: "Hi There! I'm\n",
                      children: [TextSpan(text: botName)])),
              Spacer(),
            ],
          ),
        ),
        Positioned(
          bottom: height * 0.2,
          left: width * 0.15,
          child: Container(
            width: width * 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Power 1:", style: TextStyle(color: Colors.white)),
                NeonProgressBar(power1),
                Text("Power 2:", style: TextStyle(color: Colors.white)),
                NeonProgressBar(power2),
                Text("Power 3:", style: TextStyle(color: Colors.white)),
                NeonProgressBar(power3),
                // Text("Special Powers",
                //     style: TextStyle(color: Colors.white)),
                // Text("ROBO"),
              ],
            ),
          ),
        ),
        // Positioned(
        //   right: 50,
        //   top: 10,
        //   child: Text(
        //     "Cheater",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // )
      ],
    );
  }
}
