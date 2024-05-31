import 'dart:developer';

import 'package:apidemo/domain/failure/Main_failure.dart';
import 'package:apidemo/domain/i_trending_repo.dart';
import 'package:apidemo/domain/trending/trending.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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
          isLoading: true, trendingFaillureorSuccessOption: none()));
      final Either<MainFailure, List<Trending>> trendingOption =
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
              trendingFaillureorSuccessOption: some(right(success)))));
    });
    //------------------------------------------------------------------------------
    on<GetPopularImage>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, trendingFaillureorSuccessOption: none()));
      final Either<MainFailure, List<Trending>> trendingOption =
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
              trendingFaillureorSuccessOption: some(right(success)))));
    });
  }
}
