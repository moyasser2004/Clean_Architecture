import 'package:dartz/dartz.dart';
import 'package:movie/movies/data/models/movies-model.dart';
import 'package:movie/movies/data/models/movies_details_model.dart';
import 'package:movie/movies/data/models/movies_recommendation_model.dart';
import 'package:movie/movies/domain/repositories/base_repositories.dart';
import 'package:movie/shared/core/network/server_exception.dart';

import '../../../shared/core/failure.dart';
import '../data_sources/movies_remoted_data_sources.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemotedDataSource baseMoviesRemotedDataSource;

  MoviesRepository(this.baseMoviesRemotedDataSource);

  @override
  Future<Either<Failure, List<MoviesModel>>>
      getNowPlayingMovies() async {
    try {
      final result =
          await baseMoviesRemotedDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>>
      getPopularMovies() async {
    try {
      final result =
          await baseMoviesRemotedDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>>
      getTopRatedMovies() async {
    try {
      final result =
          await baseMoviesRemotedDataSource.getTopRateMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetailsModel>> getDetailsMovies(
      int id) async {
    try {
      final result =
          await baseMoviesRemotedDataSource.getMoviesDetails(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesRecommendationModel>>>
      getRecommendationMovies(int id) async {
    try {
      final result = await baseMoviesRemotedDataSource
          .getMoviesRecommendation(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }
}
