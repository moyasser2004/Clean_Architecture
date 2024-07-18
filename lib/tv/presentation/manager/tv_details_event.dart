import 'package:equatable/equatable.dart';


abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int id;
  const GetTvDetailsEvent(this.id);
}

class GetTvRecommendationEvent extends TvDetailsEvent{
  final int id;
  const GetTvRecommendationEvent(this.id);
}