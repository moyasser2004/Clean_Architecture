import 'package:equatable/equatable.dart';



abstract class TvManagerEvent extends Equatable {

  const TvManagerEvent();

  @override
  List  get props => [];
}

class GetNowPlayingTvEvent extends TvManagerEvent{}

class GetPopularTvEvent extends TvManagerEvent{}

class GetTopRatedTvEvent extends TvManagerEvent{}
