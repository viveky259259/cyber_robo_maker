import 'package:flutter/material.dart';

class NeonProgressBar extends StatefulWidget {
  final endValue;

  const NeonProgressBar(this.endValue);

  @override
  _NeonProgressBarState createState() => _NeonProgressBarState();
}

class _NeonProgressBarState extends State<NeonProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  double beginAnim = 0.0;
  double endAnim = 1.0;

  @override
  void initState() {
    super.initState();
    endAnim = widget.endValue;
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(() {
        setState(() {
          startProgress();
        });
      });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 20,
      decoration:

          BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
        BoxShadow(
          color: Colors.pinkAccent[700].withAlpha(100),
          blurRadius: 6.0,
          spreadRadius: 0.0,
          offset: Offset(
            0.0,
            3.0,
          ),
        ),
      ]),
      child: LinearProgressIndicator(
        backgroundColor: Colors.purple,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.purpleAccent,
        ),
        value: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  startProgress() {
    controller.forward();
  }

  stopProgress() {
    controller.stop();
  }

  resetProgress() {
    controller.reset();
  }
}
