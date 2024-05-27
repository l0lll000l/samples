part of 'counter_bloc.dart';

// @immutable
// sealed class CounterEvent {}

// class increment extends CounterEvent {}
// class decrement extends CounterEvent {}

@freezed
class CounterEvent with _$CounterEvent {
  const factory CounterEvent.increment() = increment;
  const factory CounterEvent.decrement() = decrement;
}
