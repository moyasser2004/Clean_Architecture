import 'package:dio/dio.dart';
import 'package:movie/shared/const/const.dart';
import 'package:movie/shared/core/error_model/error_server_model.dart';
import 'package:movie/tv/data/models/Tv_details_model.dart';
import 'package:movie/tv/data/models/Tv_recommendation_model.dart';

import '../../../shared/core/network/server_exception.dart';
import '../models/tv_model.dart';

abstract class BaseTvRemotedDataSources {
  Future<List<TvModel>> getNowPlayingTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();

  Future<TvDetailsModel> getDetailsTv(int id);
  Future<List<TvRecommendationModel>> getRecommendationTv(int id);
}

class TvRemotedDataSources extends BaseTvRemotedDataSources {
  @override
  Future<List<TvModel>> getNowPlayingTv() async {
    var response = await Dio().get(AppLinks.nowPlayingTv);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List)
          .map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    var response = await Dio().get(AppLinks.popularTv);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List)
          .map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    var response = await Dio().get(AppLinks.topRatedTv);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List)
          .map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getDetailsTv(int id) async {
    var response = await Dio().get(AppLinks.tvDetails(id));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvRecommendationModel>> getRecommendationTv(
      int id) async {
    var response = await Dio().get(AppLinks.tvRecommendation(id));
    if (response.statusCode == 200) {
      return List<TvRecommendationModel>.from(
          (response.data["results"] as List)
              .map((e) => TvRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }
}
