import '../../domain/entities/movies_recommendation.dart';

class MoviesRecommendationModel extends MoviesRecommendation {
  const MoviesRecommendationModel(
      {required super.id, required super.backdropPath});

  factory MoviesRecommendationModel.fromJson(
      Map<String, dynamic> json) {
    return MoviesRecommendationModel(
        id: json["id"], backdropPath: json["backdrop_path"]);
  }
}
