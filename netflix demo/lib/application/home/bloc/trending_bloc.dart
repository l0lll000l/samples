import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/home/i_trending_repo.dart';
import 'package:netflix/domain/home/trending.dart';

part 'trending_event.dart';
part 'trending_state.dart';
part 'trending_bloc.freezed.dart';

@injectable
class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final ITrendingRepo _trendingRepo;
  TrendingBloc(this._trendingRepo) : super(TrendingState.initial()) {
    //
    on<GetTrendingImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        trendingFaillureorSuccessOption: none(),
      ));
      final Either<Mainfailure, List<Trending>> trendingOption =
          await _trendingRepo.getTrendingImages();
      //
      // log(trendingOption.toString());
      emit(trendingOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              trendingFaillureorSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              trending: success,
              tvshows: state.tvshows,
              popular: state.popular,
              upcoming: state.trending,
              trendingFaillureorSuccessOption: some(right(success)))));
    });
    //----------------------------------------------------------------------------------
    on<GetPopularImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        trendingFaillureorSuccessOption: none(),
      ));
      final Either<Mainfailure, List<Trending>> trendingOption =
          await _trendingRepo.getPopularImages();
      //
      // log(trendingOption.toString());
      emit(trendingOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              trendingFaillureorSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              popular: success,
              trending: state.trending,
              tvshows: state.tvshows,
              upcoming: state.trending,
              trendingFaillureorSuccessOption: some(right(success)))));
    });
    //-----------------------------------------------------------------------------------
    on<GetUpComingImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        trendingFaillureorSuccessOption: none(),
      ));
      final Either<Mainfailure, List<Trending>> trendingOption =
          await _trendingRepo.getUpComingImages();
      //
      // log(trendingOption.toString());
      emit(trendingOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              trendingFaillureorSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              upcoming: success,
              trending: state.trending,
              popular: state.popular,
              tvshows: state.tvshows,
              trendingFaillureorSuccessOption: some(right(success)))));
    });
    //---------------------------------------------------------------------------------
    on<GetTvShowsImage>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        trendingFaillureorSuccessOption: none(),
      ));
      final Either<Mainfailure, List<Trending>> trendingOption =
          await _trendingRepo.getTvShowsImages();
      //
      // log(trendingOption.toString());
      emit(trendingOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              trendingFaillureorSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              tvshows: success,
              trending: state.trending,
              popular: state.popular,
              upcoming: state.trending,
              trendingFaillureorSuccessOption: some(right(success)))));
    });
  }
}
