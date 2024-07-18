import 'package:bloc/bloc.dart';
import 'package:movie/tv/presentation/manager/tv_details_event.dart';
import 'package:movie/tv/presentation/manager/tv_details_state.dart';

import '../../../shared/core/enum.dart';
import '../../domain/use_cases/get_details_tv_use_case.dart';
import '../../domain/use_cases/get_recommendation_use_case.dart';




class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {

   final GetTvDetailsUseCase getTvDetailsUseCase;
   final GetTvRecommendationUseCase getTvRecommendationUseCase;

  TvDetailsBloc(this.getTvDetailsUseCase, this.getTvRecommendationUseCase) : super(const TvDetailsState()) {

    on<GetTvDetailsEvent>((event, emit)async {
      final result = await getTvDetailsUseCase.execute(event.id);
      result.fold(
              (l){
            emit(state.copyWith(
                getTvDetailsMessage: l.message,
                getTvDetailsState: RequestStates.error
            ));
          },
              (r){
            emit(state.copyWith(
              getTvDetails: r,
              getTvDetailsState: RequestStates.loaded,
            ));
          }
      );
    });


    on<GetTvRecommendationEvent>((event, emit)async {
      final result = await getTvRecommendationUseCase.execute(event.id);
      result.fold(
              (l){
            emit(state.copyWith(
                getTvRecommendationMessage: l.message,
                getTvRecommendationState: RequestStates.error
            ));
          },
              (r){
            emit(state.copyWith(
              getTvRecommendation: r,
              getTvRecommendationState: RequestStates.loaded,
            ));
          }
      );
    });
  }


}

