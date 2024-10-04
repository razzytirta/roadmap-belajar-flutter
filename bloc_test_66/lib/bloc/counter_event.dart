part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class Add extends CounterEvent {
  final int amount;
  Add(this.amount);
}

class Subtract extends CounterEvent {
  final int amount;
  Subtract(this.amount);
}

class DoingNothing extends CounterEvent {}

class Initialize extends CounterEvent {} // Define an Initialize event

