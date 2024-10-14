part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterBlocIncrement extends CounterEvent {
  final int value;

  CounterBlocIncrement(this.value);
}
