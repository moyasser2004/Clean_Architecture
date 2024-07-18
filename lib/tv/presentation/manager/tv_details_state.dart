import 'package:equatable/equatable.dart';
import 'package:movie/shared/core/enum.dart';
import 'package:movie/tv/domain/entities/tv_details.dart';
import 'package:movie/tv/domain/entities/tv_recommendation.dart';

class TvDetailsState extends Equatable {

  final TvDetails getTvDetails;
  final String getTvDetailsMessage;
  final RequestStates getTvDetailsState;

  final List<TvRecommendation> getTvRecommendation;
  final String getTvRecommendationMessage;
  final RequestStates getTvRecommendationState;

  const TvDetailsState({
    this.getTvDetails = const TvDetails(
      backdropPath:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjuDMpR_FMxIBANxGWnFVsnheoZv40IKjAvQ&usqp=CAU",
      id: 0,
      overview: "",
      voteAverage: 0.0,
      name: "",
      firstAirDate: "",
      genreTv: [],
      type: "",
    ),
    this.getTvDetailsMessage = "",
    this.getTvDetailsState = RequestStates.loading,
    this.getTvRecommendation = const [],
    this.getTvRecommendationMessage = "",
    this.getTvRecommendationState = RequestStates.loading,
  });

  TvDetailsState copyWith({
    TvDetails? getTvDetails,
    String? getTvDetailsMessage,
    RequestStates? getTvDetailsState,
    List<TvRecommendation>? getTvRecommendation,
    String? getTvRecommendationMessage,
    RequestStates? getTvRecommendationState,
  }) {
    return TvDetailsState(
        getTvDetails: getTvDetails ?? this.getTvDetails,
        getTvDetailsMessage: getTvDetailsMessage ?? this.getTvDetailsMessage,
        getTvDetailsState: getTvDetailsState ?? this.getTvDetailsState,
        getTvRecommendation: getTvRecommendation ?? this.getTvRecommendation,
        getTvRecommendationMessage:
            getTvRecommendationMessage ?? this.getTvRecommendationMessage,
        getTvRecommendationState:
            getTvRecommendationState ?? this.getTvRecommendationState);
  }

  @override
  List<Object?> get props => [
        getTvDetails,
        getTvDetailsMessage,
        getTvDetailsState,
        getTvRecommendation,
        getTvRecommendationMessage,
        getTvRecommendationState
      ];
}
