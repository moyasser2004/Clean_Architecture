import 'package:movie/tv/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {


  const TvDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.genreTv,
    required super.overview,
    required super.firstAirDate,
    required super.voteAverage,
    required super.name,
    required super.type
  });


  factory TvDetailsModel.fromJson(Map<String, dynamic> json) =>
      TvDetailsModel(
          backdropPath: json["backdrop_path"],
          firstAirDate: DateTime.parse(json["first_air_date"]).toString(),
          id: json["id"],
          name: json["name"],
          overview: json["overview"],
          type: json["type"],
          voteAverage: json["vote_average"]?.toDouble(),
          genreTv:List<GenreTvModel>.from(json["genres"].map((e)=>GenreTvModel.fromJson(e))),

      );

}


class GenreTvModel extends GenreTv {

  const GenreTvModel({
        required super.name,
        required super.id
  });

  factory GenreTvModel.fromJson(Map<String, dynamic> json) {
        return GenreTvModel(
              id: json["id"],
              name: json["name"],
        );

  }

}