import 'package:json_annotation/json_annotation.dart';
part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel {
  @JsonKey(name: "adult", defaultValue: true)
  bool adult;

  @JsonKey(name: "backdrop_path", defaultValue: "")
  String backdropPath;

  @JsonKey(name: "genre_ids", defaultValue: [])
  List<int> genreIds;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "title", defaultValue: "")
  String title;

  @JsonKey(name: "original_language", defaultValue: "")
  String originalLanguage;

  @JsonKey(name: "original_title", defaultValue: "")
  String originalTitle;

  @JsonKey(name: "overview", defaultValue: "")
  String overview;

  @JsonKey(name: "popularity", defaultValue: 0)
  double popularity;

  @JsonKey(name: "poster_path", defaultValue: "")
  String posterPath;

  @JsonKey(name: "video", defaultValue: false)
  bool video;

  @JsonKey(name: "vote_average", defaultValue: 0)
  double voteAverage;

  @JsonKey(name: "vote_count", defaultValue: 0)
  int voteCount;

  MoviesModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}
