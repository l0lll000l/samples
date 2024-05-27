part of 'counter_bloc.dart';

// class CounterState {
//   final int count;
//   CounterState({required this.count});
// }

// final class InitialState extends CounterState {
//   InitialState() : super(count: 0);
// }

@freezed
class CounterState with _$CounterState {
  const factory CounterState({required int count}) = _counterstate;
  factory CounterState.initial() => const CounterState(count: 0);
}


//**************************** */

