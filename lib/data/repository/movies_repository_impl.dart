import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movies_apirest_flutter/data/model/movies_model.dart';
import 'package:movies_apirest_flutter/data/repository/movies_repository.dart';
import 'package:movies_apirest_flutter/data/services/movies_service.dart';

class MoviesRepositoryImplementation extends MoviesRepository {
  /// The service from an api that provides the info.
  MoviesService service = Get.find<MoviesService>();

  @override
  Future<List<MoviesModel>> getBillBoardMovies(int page) async {
    try {
      List<Map<String, dynamic>> allEntities = [];

      // Get object info and pagination.
      var response = await service.getBillBoardMovies(page);

      allEntities
          .addAll(List<Map<String, dynamic>>.from(response.data["results"]));

      return List<MoviesModel>.from(
          allEntities.map((x) => MoviesModel.fromJson(x)));
    } on DioError catch (exc) {
      if (exc.response != null) {
        if (exc.response!.statusCode == 404) {
          throw Exception("You have reached the end of the movies list.");
        } else {
          throw Exception(exc.response!.statusCode.toString() +
              ": " +
              exc.response!.statusMessage.toString());
        }
      } else {
        throw Exception("Couldn't fetch the movies. Is the device online?");
      }
    }
  }
}
