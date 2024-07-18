import 'package:movie/tv/domain/entities/tv_recommendation.dart';


class TvRecommendationModel extends TvRecommendation{

  const TvRecommendationModel({
    required super.id,
    required super.backdropPath
  });

  factory TvRecommendationModel.fromJson(Map<String, dynamic> json) {
    return TvRecommendationModel(
      id: json["id"],
      backdropPath: json["backdrop_path"],
    );
  }

}