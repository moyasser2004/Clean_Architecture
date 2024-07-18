import 'package:equatable/equatable.dart';

class TvRecommendation extends Equatable {

  final int id;
  final String? backdropPath;

  const TvRecommendation({required this.id, required this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}
