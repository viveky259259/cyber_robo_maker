import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:retro_saving_world/bloc/overlays/event.dart';
import 'package:retro_saving_world/bloc/overlays/state.dart';

class OverLayBloc extends Bloc<OverlayEvent, OverLayState> {
  Map<String, List<OverlayEntry>> overlays;

  @override
  OverLayState get initialState {
    overlays = <String, List<OverlayEntry>>{};
    return UnInitialized();
  }

  @override
  Stream<OverLayState> mapEventToState(OverlayEvent event) async* {
    if (event is AddOverLay) {
      if (overlays.containsKey(event.type)) {
        overlays[event.type].add(event.overlayEntry);
      } else {
        if (overlays[event.type] == null) overlays[event.type] = [];
        overlays[event.type].add(event.overlayEntry);
      }
      yield OverlayAdded();
    } else if (event is RemoveOverLays) {
      if (overlays.containsKey(event.type)) {
        for (var value in overlays[event.type]) {
          value.remove();
        }
        overlays[event.type].clear();
      }
      yield OverlayRemoved(event.type);
    }
  }
}
