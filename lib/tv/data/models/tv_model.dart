import '../../domain/entities/tv.dart';

class TvModel extends Tv {

  const TvModel({
      required super.backdropPath,
      required super.dateTime,
      required super.genresIds,
      required super.id,
      required super.overview,
      required super.voteAverage,
      required super.name
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
    backdropPath: json["backdrop_path"]??="https://www.google.com/imgres?imgurl=https%3A%2F%2Ffunylife.in%2Fwp-content%2Fuploads%2F2023%2F01%2F14_Good-night-images-www.funylife.in_-1024x1024.jpg&tbnid=R2_zXsBfRX0wEM&vet=10CAUQMyhqahcKEwiIpoeVjIKBAxUAAAAAHQAAAAAQAw..i&imgrefurl=https%3A%2F%2Ffunylife.in%2Fgood-night-images%2F&docid=QZlV-27tkCfrqM&w=1024&h=1024&q=images&ved=0CAUQMyhqahcKEwiIpoeVjIKBAxUAAAAAHQAAAAAQAw",
    genresIds: List<int>.from(json["genre_ids"].map((e) => e)),
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    voteAverage: json["vote_average"]?.toDouble(),
    dateTime: DateTime.parse(json["first_air_date"]),
  );

}
