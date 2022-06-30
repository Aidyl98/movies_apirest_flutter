import 'package:dio/dio.dart';
import 'package:movies_apirest_flutter/data/api_constants.dart';
import 'package:movies_apirest_flutter/data/services/movies_service.dart';

class MoviesServiceImplementation extends MoviesService {
  static final Dio _dio = Dio();

  @override
  Future getBillBoardMovies(int page) async {
    // Get object info and pagination.
    return await _dio.get(
      ApiConstants.buildBillBoardEndpoint(page),
    );
  }

  @override
  Future getChildMovies(int page) async {
    // Get object info and pagination.
    return await _dio.get(
      ApiConstants.buildBoysPopularityEndpoint(page),
    );
  }

  @override
  Future getPopularMovies(int page) async {
    // Get object info and pagination.
    return await _dio.get(
      ApiConstants.buildPopularityEndpoint(page),
    );
  }

  @override
  Future searchMovies(int page, String movieSearch) async {
    // Get object info and pagination.
    return await _dio.get(
      ApiConstants.buildSearchEndPoint(page, movieSearch),
    );
  }
}
