import 'package:flutter/material.dart';
import 'package:retro_saving_world/common/themes.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final double size;
  final Color color;

  CustomIcon(this.iconData,
      {this.size = 24, this.color = ThemeSelection.blueNeonDark});

  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
