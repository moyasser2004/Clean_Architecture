import 'package:equatable/equatable.dart';

import '../../../shared/core/enum.dart';
import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movies> getNowPlayingMovies;
  final String getNowPlayingMessage;
  final RequestStates getNowPlayingState;

  final List<Movies> getPopularMovies;
  final String getPopularMessage;
  final RequestStates getPopularState;

  final List<Movies> getTopRatedMovies;
  final String getTopRatedMessage;
  final RequestStates getTopRatedState;

  const MovieState({
    this.getNowPlayingMovies = const [],
    this.getNowPlayingMessage = "",
    this.getNowPlayingState = RequestStates.loading,
    this.getPopularMovies = const [],
    this.getPopularMessage = "",
    this.getPopularState = RequestStates.loading,
    this.getTopRatedMovies = const [],
    this.getTopRatedMessage = "",
    this.getTopRatedState = RequestStates.loading,
  });

  MovieState copyWith({
    List<Movies>? getNowPlayingMovies,
    String? getNowPlayingMessage,
    RequestStates? getNowPlayingState,
    List<Movies>? getPopularMovies,
    String? getPopularMessage,
    RequestStates? getPopularState,
    List<Movies>? getTopRatedMovies,
    String? getTopRatedMessage,
    RequestStates? getTopRatedState,
  }) {
    return MovieState(
      getNowPlayingMessage:
          getNowPlayingMessage ?? this.getNowPlayingMessage,
      getNowPlayingState:
          getNowPlayingState ?? this.getNowPlayingState,
      getNowPlayingMovies:
          getNowPlayingMovies ?? this.getNowPlayingMovies,
      getPopularMessage: getPopularMessage ?? this.getPopularMessage,
      getPopularMovies: getPopularMovies ?? this.getPopularMovies,
      getPopularState: getPopularState ?? this.getPopularState,
      getTopRatedMessage:
          getTopRatedMessage ?? this.getTopRatedMessage,
      getTopRatedMovies: getTopRatedMovies ?? this.getTopRatedMovies,
      getTopRatedState: getTopRatedState ?? this.getTopRatedState,
    );
  }

  @override
  List<Object?> get props => [
        getNowPlayingMovies,
        getNowPlayingMessage,
        getNowPlayingState,
        getPopularMovies,
        getPopularMessage,
        getPopularState,
        getTopRatedMovies,
        getTopRatedMessage,
        getTopRatedState
      ];
}
