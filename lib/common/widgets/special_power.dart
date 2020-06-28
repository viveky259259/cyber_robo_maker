import 'package:flutter/material.dart';

import '../themes.dart';

class SpecialPower extends StatefulWidget {
  final String powerName;
  final IconData icon;

  const SpecialPower({
    this.powerName, this.icon
  });

  @override
  _SpecialPowerState createState() => _SpecialPowerState();
}

class _SpecialPowerState extends State<SpecialPower> {
  String powerName;
  IconData icon;

  @override
  void initState() {
    super.initState();
    powerName = widget.powerName;
    icon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.purple.shade800,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purpleAccent[400],
        label: Text(powerName,
            style: TextStyle(
                fontFamily: ThemeSelection.BigSpace,
                fontSize: 15.0,
                color: Colors.white)),
      ),
    );
  }
}