part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class InitializedCounterCubit extends CounterState {
  final int number;
  InitializedCounterCubit(this.number);
}
