part of 'trending_bloc.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState(
      {required bool isLoading,
      required List<Trending>? trending,
      required List<Trending>? popular,
      required List<Trending>? upcoming,
      required List<Trending>? tvshows,
      required Option<Either<Mainfailure, List<Trending>>>
          trendingFaillureorSuccessOption}) = _TrendingState;
  factory TrendingState.initial() {
    return const TrendingState(
      isLoading: false,
      trendingFaillureorSuccessOption: None(),
      trending: [],
      popular: [],
      upcoming: [],
      tvshows: [],
    );
  }
}
