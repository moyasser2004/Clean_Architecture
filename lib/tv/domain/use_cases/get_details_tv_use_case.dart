import 'package:dartz/dartz.dart';
import 'package:movie/tv/data/models/Tv_details_model.dart';
import 'package:movie/tv/domain/repositories/base_repositories.dart';

import '../../../shared/core/failure.dart';


class GetTvDetailsUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  Future<Either<Failure,TvDetailsModel>> execute(int id) async {
    return await baseTvRepository.getDetailsTv(id);
  }

}