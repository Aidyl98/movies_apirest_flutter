import 'package:movies_apirest_flutter/data/model/movies_model.dart';

abstract class MoviesRepository {
  Future<List<MoviesModel>> getBillBoardMovies(int page);

  Future<List<MoviesModel>> getPopularMovies(int page);

  Future<List<MoviesModel>> getChildMovies(int page);

  Future<List<MoviesModel>> searchMovies(int page, String movieSearch);
}
