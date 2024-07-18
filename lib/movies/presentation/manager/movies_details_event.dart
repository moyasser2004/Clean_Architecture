import 'package:equatable/equatable.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();

  @override
  List get props => [];
}

class GetMoviesDetailsEvent extends MoviesDetailsEvent {
  final int id;
  GetMoviesDetailsEvent(this.id);
}

class GetMoviesRecommendationEvent extends MoviesDetailsEvent {
  final int id;
  GetMoviesRecommendationEvent(this.id);
}
