import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

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
                        fit: BoxFit.cover, image: AssetImage("assets/vct/bg.jpg"))),
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
              SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: RobotInfo(widget.image)),

      ],
    ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () async {
                          File shareImage = await controller.capture(pixelRatio: 4);
                          GallerySaver.saveImage(shareImage.path,
                              albumName: 'My Robots');
                          final Uint8List bytes =
                          await shareImage.readAsBytesSync();
                          await Share.file('My Robo', 'robo.png',
                              bytes.buffer.asUint8List(), 'image/png',
                              text:
                              'Hi, Look at the amazing robo made by mw using Retro Robo Maker');
                        },
                        icon: CustomIcon(FontAwesomeIcons.whatsapp),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
