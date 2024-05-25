import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/constants.dart';

part 'search_respo.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'results')
  List<SearchresultData> results;

  SearchResponse({this.results = const []});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SearchresultData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterImageUrl => '$imageAppendurl$posterPath';

  SearchresultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchresultData.fromJson(Map<String, dynamic> json) {
    return _$SearchresultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchresultDataToJson(this);
}
