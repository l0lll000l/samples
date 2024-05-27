import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<increment>((event, emit) {
      return emit(state.copyWith(count: state.count + 1));
    });
    on<decrement>((event, emit) {
      return emit(state.copyWith(count: state.count - 1));
    });
  }
}
