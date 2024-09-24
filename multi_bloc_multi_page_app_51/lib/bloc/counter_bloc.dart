import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<int, int> {
  CounterBloc() : super(0) {
    on<int>((event, emit) {
      emit(state + 1);
    });
  }
}
