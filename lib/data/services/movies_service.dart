abstract class MoviesService {
  Future getBillBoardMovies(int page);

  Future getPopularMovies(int page);

  Future getChildMovies(int page);

  Future searchMovies(int page, String movieSearch);
}
