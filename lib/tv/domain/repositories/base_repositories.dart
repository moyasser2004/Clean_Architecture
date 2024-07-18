import 'package:dartz/dartz.dart';
import 'package:movie/tv/data/models/Tv_details_model.dart';

import '../../../shared/core/failure.dart';
import '../../data/models/Tv_recommendation_model.dart';
import '../../data/models/tv_model.dart';


abstract class BaseTvRepository {

  Future<Either<Failure,List<TvModel>>> getNowPlayingTv();
  Future<Either<Failure,List<TvModel>>> getPopularTv();
  Future<Either<Failure,List<TvModel>>> getTopRatedTv();

  Future<Either<Failure,TvDetailsModel>> getDetailsTv(int id);
  Future<Either<Failure,List<TvRecommendationModel>>> getRecommendationTv(int id);

}