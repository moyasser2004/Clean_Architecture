import 'package:equatable/equatable.dart';
import 'package:movie/movies/domain/entities/movies_recommendation.dart';
import 'package:movie/shared/core/enum.dart';

import '../../domain/entities/movies_detail.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetail getMoviesDetail;
  final String getMoviesDetailMessage;
  final RequestStates getRequestStates;

  final List<MoviesRecommendation> getMoviesRecommendation;
  final String getMoviesRecommendationMessage;
  final RequestStates getRecommendationRequestStates;

  const MoviesDetailsState({
    this.getMoviesDetail = const MoviesDetail(
      id: 0,
      releaseDate: "",
      voteAverage: 0.0,
      overview: "",
      backdropPath:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjuDMpR_FMxIBANxGWnFVsnheoZv40IKjAvQ&usqp=CAU",
      title: "",
      genres: [],
      runtTime: 0,
    ),
    this.getMoviesDetailMessage = "",
    this.getRequestStates = RequestStates.loading,
    this.getMoviesRecommendation = const [],
    this.getMoviesRecommendationMessage = "",
    this.getRecommendationRequestStates = RequestStates.loading,
  });

  MoviesDetailsState copyWith({
    MoviesDetail? getMoviesDetail,
    String? getMoviesDetailMessage,
    RequestStates? getRequestStates,
    List<MoviesRecommendation>? getMoviesRecommendation,
    String? getMoviesRecommendationMessage,
    RequestStates? getRecommendationRequestStates,
  }) {
    return MoviesDetailsState(
      getMoviesDetail: getMoviesDetail ?? this.getMoviesDetail,
      getMoviesDetailMessage:
          getMoviesDetailMessage ?? this.getMoviesDetailMessage,
      getRequestStates: getRequestStates ?? this.getRequestStates,
      getMoviesRecommendation:
          getMoviesRecommendation ?? this.getMoviesRecommendation,
      getMoviesRecommendationMessage:
          getMoviesRecommendationMessage ??
              this.getMoviesRecommendationMessage,
      getRecommendationRequestStates:
          getRecommendationRequestStates ??
              this.getRecommendationRequestStates,
    );
  }

  @override
  List<Object?> get props => [
        getMoviesDetail,
        getMoviesDetailMessage,
        getRequestStates,
        getMoviesRecommendation,
        getMoviesRecommendationMessage,
        getRecommendationRequestStates
      ];
}
