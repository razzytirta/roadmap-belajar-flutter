part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterBlocState extends CounterState {
  final int value;

  CounterBlocState(this.value);
}
