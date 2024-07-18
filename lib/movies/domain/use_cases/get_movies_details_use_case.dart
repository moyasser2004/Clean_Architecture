import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/entities/movies_detail.dart';
import 'package:movie/movies/domain/repositories/base_repositories.dart';
import 'package:movie/shared/core/failure.dart';

class GetMoviesDetailsUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  Future<Either<Failure, MoviesDetail>> execute(int id) async {
    return await baseMoviesRepository.getDetailsMovies(id);
  }
}
