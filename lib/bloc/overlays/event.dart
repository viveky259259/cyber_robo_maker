import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class OverlayEvent extends Equatable {}

class AddOverLay extends OverlayEvent {
  final String type;
  final OverlayEntry overlayEntry;
  final BuildContext context;

  AddOverLay(this.type, this.overlayEntry, this.context);

  @override
  List<Object> get props => [type, overlayEntry, context];
}

class RemoveOverLays extends OverlayEvent {
  final String type;
  final BuildContext context;

  RemoveOverLays(this.type, this.context);

  @override
  List<Object> get props => [type, context];
}
