import 'package:dio/dio.dart';
import 'package:movie/movies/data/models/movies-model.dart';
import 'package:movie/movies/data/models/movies_recommendation_model.dart';
import 'package:movie/shared/const/const.dart';
import 'package:movie/shared/core/error_model/error_server_model.dart';
import 'package:movie/shared/core/network/server_exception.dart';
import '../models/movies_details_model.dart';

abstract class BaseMoviesRemotedDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRateMovies();

  Future<MoviesDetailsModel> getMoviesDetails(int id);
  Future<List<MoviesRecommendationModel>> getMoviesRecommendation(
      int id);
}

class MoviesRemotedDataSource extends BaseMoviesRemotedDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(AppLinks.playNowMovies);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    var response = await Dio().get(AppLinks.popularMovies);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRateMovies() async {
    var response = await Dio().get(AppLinks.topRatedMovies);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(int id) async {
    var response = await Dio().get(AppLinks.moviesDetails(id));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return MoviesDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesRecommendationModel>> getMoviesRecommendation(
      int id) async {
    var response = await Dio().get(AppLinks.moviesRecommendation(id));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<MoviesRecommendationModel>.from(
          (response.data["results"] as List)
              .map((e) => MoviesRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }
}
