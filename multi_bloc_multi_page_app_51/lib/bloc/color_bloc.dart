import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { toPink, toAmber, toPurple }

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.pink) {
    on<ColorEvent>((event, emit) {
      if (event == ColorEvent.toPink) {
        emit(Colors.pink);
      } else if (event == ColorEvent.toAmber) {
        emit(Colors.amber);
      } else if (event == ColorEvent.toPurple) {
        emit(Colors.purple);
      }
    });
  }
}
