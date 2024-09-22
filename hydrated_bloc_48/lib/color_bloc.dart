import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
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

  @override
  Color? fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (_) {
      return null;
    }
  }
}
