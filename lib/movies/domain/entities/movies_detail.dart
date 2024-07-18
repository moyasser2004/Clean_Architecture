import 'package:equatable/equatable.dart';

class MoviesDetail extends Equatable {
  final String backdropPath;
  final int id;
  final List<Genre> genres;
  final String overview;
  final String releaseDate;
  final int runtTime;
  final String title;
  final double voteAverage;

  const MoviesDetail(
      {required this.backdropPath,
      required this.id,
      required this.genres,
      required this.overview,
      required this.releaseDate,
      required this.runtTime,
      required this.title,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        runtTime,
        title,
        voteAverage,
        genres
      ];
}

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
