import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends ReplayCubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    if (state is InitializedCounterCubit) {
      final currentState = state as InitializedCounterCubit;
      emit(InitializedCounterCubit(currentState.number + 1));
    } else {
      emit(InitializedCounterCubit(0));
    }
  }
}
