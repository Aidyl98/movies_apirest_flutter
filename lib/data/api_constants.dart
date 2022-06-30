class ApiConstants {
  static const _baseUrl = "https://api.themoviedb.org/3";

  static const _apiKey = "45bf6592c14a965b33549f4cc7e6c664";

  static String buildBillBoardEndpoint(int page) =>
      "$_baseUrl/trending/movie/week?api_key=$_apiKey&page=$page";

  static String buildPopularityEndpoint(int page) =>
      "$_baseUrl/discover/movie?api_key=$_apiKey&sort_by=popularity.asc&include_video=false&page=$page";

  static String buildBoysPopularityEndpoint(int page) =>
      "$_baseUrl/discover/movie?api_key=$_apiKey&sort_by=popularity.asc&include_adult=false&with_genres=28&page=$page";

  static String buildSearchEndPoint(int page, String movieSearch) =>
      "$_baseUrl/search/movie?api_key=$_apiKey&query=$movieSearch&page=$page";

  static const imageEndPoint =
      "https://image.tmdb.org/t/p/w185_and_h278_bestv2";
}
