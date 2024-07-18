import 'package:bloc/bloc.dart';
import 'package:movie/movies/domain/use_cases/get_popular_movies_uscase.dart';
import 'package:movie/movies/domain/use_cases/get_top_rated_movies_uscase.dart';
import 'package:movie/movies/presentation/manager/event_page.dart';
import 'package:movie/movies/presentation/manager/state_page.dart';

import '../../../shared/core/enum.dart';
import '../../domain/use_cases/get_now_playing_movies_uscase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold((l) {
        emit(state.copyWith(
            getNowPlayingMessage: l.message,
            getNowPlayingState: RequestStates.error));
      }, (r) {
        emit(state.copyWith(
            getNowPlayingMovies: r,
            getNowPlayingState: RequestStates.loaded));
      });
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      result.fold((l) {
        emit(state.copyWith(
            getPopularMessage: l.message,
            getPopularState: RequestStates.error));
      }, (r) {
        emit(state.copyWith(
            getPopularMovies: r,
            getPopularState: RequestStates.loaded));
      });
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();
      result.fold((l) {
        emit(state.copyWith(
            getTopRatedMessage: l.message,
            getTopRatedState: RequestStates.error));
      }, (r) {
        emit(state.copyWith(
            getTopRatedMovies: r,
            getTopRatedState: RequestStates.loaded));
      });
    });
  }
}
