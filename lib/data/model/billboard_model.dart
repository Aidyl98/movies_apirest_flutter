import 'package:json_annotation/json_annotation.dart';
part 'billboard_model.g.dart';

@JsonSerializable()
class BillBoardModel {
  @JsonKey(name: "adult")
  bool adult;

  @JsonKey(name: "backdrop_path")
  String backdropPath;

  @JsonKey(name: "genre_ids")
  List<int> genreIds;

  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "media_type")
  String mediaType;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "original_language")
  String originalLanguage;

  @JsonKey(name: "original_title")
  String originalTitle;

  @JsonKey(name: "overview")
  String overview;

  @JsonKey(name: "popularity")
  double popularity;

  @JsonKey(name: "poster_path")
  String posterPath;

  @JsonKey(name: "release_date")
  DateTime releaseDate;

  @JsonKey(name: "video")
  bool video;

  @JsonKey(name: "vote_average")
  double voteAverage;

  @JsonKey(name: "vote_count")
  int voteCount;

  BillBoardModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory BillBoardModel.fromJson(Map<String, dynamic> json) =>
      _$BillBoardModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$BillBoardModelToJson(this);
}
