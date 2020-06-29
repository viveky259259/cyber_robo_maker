import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/common/widgets/custom_icon.dart';
import 'package:retro_saving_world/common/widgets/robo_spec_widget.dart';
import 'package:retro_saving_world/common/widgets/special_power.dart';
import 'package:retro_saving_world/robo_editor/robo_output.dart';

class RobotInfo extends StatefulWidget {
  @override
  _RobotInfoState createState() => _RobotInfoState();
}

class _RobotInfoState extends State<RobotInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
            margin: EdgeInsets.all(20),
            child: Column(children: [
              Image.asset(
                "assets/vct/completedRobot.png",
                width: 200,
                height: 200,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "Jarvis Hack",
                    style: TextStyle(
                        fontFamily: ThemeSelection.BigSpace,
                        fontSize: 40.0,
                        color: Colors.white),
                  ),
                ),
              ),
              RoboSpecWidget(
                specName: "Power 1",
                value: 0.8,
                icon: FontAwesomeIcons.fantasyFlightGames,
              ),
              RoboSpecWidget(
                specName: "Power 2",
                value: 0.4,
                icon: FontAwesomeIcons.superpowers,
              ),
              RoboSpecWidget(
                specName: "Power 3",
                value: 0.5,
                icon: FontAwesomeIcons.shippingFast,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Special Powera',
                    style: TextStyle(
                        fontFamily: ThemeSelection.BigSpace,
                        fontSize: 15.0,
                        color: Colors.white)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SpecialPower(
                      powerName: 'Wind Blast',
                      icon: FontAwesomeIcons.wind,
                    ),
                    SpecialPower(
                      powerName: 'Cannon Blast',
                      icon: FontAwesomeIcons.certificate,
                    ),
                    SpecialPower(
                      powerName: 'Cosmic Punch',
                      icon: FontAwesomeIcons.handRock,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: ThemeSelection.bgColor2,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                    side: BorderSide(color: ThemeSelection.neonNew)),
                padding: EdgeInsets.all(16),
                onPressed: () {
                  Get.to(RoboOutPutScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(FontAwesomeIcons.share,
                        size: 24, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Share',
                      style: CustomTextStyle.glowStyle(),
                    ),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
