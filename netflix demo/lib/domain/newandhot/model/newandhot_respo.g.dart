// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newandhot_respo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewandhotResp _$NewandhotRespFromJson(Map<String, dynamic> json) =>
    NewandhotResp(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => NewandHotData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NewandhotRespToJson(NewandhotResp instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

NewandHotData _$NewandHotDataFromJson(Map<String, dynamic> json) =>
    NewandHotData(
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num?)?.toInt(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      originalTitle1: json['original_name'] as String?,
    );

Map<String, dynamic> _$NewandHotDataToJson(NewandHotData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'original_name': instance.originalTitle1,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };
