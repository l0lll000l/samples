// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'counter_event.dart';
// part 'counter_state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(InitialState()) {
//     on<increment>((event, emit) {
//       final a = state.count;
//       final b = a + 1;
//       return emit(CounterState(count: b));
//     });
//     on<decrement>((event, emit) {
//       final a = state.count;
//       final b = a - 1;
//       return emit(CounterState(count: b));
//     });
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<increment>((event, emit) {
      final currentStateValue = state.count;
      final incrementedValue = currentStateValue + 1;
      return emit(CounterState(count: incrementedValue));
    });
    on<decrement>((event, emit) {
      final currentStateValue = state.count;
      final decrementedValue = currentStateValue - 1;
      return emit(CounterState(count: decrementedValue));
    });
  }
}
