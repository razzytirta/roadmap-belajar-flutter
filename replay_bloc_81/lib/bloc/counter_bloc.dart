import 'package:meta/meta.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends ReplayBloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (state is CounterInitial) {
        emit(InitializedCounter(0));
      } else {
        final currentState = state as InitializedCounter;
        emit(InitializedCounter(currentState.number + 1));
      }
    });
  }
}
