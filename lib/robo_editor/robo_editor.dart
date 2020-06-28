import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RoboEditorScreen extends StatefulWidget {
  @override
  _RoboEditorScreenState createState() => _RoboEditorScreenState();
}

class _RoboEditorScreenState extends State<RoboEditorScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Card(
          color: Colors.yellow.shade200,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: CircularPercentIndicator(
              radius: 64.0,
              lineWidth: 5.0,
              percent: 0.5,
              center: Text("50%"),
              circularStrokeCap: CircularStrokeCap.square,
              backgroundColor: Color(0xff1261d1),
              maskFilter: MaskFilter.blur(BlurStyle.solid, 2),
              linearGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffc4ffff), Color(0xff08ddea)],
              ),
            ),
          ),
        )
      ],
    );
  }
}
