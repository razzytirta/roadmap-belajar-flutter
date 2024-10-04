import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Initialize>((event, emit) {
      emit(0); // Emit initial state of 0
    });

    on<Add>((event, emit) {
      emit(state + event.amount); // Emit the new state
    });
    on<Subtract>((event, emit) {
      emit(state - event.amount);
    });
    on<DoingNothing>((event, emit) {
      emit(state); // Emit the current state
    });
  }
}
