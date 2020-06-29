import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:retro_saving_world/common/text_styles.dart';
import 'package:screenshot/screenshot.dart';

class RoboEditorScreen extends StatefulWidget {
  final ScreenshotController controller;

  RoboEditorScreen(this.controller);

  @override
  _RoboEditorScreenState createState() => _RoboEditorScreenState();
}

class _RoboEditorScreenState extends State<RoboEditorScreen> {
  ValueNotifier<int> progress;

  @override
  void initState() {
    super.initState();
    progress = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Retro(widget.controller, progress),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 84),
            child: ValueListenableBuilder<int>(
                valueListenable: progress,
                builder: (context, value, child) {
                  return CircularPercentIndicator(
                    radius: 64.0,
                    lineWidth: 5.0,
                    percent: value * 0.01,
                    center: Text('$value',style: CustomTextStyle.glowStyle(fontSize: 20.0),),
                    circularStrokeCap: CircularStrokeCap.square,
                    backgroundColor: Color(0xff1261d1),
                    maskFilter: MaskFilter.blur(BlurStyle.solid, 2),
                    linearGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffc4ffff), Color(0xff08ddea)],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}

class Retro extends StatefulWidget {
  final ScreenshotController controller;
  final ValueNotifier<int> progress;

  Retro(this.controller, this.progress);

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
    "assets/vct/straightFaceBotWithAntena.png",
    "assets/vct/right.png",
    "assets/vct/leftHand.png"
  ];

  bool acceptHead = false;
  bool acceptLegs = false;
  bool acceptRightHand = false;
  bool acceptLeftHand = false;

  List<String> allPartsCreates = [];

  double _headPlaceHolderVisible = 0;
  double _legPlaceHolderVisible = 0;
  double _rightPlaceHolderVisible = 0;
  double _leftPlaceHolderVisible = 0;

  double _sigmaX = 0.8; // from 0-10
  double _sigmaY = 0.6; // from 0-10
  double _opacity = 0.6; // from 0-1.0
  double statusBarHeight;
  double bodyTranslateX = -10.0;

  String _currentHeadImagePlaceHolder = "assets/vct/head.png";

  String torso = "assets/vct/body.png";

  String top = "top";
  String bottom = "bottom";
  String left = "left";
  String right = "right";

  AudioCache audioCache = new AudioCache();
  AudioPlayer advancedPlayer = new AudioPlayer();

  AudioCache audioCachePart = new AudioCache();
  AudioPlayer advancedPlayerPart = new AudioPlayer();

  AudioCache audioCachePartc = new AudioCache();
  AudioPlayer advancedPlayerPartc = new AudioPlayer();
  GlobalKey torsoKey;

  List<OverlayEntry> overlays = [];

  @override
  void initState() {
    super.initState();
    initPlayer();
    torsoKey = GlobalKey();
    audioCache = new AudioCache();
    advancedPlayer = new AudioPlayer();

    audioCachePart = new AudioCache();
    advancedPlayerPart = new AudioPlayer();

    audioCachePartc = new AudioCache();
    advancedPlayerPartc = new AudioPlayer();
  }

  clear() {
    for (int i = 0; i < overlays.length; i++) {
      overlays[i].remove();
    }
    overlays.clear();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    audioCache.loop("cyberpunk.mp3", volume: 0.1);

    advancedPlayerPartc = new AudioPlayer();
    audioCachePartc = new AudioCache(fixedPlayer: advancedPlayerPartc);
  }

  Widget _roboparts() {
    return Container(
      margin: EdgeInsets.all(9.0),
      padding: EdgeInsets.all(8.0),
      height: 90.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: assets.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ButtonTheme(
                minWidth: 30,
                height: 30.0,
                child: RaisedButton(
                  onPressed: () {
                    if (assets[i] == "assets/vct/body.png" ||
                        assets[i] == "assets/vct/body1.png") {
                      this.setState(() {
                        this.torso = assets[i];
                      });
                    }
                  },
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(21, 21),
                          bottomRight: Radius.elliptical(21, 21))),
                  color: Colors.pinkAccent,
                  child: Draggable(
                    onDragStarted: () {
                      RenderBox renderBox =
                          torsoKey.currentContext.findRenderObject();
                      var size = renderBox.size;
                      var offset = renderBox.localToGlobal(Offset.zero);
                      if (assets[i] == "assets/vct/head.png" ||
                          assets[i] == "assets/vct/straightFaceBot.png" ||
                          assets[i] ==
                              "assets/vct/straightFaceBotWithAntena.png") {
                        this.setState(() {
                          _headPlaceHolderVisible = 0.5;
                          this._currentHeadImagePlaceHolder = assets[i];
                        });
                      } else if (assets[i] == "assets/vct/bottom.png") {
                        this.setState(() {
                          _legPlaceHolderVisible = 0.5;
                        });
                      } else if (assets[i] == "assets/vct/right.png") {
                        this.setState(() {
                          _rightPlaceHolderVisible = 0.5;
                        });
                      } else if (assets[i] == "assets/vct/leftHand.png") {
                        this.setState(() {
                          _leftPlaceHolderVisible = 0.5;
                        });
                      }
                    },
                    onDragEnd: (data) {
                      if (assets[i] == "assets/vct/head.png" ||
                          assets[i] == "assets/vct/straightFaceBot.png" ||
                          assets[i] ==
                              "assets/vct/straightFaceBotWithAntena.png") {
                        this.setState(() {
                          _headPlaceHolderVisible = 0.0;
                        });
                      } else if (assets[i] == "assets/vct/bottom.png") {
                        this.setState(() {
                          _legPlaceHolderVisible = 0.0;
                        });
                      } else if (assets[i] == "assets/vct/right.png") {
                        this.setState(() {
                          _rightPlaceHolderVisible = 0.0;
                        });
                      } else if (assets[i] == "assets/vct/leftHand.png") {
                        this.setState(() {
                          _leftPlaceHolderVisible = 0.0;
                        });
                      }
                    },
                    onDraggableCanceled: (v, d) {
                      print("object");
                      if (assets[i] == "assets/vct/head.png" ||
                          assets[i] == "assets/vct/straightFaceBot.png" ||
                          assets[i] ==
                              "assets/vct/straightFaceBotWithAntena.png") {
                        this.setState(() {
                          _headPlaceHolderVisible = 0.0;
                        });
                      } else if (assets[i] == "assets/vct/bottom.png") {
                        this.setState(() {
                          _legPlaceHolderVisible = 0.0;
                        });
                      } else if (assets[i] == "assets/vct/right.png") {
                        this.setState(() {
                          _rightPlaceHolderVisible = 0.0;
                        });
                      } else if (assets[i] == "assets/vct/leftHand.png") {
                        this.setState(() {
                          _leftPlaceHolderVisible = 0.0;
                        });
                      }
                    },
                    onDragCompleted: () {
                      RenderBox renderBox =
                          torsoKey.currentContext.findRenderObject();
                      var size = renderBox.size;
                      var offset = renderBox.localToGlobal(Offset.zero);

                      audioCachePart.play("partfix.mp3", volume: 1.0);
                      if (assets[i] == "assets/vct/head.png") {
                        this.setState(() {
                          _headPlaceHolderVisible = 0.0;
                        });
//                        var a = OverlayEntry(
//                            builder: (context) => Positioned(
//                                  left: offset.dx,
//                                  top: offset.dy - 50,
//                                  child: Image(
//                                    height: 150,
//                                    image: AssetImage(assets[i]),
//                                  ),
//                                ));
//                        Overlay.of(context).insert(a);
//                        overlays.add(a);
                      } else if (assets[i] == "assets/vct/bottom.png") {
                        this.setState(() {
                          _legPlaceHolderVisible = 0.0;
                        });
//                        Overlay.of(context).insert(OverlayEntry(
//                            builder: (context) => Positioned(
//                                  left: offset.dx,
//                                  top: offset.dy + 100,
//                                  child: Image(
//                                    height: 150,
//                                    image: AssetImage(assets[i]),
//                                  ),
//                                )));
                      } else if (assets[i] == "assets/vct/right.png") {
                        this.setState(() {
                          _rightPlaceHolderVisible = 0.0;
                        });
//                        Overlay.of(context).insert(OverlayEntry(
//                            builder: (context) => Positioned(
//                                  left: offset.dx,
//                                  top: offset.dy + size.height / 2,
//                                  child: Image(
//                                    height: 50,
//                                    image: AssetImage(assets[i]),
//                                  ),
//                                )));
                      } else if (assets[i] == "assets/vct/leftHand.png") {
                        this.setState(() {
                          _leftPlaceHolderVisible = 0.0;
                        });
//                        Overlay.of(context).insert(OverlayEntry(
//                            builder: (context) => Positioned(
//                                  left: offset.dx + size.width,
//                                  top: offset.dy + size.height / 2,
//                                  child: Image(
//                                    height: 50,
//                                    image: AssetImage(assets[i]),
//                                  ),
//                                )));
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
            );
          }),
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
    return Align(
      alignment: Alignment.center,
      child: DragTarget(
        builder: (context, List<String> candidateData, rejectedData) {
          print(candidateData);
          return acceptHead
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Image(
                    image: AssetImage(_currentHeadImagePlaceHolder),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Opacity(
                    opacity: _headPlaceHolderVisible,
                    child: Image(
                      image: AssetImage(_currentHeadImagePlaceHolder),
                    ),
                  ),
                );
        },
        onAccept: (data) {
          print(data);
          if (data == "assets/vct/head.png" ||
              data == "assets/vct/straightFaceBot.png" ||
              data == "assets/vct/straightFaceBotWithAntena.png") {
            this.setState(() {
              acceptHead = true;
              _currentHeadImagePlaceHolder = data;
              if(!allPartsCreates.contains(top)){
                allPartsCreates.add(top);
              }

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

  Widget _createLefttHand() {
    return Align(
      alignment: Alignment.center,
      child: DragTarget(
        builder: (context, List<String> candidateData, rejectedData) {
          print(candidateData);
          return acceptLeftHand
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Image(
                    image: AssetImage("assets/vct/leftHand.png"),
                  ),
                )
              : Opacity(
                  opacity: _leftPlaceHolderVisible,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image(
                      image: AssetImage("assets/vct/leftHand.png"),
                    ),
                  ),
                );
        },
        onAccept: (data) {
          print(data);
          if (data == "assets/vct/leftHand.png") {
            this.setState(() {
              acceptLeftHand = true;
              if(!allPartsCreates.contains(left)){
                allPartsCreates.add(left);
              }
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

  Widget _createRightHand() {
    return Align(
      alignment: Alignment.center,
      child: DragTarget(
        builder: (context, List<String> candidateData, rejectedData) {
          print(candidateData);
          return acceptRightHand
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Image(
                    image: AssetImage("assets/vct/right.png"),
                  ),
                )
              : Opacity(
                  opacity: _rightPlaceHolderVisible,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image(
                      image: AssetImage("assets/vct/right.png"),
                    ),
                  ),
                );
        },
        onAccept: (data) {
          print(data);
          if (data == "assets/vct/right.png") {
            this.setState(() {
              acceptRightHand = true;
              if(!allPartsCreates.contains(right)){
                allPartsCreates.add(right);
              }
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
    return Align(
      alignment: Alignment.center,
      child: DragTarget(
        builder: (context, List<String> candidateData, rejectedData) {
          print(candidateData);
          return acceptLegs
              ? Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Image(
                    image: AssetImage("assets/vct/bottom.png"),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Opacity(
                    opacity: _legPlaceHolderVisible,
                    child: Image(
                      image: AssetImage("assets/vct/bottom.png"),
                    ),
                  ),
                );
        },
        onAccept: (data) {
          print(data);
          if (data == "assets/vct/bottom.png") {
            this.setState(() {
              acceptLegs = true;
              if(!allPartsCreates.contains(bottom)){
                allPartsCreates.add(bottom);
              }
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

  Widget _backDropFileter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        decoration: BoxDecoration(
//            border: Border.all(color: Colors.pinkAccent[700], width: 2.0),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 8.0,
                spreadRadius: 0.0,
              ),
            ]),
      ),
    );
  }

  Widget _createTorso() {
    return Align(
      alignment: Alignment.center,
      child: Container(
          key: torsoKey,
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 3,
          child: Image(
            image: AssetImage(torso),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    Future.delayed(Duration(milliseconds: 374)).then((value){
      widget.progress.value = allPartsCreates.length * 25;
      widget.progress.notifyListeners();
    });
    if (allPartsCreates.length >= 4) {
      audioCachePartc.play("clap.mp3");
    }
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/vct/bg.jpg"))),
      child: Stack(
        children: <Widget>[
          Screenshot(
            controller: widget.controller,
            child: Stack(
              children: <Widget>[
                _backDropFileter(),
                _createTorso(),
                Positioned(
                    top: MediaQuery.of(context).size.height / 2.59,
                    bottom: 0,
                    right: 0,
                    left: MediaQuery.of(context).size.width / 30,
                    child: _createLegs()),
                Positioned(
                    top: -MediaQuery.of(context).size.height / 3.5,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: _createHead()),
                Positioned(
                    right: 0,
                    bottom: 0,
                    left: MediaQuery.of(context).size.height / 3.45,
                    top: -MediaQuery.of(context).size.width / 7,
                    child: _createLefttHand()),
                Positioned(
                    right: 0,
                    bottom: 0,
                    left: -MediaQuery.of(context).size.width / 8,
                    top: MediaQuery.of(context).size.height / 8,
                    child: _createRightHand()),
              ],
            ),
          ),
          Positioned(bottom: 1.0, left: 0.0, right: 0.0, child: _roboparts()),
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
                "Jarvis Hack",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(top: 20.0, right: 10, child: _stopSong()),
          allPartsCreates.length >= 4
              ? Lottie.asset("assets/vct/18364-celebaration.json")
              : SizedBox()
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    audioCache.clearCache();
    advancedPlayer.dispose();
    audioCachePart.clearCache();
    advancedPlayerPart.dispose();
    audioCachePartc.clearCache();
    advancedPlayerPartc.dispose();
  }
}
