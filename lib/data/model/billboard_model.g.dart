// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillBoardModel _$BillBoardModelFromJson(Map<String, dynamic> json) =>
    BillBoardModel(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      mediaType: json['media_type'] as String,
      title: json['title'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$BillBoardModelToJson(BillBoardModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'media_type': instance.mediaType,
      'title': instance.title,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
