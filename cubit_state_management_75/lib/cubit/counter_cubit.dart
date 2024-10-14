import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterInitial());

  void increment(int value) {
    if (state is CounterCubitStateFilled) {
      final currentValue = (state as CounterCubitStateFilled).value;
      emit(CounterCubitStateFilled(currentValue + value));
    } else {
      emit(CounterCubitStateFilled(value));
    }
  }
}
