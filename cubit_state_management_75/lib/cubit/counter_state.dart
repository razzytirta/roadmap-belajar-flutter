part of 'counter_cubit.dart';

@immutable
sealed class CounterCubitState {}

final class CounterInitial extends CounterCubitState {}

class CounterCubitStateFilled extends CounterCubitState {
  final int value;

  CounterCubitStateFilled(this.value);
}
