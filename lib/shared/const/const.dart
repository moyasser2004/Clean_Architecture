//https://api.themoviedb.org/3/
// movie/now_playing
// ?api_key=c4b76d5deff8af9434b07dde68c7c158

//https://api.themoviedb.org/3/
// tv/popular?api_key=c4b76d5deff8af9434b07dde68c7c158

class AppLinks {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "c4b76d5deff8af9434b07dde68c7c158";

  static const String playNowMovies =
      "${baseUrl}movie/now_playing?api_key=$apiKey";
  static const String popularMovies =
      "${baseUrl}movie/popular?api_key=$apiKey";
  static const String topRatedMovies =
      "${baseUrl}movie/top_rated?api_key=$apiKey";

  static const String nowPlayingTv =
      "${baseUrl}tv/on_the_air?api_key=$apiKey";
  static const String popularTv =
      "${baseUrl}tv/popular?api_key=$apiKey";
  static const String topRatedTv =
      "${baseUrl}tv/top_rated?api_key=$apiKey";

//https://api.themoviedb.org/3/tv/{series_id}
  //https://api.themoviedb.org/3/tv/{series_id}/recommendations

  static const String baseImageUrl =
      "https://image.tmdb.org/t/p/w500/";

  static String imageUrl(String path) => "$baseImageUrl$path";

  static String moviesDetails(int path) =>
      "${baseUrl}movie/$path?api_key=$apiKey";
  static String moviesRecommendation(int path) =>
      "${baseUrl}movie/$path/recommendations?api_key=$apiKey";

  static String tvDetails(int path) =>
      "${baseUrl}tv/$path?api_key=$apiKey";
  static String tvRecommendation(int path) =>
      "${baseUrl}tv/$path/recommendations?api_key=$apiKey";
}
