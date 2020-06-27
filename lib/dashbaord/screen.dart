import 'package:flutter/material.dart';
import 'package:retro_saving_world/common/text_styles.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make your Robot',
            style: CustomTextStyle.strokeStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Please wait', style: CustomTextStyle.glowStyle()),
            SizedBox(
              height: 32,
            ),
            Text('Initiating..', style: CustomTextStyle.strokeStyle()),
          ],
        ),
      ),
    );
  }
}
