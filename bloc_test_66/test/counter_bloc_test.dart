import 'package:bloc_test_66/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Testing Counter Bloc', () {
    blocTest<CounterBloc, int>(
      'Inisialisasi Counter Bloc',
      build: () => CounterBloc()..add(Initialize()),
      expect: () => [0],
    );
    blocTest<CounterBloc, int>(
      'Add Event',
      build: () => CounterBloc()..add(Initialize()),
      act: (bloc) async {
        bloc.add(Add(2));
      },
      expect: () => [0, 2],
    );
    blocTest<CounterBloc, int>(
      'Subtract Event',
      build: () => CounterBloc()..add(Initialize()),
      act: (bloc) async {
        bloc.add(Subtract(2));
      },
      expect: () => [0, -2],
    );
    blocTest<CounterBloc, int>(
      'Add & Subtract Event',
      build: () => CounterBloc()..add(Initialize()),
      act: (bloc) async {
        bloc.add(Add(2));
        bloc.add(Subtract(5));
        bloc.add(DoingNothing());
        bloc.add(Add(10));
      },
      expect: () => [0, 2, -3, 7],
    );
  });
}
