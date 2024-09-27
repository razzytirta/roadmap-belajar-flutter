part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int value;

  const CounterState(this.value);
}

final class CounterInitial extends CounterState {
  const CounterInitial(super.value);
}

class CounterValueChanged extends CounterState {
  const CounterValueChanged(super.value);
}
