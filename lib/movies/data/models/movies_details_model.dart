import 'package:movie/movies/domain/entities/movies_detail.dart';

class MoviesDetailsModel extends MoviesDetail {
  const MoviesDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.runtTime,
      required super.title,
      required super.voteAverage});

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
        overview: json["overview"],
        releaseDate: json["release_date"],
        runtTime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
      );
}

class GenresModel extends Genre {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
