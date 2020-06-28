import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/robomaker/robo_stats_screen.dart';
import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/robo_editor/robo_editor.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool isInitializing;

  @override
  void initState() {
    super.initState();
    isInitializing = true;
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        isInitializing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isInitializing
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Please wait', style: CustomTextStyle.glowStyle()),
                  SizedBox(
                    height: 32,
                  ),
                  Text('Initializing..',
                      style: CustomTextStyle.strokeStyle()),
                ],
              ),
            )
          : SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: RoboEditorScreen()),
      body: SafeArea(
        child: isInitializing
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Please wait', style: CustomTextStyle.glowStyle()),
                    SizedBox(
                      height: 32,
                    ),
                    Text('Initializing..',
                        style: CustomTextStyle.strokeStyle()),
                  ],
                ),
              )
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: RoboEditorScreen()),
      ),
      bottomNavigationBar: isInitializing
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: ThemeSelection.bgColor2,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                    side: BorderSide(color: ThemeSelection.neonNew)),
                padding: EdgeInsets.all(16),
                onPressed: () {
                  Get.to(RoboStats());
                },
                child: Text(
                  'Generate',
                  style: CustomTextStyle.glowStyle(),
                ),
              ),
            ),
    );
  }
}
