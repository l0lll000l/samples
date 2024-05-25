import 'package:freezed_annotation/freezed_annotation.dart';
part 'trending.freezed.dart';
part 'trending.g.dart';

@freezed
class Trending with _$Trending {
  const factory Trending({
    @JsonKey(name: 'poster_path') required String? posterPath,
  }) = _Trending;

  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);
}
