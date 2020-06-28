import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Retro());
  }
}

class Retro extends StatefulWidget {
  @override
  _RetroState createState() => _RetroState();
}

class _RetroState extends State<Retro> with TickerProviderStateMixin {
  /// List of Assets;
  ///
  ///
  List<String> assets = [
    "assets/vct/body.png",
    "assets/vct/head.png",
    "assets/vct/bottom.png",
    "assets/vct/body1.png",
    "assets/vct/straightFaceBot.png",
    "assets/vct/straightFaceBotWithAntena.png"
  ];

  bool acceptHead = false;
  bool acceptLegs = false;

  double _headPlaceHolderVisible = 0;
  double _legPlaceHolderVisible = 0;
  double _sigmaX = 0.8; // from 0-10
  double _sigmaY = 0.6; // from 0-10
  double _opacity = 0.6; // from 0-1.0
  double statusBarHeight;

  String _currentHeadImagePlaceHolder="assets/vct/head.png";

  String torso = "assets/vct/body.png";

  AudioCache audioCache = new AudioCache();
  AudioPlayer advancedPlayer = new AudioPlayer();

  AudioCache audioCachePart = new AudioCache();
  AudioPlayer advancedPlayerPart = new AudioPlayer();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    audioCache.loop("cyberpunk.mp3", volume: 0.1);

    advancedPlayerPart = new AudioPlayer();
    audioCachePart = new AudioCache(fixedPlayer: advancedPlayerPart);
  }

  Widget _createBlankContaienrs() {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.height / 6,
    );
  }

  Widget _stopSong() {
    return ButtonTheme(
      minWidth: 20.0,
      height: 20.0,
      child: RaisedButton(
        child: Icon(
          Icons.volume_off,
          color: Colors.white,
        ),
        color: Colors.pinkAccent,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(12, 9),
                bottomRight: Radius.elliptical(12, 9))),
        onPressed: () {
          advancedPlayer.stop();
        },
      ),
    );
  }

  Widget _createHead() {
    return Transform.translate(
      offset: Offset(9, 15),
      child: DragTarget(
        builder: (context, List<String> candidateData, rejectedData) {
          print(candidateData);
          return acceptHead
              ? Image(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  image: AssetImage(_currentHeadImagePlaceHolder),
                )
              : Opacity(
                  opacity: _headPlaceHolderVisible,
                  child: Image(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.height / 6,
                    image: AssetImage(_currentHeadImagePlaceHolder),
                  ),
                );
        },
        onAccept: (data) {
          print(data);
          if (data == "assets/vct/head.png") {
            this.setState(() {
              acceptHead = true;
            });
            return true;
          } else {
            return false;
          }
        },
        onWillAccept: (data) {
          return true;
        },
      ),
    );
  }

  Widget _createLegs() {
    return Transform.translate(
      offset: Offset(6, -6),
      child: DragTarget(
        builder: (context, List<String> candidateData, rejectedData) {
          print(candidateData);
          return acceptLegs
              ? Image(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  image: AssetImage("assets/vct/bottom.png"),
                )
              : Opacity(
                  opacity: _legPlaceHolderVisible,
                  child: Image(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.height / 6,
                    image: AssetImage("assets/vct/bottom.png"),
                  ),
                );
        },
        onAccept: (data) {
          print(data);
          if (data == "assets/vct/bottom.png") {
            this.setState(() {
              acceptLegs = true;
            });
            return true;
          } else {
            return false;
          }
        },
        onWillAccept: (data) {
          return true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/vct/bg.jpg"))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.pinkAccent[700], width: 2.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 8.0,
                        spreadRadius: 0.0,
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),

                    /// First Row of Matrix
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _createBlankContaienrs(),
                        _createHead(),
                        _createBlankContaienrs(),
                      ],
                    ),

                    /// Second Row of Matrix
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _createBlankContaienrs(),
                        Container(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Image(
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.height / 6,
                            image: AssetImage(torso),
                          ),
                        ),
                        _createBlankContaienrs(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        _createBlankContaienrs(),
                        _createLegs(),
                        _createBlankContaienrs(),
                      ],
                    ),

                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(9.0),
                      height: 70.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: assets.length,
                          itemBuilder: (context, i) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.pinkAccent[700],
                                      width: 2.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pinkAccent[700],
                                      blurRadius: 8.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                              margin: EdgeInsets.only(left: 10.0),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Material(
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft:
                                              Radius.elliptical(12, 9))),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      if (assets[i] == "assets/vct/body.png" ||
                                          assets[i] == "assets/vct/body1.png") {
                                        this.setState(() {
                                          this.torso = assets[i];
                                        });
                                      }
                                    },
                                    child: Draggable(
                                      onDragStarted: () {
                                        if (assets[i] ==
                                            "assets/vct/head.png") {
                                          this.setState(() {
                                            _headPlaceHolderVisible = 0.5;
                                            this._currentHeadImagePlaceHolder = assets[i];
                                          });
                                        } else if (assets[i] ==
                                            "assets/vct/bottom.png") {
                                          this.setState(() {
                                            _legPlaceHolderVisible = 0.5;
                                          });
                                        }
                                      },
                                      onDragEnd: (data) {
                                        if (assets[i] ==
                                            "assets/vct/head.png") {
                                          this.setState(() {
                                            _headPlaceHolderVisible = 0.0;
                                          });
                                        } else if (assets[i] ==
                                            "assets/vct/bottom.png") {
                                          this.setState(() {
                                            _legPlaceHolderVisible = 0.0;
                                          });
                                        }
                                      },
                                      onDraggableCanceled: (v, d) {
                                        if (assets[i] ==
                                            "assets/vct/head.png") {
                                          this.setState(() {
                                            _headPlaceHolderVisible = 0.0;
                                          });
                                        } else if (assets[i] ==
                                            "assets/vct/bottom.png") {
                                          this.setState(() {
                                            _legPlaceHolderVisible = 0.0;
                                          });
                                        }
                                      },
                                      onDragCompleted: () {
                                        audioCachePart.play("partfix.mp3",
                                            volume: 1.0);
                                        if (assets[i] ==
                                            "assets/vct/head.png") {
                                          this.setState(() {
                                            _headPlaceHolderVisible = 0.0;
                                          });
                                        } else if (assets[i] ==
                                            "assets/vct/bottom.png") {
                                          this.setState(() {
                                            _legPlaceHolderVisible = 0.0;
                                          });
                                        }
                                      },
                                      data: assets[i],
                                      childWhenDragging: Image(
                                        height: 50,
                                        image: AssetImage(assets[i]),
                                      ),
                                      feedback: Image(
                                        height: 90,
                                        image: AssetImage(assets[i]),
                                      ),
                                      child: Image(
                                        height: 50,
                                        image: AssetImage(assets[i]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          left: 10,
          child: RaisedButton(
            elevation: 4,
            color: Colors.pinkAccent,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(12, 9),
                    bottomRight: Radius.elliptical(12, 9))),
            onPressed: () {},
            child: Text(
              "Jarvish Hack",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(top: 20.0, right: 10, child: _stopSong()),
      ],
    ));
  }
}
