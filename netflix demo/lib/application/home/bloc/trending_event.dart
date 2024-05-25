part of 'trending_bloc.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  const factory TrendingEvent.getTrendingImage() = GetTrendingImage;
  const factory TrendingEvent.getPopularImage() = GetPopularImage;
  const factory TrendingEvent.getUpComingImage() = GetUpComingImage;
  const factory TrendingEvent.getTvShowsImage() = GetTvShowsImage;
}
