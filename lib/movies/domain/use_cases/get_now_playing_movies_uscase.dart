import 'package:dartz/dartz.dart';
import '../../../shared/core/failure.dart';
import '../../data/models/movies-model.dart';
import '../repositories/base_repositories.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<MoviesModel>>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
