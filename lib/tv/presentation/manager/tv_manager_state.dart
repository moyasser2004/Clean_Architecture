import 'package:equatable/equatable.dart';
import 'package:movie/shared/core/enum.dart';

import '../../domain/entities/tv.dart';

class TvManagerState extends Equatable {

  final List<Tv> getNowPlayingTv;
  final String getNowPlayingMessage;
  final RequestStates getNowPlayingState;

  final List<Tv> getPopularTv;
  final String getPopularMessage;
  final RequestStates getPopularState;

  final List<Tv> getTopRatedTv;
  final String getTopRatedMessage;
  final RequestStates getTopRatedState;

  const TvManagerState({
    this.getNowPlayingTv = const [],
    this.getNowPlayingMessage = "",
    this.getNowPlayingState = RequestStates.loading,
    this.getPopularTv = const [],
    this.getPopularMessage = "",
    this.getPopularState = RequestStates.loading,
    this.getTopRatedTv = const [],
    this.getTopRatedMessage = "",
    this.getTopRatedState = RequestStates.loading,
  });

  TvManagerState copyWith({
    List<Tv>? getNowPlayingTv,
    String? getNowPlayingMessage,
    RequestStates? getNowPlayingState,
    List<Tv>? getPopularTv,
    String? getPopularMessage,
    RequestStates? getPopularState,
    List<Tv>? getTopRatedTv,
    String? getTopRatedMessage,
    RequestStates? getTopRatedState,
  }) {
    return TvManagerState(
      getNowPlayingTv: getNowPlayingTv ?? this.getNowPlayingTv,
      getNowPlayingMessage: getNowPlayingMessage ?? this.getNowPlayingMessage,
      getNowPlayingState: getNowPlayingState ?? this.getNowPlayingState,
      getPopularTv: getPopularTv ?? this.getPopularTv,
      getPopularMessage: getPopularMessage ?? this.getPopularMessage,
      getPopularState: getPopularState ?? this.getPopularState,
      getTopRatedTv: getTopRatedTv ?? this.getTopRatedTv,
      getTopRatedMessage: getTopRatedMessage ?? this.getTopRatedMessage,
      getTopRatedState: getTopRatedState ?? this.getTopRatedState,
    );
  }

  @override
  List<Object?> get props => [
        getNowPlayingTv,
        getNowPlayingMessage,
        getNowPlayingState,
        getPopularTv,
        getPopularMessage,
        getPopularState,
        getTopRatedTv,
        getTopRatedMessage,
        getTopRatedState
      ];
}
