import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:retro_saving_world/common/themes.dart';
import 'package:retro_saving_world/common/widgets/custom_icon.dart';

class RoboOutPutScreen extends StatefulWidget {
  @override
  _RoboOutPutScreenState createState() => _RoboOutPutScreenState();
}

class _RoboOutPutScreenState extends State<RoboOutPutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CustomIcon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Your Robo',
          style: CustomTextStyle.glowStyle(),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Card(
              color: Theme.of(context).primaryColorLight,
              child: Column(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 10,
                      margin: EdgeInsets.only(
                          left: 24, top: 16, bottom: 8, right: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: ThemeSelection.neonNew,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                            ),
                            BoxShadow(
                              color: ThemeSelection.neonPurple,
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4.0,
                              spreadRadius: 4.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          'Height',
                          style: CustomTextStyle.glowStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 10,
                      margin: EdgeInsets.only(
                          left: 24, top: 16, bottom: 8, right: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          boxShadow: [
                            BoxShadow(
                              color: ThemeSelection.neonNew,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                            ),
                            BoxShadow(
                              color: ThemeSelection.neonPurple,
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4.0,
                              spreadRadius: 4.0,
                            ),
                          ]),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          'Weight',
                          style: CustomTextStyle.glowStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 10,
                      margin: EdgeInsets.only(
                          left: 24, top: 16, bottom: 8, right: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: ThemeSelection.neonNew,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                            ),
                            BoxShadow(
                              color: ThemeSelection.neonPurple,
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4.0,
                              spreadRadius: 4.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          'Strength',
                          style: CustomTextStyle.glowStyle(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: CustomIcon(FontAwesomeIcons.facebookSquare),
                  onPressed: () {},
                ),
                IconButton(
                  icon: CustomIcon(FontAwesomeIcons.whatsappSquare),
                  onPressed: () {},
                ),
                IconButton(
                  icon: CustomIcon(FontAwesomeIcons.instagram),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
