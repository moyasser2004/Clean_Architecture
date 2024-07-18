import 'package:movie/movies/domain/entities/movie.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.overview,
      required super.voteAverage,
      required super.genreIds,
      required super.releaseDate});

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      MoviesModel(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        id: json["id"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
      );
}
