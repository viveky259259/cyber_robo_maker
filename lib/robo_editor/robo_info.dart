import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retro_saving_world/common/widgets/neon_progressbar.dart';

class RobotInfo extends StatefulWidget {
  final File image;

  RobotInfo(this.image);

  @override
  _RobotInfoState createState() => _RobotInfoState();
}

class _RobotInfoState extends State<RobotInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(
              widget.image,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.cover,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text("Power 1:", style: TextStyle(color: Colors.white)),
                  NeonProgressBar(0.6),
                  Text("Power 2:", style: TextStyle(color: Colors.white)),
                  NeonProgressBar(0.4),
                  Text("Power 3:", style: TextStyle(color: Colors.white)),
                  NeonProgressBar(0.9),
                  Text("Special Powers", style: TextStyle(color: Colors.white)),
                  Wrap(
                    runSpacing: 16,
                    spacing: 16,
                    children: [
                      Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.purple.shade800,
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purpleAccent[400],
                        label: Text('Wind Blast',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.purple.shade800,
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purpleAccent[400],
                        label: Text('Wind Blast',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.purple.shade800,
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purpleAccent[400],
                        label: Text('Wind Blast',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.purple.shade800,
                          child: Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.purpleAccent[400],
                        label: Text('Wind Blast',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
