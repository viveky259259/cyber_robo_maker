import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:retro_saving_world/common/widgets/custom_icon.dart';
import 'package:screenshot/screenshot.dart';

import 'robo_info.dart';

class RoboStats extends StatefulWidget {
  final File image;

  RoboStats(this.image);

  @override
  _RoboStatsState createState() => _RoboStatsState();
}

class _RoboStatsState extends State<RoboStats> {
  ScreenshotController controller;

  @override
  void initState() {
    super.initState();
    controller = ScreenshotController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Screenshot(
            controller: controller,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/vct/bg.jpg"))),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
//                  border: Border.all(color: Colors.pinkAccent[700], width: 2.0),
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
                Opacity(
                  opacity: 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/carbg.png",
                    ),
                  ),
                ),
                SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: RobotInfo(widget.image)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RaisedButton(
          color: ThemeSelection.bgColor2,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              side: BorderSide(color: ThemeSelection.neonNew)),
          padding: EdgeInsets.all(16),
          onPressed: () async {
            File shareImage = await controller.capture(pixelRatio: 4);
            GallerySaver.saveImage(shareImage.path, albumName: 'My Robots');
            final Uint8List bytes = await shareImage.readAsBytesSync();
            await Share.file(
                'My Robo', 'robo.png', bytes.buffer.asUint8List(), 'image/png',
                text:
                    'Hey Cybernaut, Take a look at my custom robot "Jarvis Hack", assembled using this beautiful app Cyber Robo Maker! Cyber Robo Maker lets you assemble your favorite custom robot in a simple way by just a "Drag & Drop."');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIcon(FontAwesomeIcons.share, size: 24, color: Colors.white),
              SizedBox(
                width: 10,
              ),
              Text(
                'Share',
                style: CustomTextStyle.glowStyle(),
              ),
            ],
          )),
    );
  }
}
