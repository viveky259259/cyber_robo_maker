import 'package:flutter/material.dart';

class RetroCard extends StatefulWidget {
  @override
  _RetroCardState createState() => _RetroCardState();
}

class _RetroCardState extends State<RetroCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: ClipPath(
              clipper: RetroCardPainter(),
              child: Container(
                height: height * .8,
                width: width * .8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff77A1D3),
                      Color(0xff79CBCA),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  
                  border: Border.all(
                    width: 2,
                    style: BorderStyle.solid,
                    color: Colors.pinkAccent[700],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RetroCardPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double roundnessFactor = 50.0;

    Path path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width - 10, roundnessFactor,
        size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
