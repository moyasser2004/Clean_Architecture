import 'package:equatable/equatable.dart';

class TvDetails extends Equatable {

  final String backdropPath;
  final int id;
  final List<GenreTv> genreTv;
  final String overview;
  final String firstAirDate;
  final double voteAverage;
  final String name;
  final String type;

  const TvDetails({
      required this.backdropPath,
      required this.id,
      required this.genreTv,
      required this.overview,
      required this.firstAirDate,
      required this.voteAverage,
      required this.name,
      required this.type});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        genreTv,
        overview,
        firstAirDate,
        voteAverage,
        name,
        type
      ];
}


class  GenreTv extends Equatable{

  final String name;
  final int id;

  const GenreTv({
    required this.name,
    required this.id
});

  @override
  List<Object?> get props => [name, id];

}