// part of 'counter_bloc.dart';

// @immutable
// sealed class CounterEvent {}

// class increment extends CounterEvent {}

// class decrement extends CounterEvent {}
part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class increment extends CounterEvent {}

class decrement extends CounterEvent {}
