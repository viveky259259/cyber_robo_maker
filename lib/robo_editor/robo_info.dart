import 'dart:io';

import 'package:retro_saving_world/common/widgets/special_power.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retro_saving_world/common/widgets/neon_progressbar.dart';

class RobotInfo extends StatefulWidget {
  final File image;

  RobotInfo(this.image);

  @override
  _RobotInfoState createState() => _RobotInfoState();
}

class _RobotInfoState extends State<RobotInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(
              widget.image,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.fitWidth,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chester",
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Power 1:",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  NeonProgressBar(0.6),
                  Text("Power 2:",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  NeonProgressBar(0.4),
                  Text("Power 3:",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  NeonProgressBar(0.9),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Special Powers",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  SizedBox(
                    height: 10,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
