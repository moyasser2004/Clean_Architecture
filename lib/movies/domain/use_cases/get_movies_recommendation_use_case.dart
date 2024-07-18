import 'package:dartz/dartz.dart';
import 'package:movie/movies/data/models/movies_recommendation_model.dart';
import 'package:movie/movies/domain/repositories/base_repositories.dart';
import 'package:movie/shared/core/failure.dart';

class GetMoviesRecommendationsUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationsUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<MoviesRecommendationModel>>> execute(
      int id) async {
    return await baseMoviesRepository.getRecommendationMovies(id);
  }
}
