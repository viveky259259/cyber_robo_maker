import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retro_saving_world/common/widgets/neon_progressbar.dart';

class RobotInfo extends StatefulWidget {
  @override
  _RobotInfoState createState() => _RobotInfoState();
}

class _RobotInfoState extends State<RobotInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Image.asset(
                "assets/vct/straightFaceBotWithAntena.png",
                width: 200,
                height: 200,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(
                    "Robot Name: ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Chester",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Power 1:", style: TextStyle(color: Colors.white)),
                  NeonProgressBar(0.6),
                  Text("Power 2:", style: TextStyle(color: Colors.white)),
                  NeonProgressBar(0.4),
                  Text("Power 3:", style: TextStyle(color: Colors.white)),
                  NeonProgressBar(0.9),
                  Text("Special Powers", style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.purple.shade800,
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purpleAccent[400],
                        label: Text('Wind Blast',
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
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