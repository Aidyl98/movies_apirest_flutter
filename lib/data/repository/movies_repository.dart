import 'package:movies_apirest_flutter/data/model/movies_model.dart';

abstract class MoviesRepository {
  Future<List<MoviesModel>> getBillBoardMovies(int page);
}
