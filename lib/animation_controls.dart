import 'dart:math';

import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';

class AnimationControls extends FlareController {

  ActorAnimation _waterToKnight;
  ActorAnimation _knightToWater;

  double _timeFrame = 0.0;
  double _currentTimeFrame = 0;
  double _smoothTime =3;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if(artboard.name.compareTo("Artboard") == 0) {
      _currentTimeFrame += (_timeFrame - _currentTimeFrame) * min(1, elapsed*_smoothTime);
      _waterToKnight.apply(_currentTimeFrame, artboard, 1);
    }
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    if(artboard.name.compareTo("Artboard") == 0) {
      _waterToKnight = artboard.getAnimation("Water_Knight");
      //_knightToWater = artboard.getAnimation("Knight_Water");
    }
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
  }

  void resetTimeFrame() {
    _currentTimeFrame = 0;
  }

  void updateTimeFrame(double time) {
    _timeFrame += time;
  }

}