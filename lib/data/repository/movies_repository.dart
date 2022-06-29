import 'package:movies_apirest_flutter/data/model/billboard_model.dart';

abstract class MoviesRepository {
  Future<List<BillBoardModel>> getBillBoardMovies(int page);
}
