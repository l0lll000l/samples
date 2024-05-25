import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/newandhot/model/newandhot_respo.dart';
import 'package:netflix/domain/newandhot/new_and_hot_service.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _HotAndNewService;
  HotAndNewBloc(this._HotAndNewService) : super(HotAndNewState.initial()) {
    //------------------------get hot and new movie data
    on<LoadDataComingSoon>((event, emit) async {
      //----------------------send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          isLoading: true,
          isError: false,
          everyoneIsWatchingList: []));
      //-------------------------get data from remote
      final _result = await _HotAndNewService.getHotandNewMovieData();
      //--------------------------------data to state
      final newState = _result.fold(
        (Mainfailure failure) {
          return const HotAndNewState(
            comingSoonList: [],
            isLoading: false,
            isError: true,
            everyoneIsWatchingList: [],
          );
        },
        (NewandhotResp resp) {
          return HotAndNewState(
            comingSoonList: resp.results,
            isLoading: false,
            isError: false,
            everyoneIsWatchingList: state.everyoneIsWatchingList,
          );
        },
      );
      emit(newState);
    });
    //***************************EveryOneIsWatching***************************************** */
    on<EveryOneIsWatching>((event, emit) async {
      //-------------------------get hot and new tv data
      emit(const HotAndNewState(
          comingSoonList: [],
          isLoading: true,
          isError: false,
          everyoneIsWatchingList: []));
      //-------------------------get data from remote
      final _result = await _HotAndNewService.getHotandNewtvData();
      //--------------------------------data to state
      final newState = _result.fold(
        (Mainfailure failure) {
          return const HotAndNewState(
            comingSoonList: [],
            isLoading: false,
            isError: true,
            everyoneIsWatchingList: [],
          );
        },
        (NewandhotResp resp) {
          return HotAndNewState(
            comingSoonList: state.comingSoonList,
            isLoading: false,
            isError: false,
            everyoneIsWatchingList: resp.results,
          );
        },
      );
      emit(newState);
    });
  }
}
