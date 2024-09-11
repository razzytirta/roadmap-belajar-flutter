import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.amber) {
    on<ColorEvent>(
      (event, emit) {
        if (event == ColorEvent.toAmber) {
          emit(Colors.amber);
        } else if (event == ColorEvent.toLightBlue) {
          emit(Colors.lightBlue);
        }
      },
    );
  }
}
