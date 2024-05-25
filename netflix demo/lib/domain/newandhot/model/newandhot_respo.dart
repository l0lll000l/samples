import 'package:json_annotation/json_annotation.dart';

part 'newandhot_respo.g.dart';

@JsonSerializable()
class NewandhotResp {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<NewandHotData> results;

  NewandhotResp({this.page, this.results = const []});

  factory NewandhotResp.fromJson(Map<String, dynamic> json) {
    return _$NewandhotRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewandhotRespToJson(this);
}

//******************************************************************** */

@JsonSerializable()
class NewandHotData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'original_name')
  String? originalTitle1;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;

  NewandHotData(
      {this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.originalTitle1});

  factory NewandHotData.fromJson(Map<String, dynamic> json) {
    return _$NewandHotDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewandHotDataToJson(this);
}
