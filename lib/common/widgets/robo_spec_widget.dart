import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../themes.dart';
import 'custom_icon.dart';
import 'neon_progressbar.dart';

class RoboSpecWidget extends StatefulWidget {
  final String specName;
  final double value;
  final IconData icon;

  const RoboSpecWidget({
    this.specName, this.value, this.icon
  });

  @override
  _RoboSpecWidgetState createState() => _RoboSpecWidgetState();
}

class _RoboSpecWidgetState extends State<RoboSpecWidget> {
  String specName;
  double value;
  IconData icon;

  @override
  void initState() {
    super.initState();
    specName = widget.specName;
    value = widget.value;
    icon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIcon(icon, color: Colors.white,),
                SizedBox(width: 10,),
                Text(specName,
                    style: TextStyle(
                        fontFamily: ThemeSelection.EvilEmpire,
                        fontSize: 20.0,
                        color: Colors.white)),
              ]),
          NeonProgressBar(value)
        ],
      ),
    );
  }
}