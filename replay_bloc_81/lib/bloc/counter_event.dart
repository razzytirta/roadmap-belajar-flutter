part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent extends ReplayEvent {}

class Increment extends CounterEvent {}
