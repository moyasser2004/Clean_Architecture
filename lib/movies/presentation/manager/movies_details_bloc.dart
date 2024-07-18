import 'package:bloc/bloc.dart';
import 'package:movie/shared/core/enum.dart';
import '../../domain/use_cases/get_movies_details_use_case.dart';
import '../../domain/use_cases/get_movies_recommendation_use_case.dart';
import 'movies_details_event.dart';
import 'movies_details_state.dart';

class MoviesDetailsBloc
    extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetMoviesRecommendationsUseCase
      getMoviesRecommendationsUseCase;

  MoviesDetailsBloc(this.getMoviesDetailsUseCase,
      this.getMoviesRecommendationsUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>((event, emit) async {
      final result = await getMoviesDetailsUseCase.execute(event.id);

      result.fold((l) {
        emit(state.copyWith(
          getMoviesDetailMessage: l.message,
          getRequestStates: RequestStates.error,
        ));
      }, (r) {
        emit(state.copyWith(
            getMoviesDetail: r,
            getRequestStates: RequestStates.loaded));
      });
    });

    on<GetMoviesRecommendationEvent>((event, emit) async {
      final result =
          await getMoviesRecommendationsUseCase.execute(event.id);

      result.fold((l) {
        emit(state.copyWith(
          getMoviesRecommendationMessage: l.message,
          getRecommendationRequestStates: RequestStates.error,
        ));
      }, (r) {
        emit(state.copyWith(
            getMoviesRecommendation: r,
            getRecommendationRequestStates: RequestStates.loaded));
      });
    });
  }
}
