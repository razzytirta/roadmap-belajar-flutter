part of 'counter_bloc.dart';

@immutable
sealed class CounterBlocState {}

final class CounterInitial extends CounterBlocState {}

class InitializedCounter extends CounterBlocState {
  final int number;
  InitializedCounter(this.number);
}
