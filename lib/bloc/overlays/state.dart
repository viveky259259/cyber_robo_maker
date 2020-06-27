import 'package:equatable/equatable.dart';

abstract class OverLayState extends Equatable {}

class UnInitialized extends OverLayState {
  @override
  List<Object> get props => [];
}

class OverlayAdded extends OverLayState {
  @override
  List<Object> get props => [];
}

class OverlayRemoved extends OverLayState {
  final String type;

  OverlayRemoved(this.type);

  @override
  List<Object> get props => [type];
}
