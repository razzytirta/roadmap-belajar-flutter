import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_testing_77/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter Cubit Test", () {
    blocTest<CounterCubit, int>(
      "Initial Test",
      build: () => CounterCubit(),
      expect: () => [],
    );
    blocTest(
      "Increment test for the first time",
      build: () => CounterCubit(),
      act: (CounterCubit cubit) => cubit.increment(0),
      expect: () => [0],
    );
    blocTest(
      "Increment test",
      build: () => CounterCubit(),
      act: (CounterCubit cubit) {
        cubit.increment(0);
        cubit.increment(2);
      },
      expect: () => [0, 2],
    );
    blocTest(
      "Doing Nothing test",
      build: () => CounterCubit(),
      act: (CounterCubit cubit) {
        cubit.increment(0);
        cubit.increment(2);
        cubit.increment(0);
        cubit.increment(3);
      },
      expect: () => [0, 2, 5],
    );
  });
}
