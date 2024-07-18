import 'package:equatable/equatable.dart';

class Tv extends Equatable {

  final String? backdropPath;
  final DateTime dateTime;
  final List<int> genresIds;
  final int id;
  final String overview;
  final double voteAverage;
  final String name;

  const Tv({
      required this.backdropPath,
      required this.dateTime,
      required this.genresIds,
      required this.id,
      required this.overview,
      required this.voteAverage,
      required this.name});

  @override
  List<Object?> get props =>
      [backdropPath, dateTime, genresIds, id, overview, voteAverage, name];
}
