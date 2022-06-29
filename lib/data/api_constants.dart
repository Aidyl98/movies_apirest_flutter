class ApiConstants {
  static const billBoardEndPoint =
      "https://api.themoviedb.org/3/trending/movie/week?api_key=45bf6592c14a965b33549f4cc7e6c664";
  static const popularityEndpoint =
      "https://api.themoviedb.org/3/discover/movie?api_key=45bf6592c14a965b33549f4cc7e6c664&sort_by=popularity.asc&include_video=false&page=1";
  static const boysPopularityEndpoint =
      "https://api.themoviedb.org/3/discover/movie?api_key=45bf6592c14a965b33549f4cc7e6c664&sort_by=popularity.asc&include_adult=false&with_genres=28";
  static const searchEndPoint =
      "https://api.themoviedb.org/3/search/movie?api_key=45bf6592c14a965b33549f4cc7e6c664&query= ";
  static const pageEndpoint = "&page=";
}
