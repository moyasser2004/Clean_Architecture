import 'package:dartz/dartz.dart';
import 'package:movie/shared/core/failure.dart';
import 'package:movie/shared/core/network/server_exception.dart';
import 'package:movie/tv/data/data_sources/tv_remoted_data_sources.dart';
import 'package:movie/tv/data/models/Tv_details_model.dart';
import 'package:movie/tv/data/models/Tv_recommendation_model.dart';
import 'package:movie/tv/data/models/tv_model.dart';
import 'package:movie/tv/domain/repositories/base_repositories.dart';


class TvRepository extends BaseTvRepository {

  final BaseTvRemotedDataSources baseRemotedDataSourcesTv;
  TvRepository(this.baseRemotedDataSourcesTv);

  @override
  Future<Either<Failure,List<TvModel>>> getNowPlayingTv() async{
    final result =await baseRemotedDataSourcesTv.getNowPlayingTv();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left( ServerFailure(failure.errorServerModel.statusMessage) );
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getPopularTv() async{
    final result =await baseRemotedDataSourcesTv.getPopularTv();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorServerModel.statusMessage) );
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTopRatedTv() async{
    final result =await baseRemotedDataSourcesTv.getTopRatedTv();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left( ServerFailure(failure.errorServerModel.statusMessage) );
    }
  }

  @override
  Future<Either<Failure, TvDetailsModel>> getDetailsTv(int id) async{
    final result =await baseRemotedDataSourcesTv.getDetailsTv(id);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left( ServerFailure(failure.errorServerModel.statusMessage) );
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendationModel>>> getRecommendationTv(int id)async {
    final result =await baseRemotedDataSourcesTv.getRecommendationTv(id);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left( ServerFailure(failure.errorServerModel.statusMessage) );
    }
  }


}