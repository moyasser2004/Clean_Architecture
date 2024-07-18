import 'package:dartz/dartz.dart';
import 'package:movie/movies/data/models/movies_details_model.dart';
import '../../../shared/core/failure.dart';
import '../../data/models/movies-model.dart';
import '../../data/models/movies_recommendation_model.dart';



abstract class BaseMoviesRepository{

  Future<Either<Failure,List<MoviesModel>>> getNowPlayingMovies();
  Future<Either<Failure,List<MoviesModel>>>  getPopularMovies();
  Future<Either<Failure,List<MoviesModel>>>  getTopRatedMovies();

  Future<Either<Failure,MoviesDetailsModel>>  getDetailsMovies(int id);
  Future<Either<Failure,List<MoviesRecommendationModel>>>  getRecommendationMovies(int id);

}