import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'animation_controls.dart';

class RobotScreen extends StatefulWidget {
  @override
  _RobotScreenState createState() => _RobotScreenState();
}

class _RobotScreenState extends State<RobotScreen> {
  AnimationControls _flareController;
  final FlareControls robotChestControl = FlareControls();
  int currentTimeFrame = 0;
  int selectedButton = 2;

  @override
  void initState() {
    _flareController = AnimationControls();
    robotChestControl.play("Water_Knight");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              width: 200.0,
              height: 200.0,
              child: FlareActor(
                "assets/Robot Chest.flr",
                sizeFromArtboard: true,
                alignment: Alignment.center,
                controller: AnimationControls(),
                animation: "Water_Knight",
                fit: BoxFit.contain,
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              //TODO: Call listener to update the timeFrame
            },
            backgroundColor: Colors.blue.shade900,
            child: Icon(Icons.android),
          )
        ],
      ),
    );
  }
}
