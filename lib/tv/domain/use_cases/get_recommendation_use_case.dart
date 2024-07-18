import 'package:dartz/dartz.dart';

import '../../../shared/core/failure.dart';
import '../../data/models/Tv_recommendation_model.dart';
import '../repositories/base_repositories.dart';

class GetTvRecommendationUseCase {

  final BaseTvRepository baseTvRepository;

  GetTvRecommendationUseCase(this.baseTvRepository);

  Future<Either<Failure, List<TvRecommendationModel>>> execute(int id) async {
    return await baseTvRepository.getRecommendationTv(id);
  }
}
