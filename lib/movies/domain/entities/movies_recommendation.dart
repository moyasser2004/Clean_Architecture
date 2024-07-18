import 'package:equatable/equatable.dart';

class MoviesRecommendation extends Equatable {
  final int id;
  final String? backdropPath;

  const MoviesRecommendation({required this.id, this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}
