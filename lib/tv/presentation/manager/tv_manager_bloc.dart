import 'package:bloc/bloc.dart';
import 'package:movie/shared/core/enum.dart';
import 'package:movie/tv/presentation/manager/tv_manager_event.dart';
import 'package:movie/tv/presentation/manager/tv_manager_state.dart';

import '../../domain/use_cases/get_now_playing_use_case.dart';
import '../../domain/use_cases/get_popular_use_case.dart';
import '../../domain/use_cases/get_top_rated_use_case.dart';



class TvManagerBloc extends Bloc<TvManagerEvent, TvManagerState> {

  final GetNowPlayingUseCase  getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  TvManagerBloc(this.getNowPlayingUseCase, this.getPopularUseCase, this.getTopRatedUseCase) : super(const TvManagerState()) {

    on<GetNowPlayingTvEvent>((event, emit) async{
      final result = await getNowPlayingUseCase.execute();
      result.fold(
          (l){
            emit(state.copyWith(
              getNowPlayingMessage: l.message,
              getNowPlayingState: RequestStates.error
            ));
          },
          (r){
            emit(state.copyWith(
              getNowPlayingTv: r,
              getNowPlayingState: RequestStates.loaded,
            ));
          }
      );
    });

    on<GetPopularTvEvent>((event, emit) async{
      final result = await getPopularUseCase.execute();
      result.fold(
              (l){
            emit(state.copyWith(
                getPopularMessage: l.message,
                getPopularState: RequestStates.error
            ));
          },
              (r){
            emit(state.copyWith(
              getPopularTv: r,
              getPopularState: RequestStates.loaded,
            ));
          }
      );
    });

    on<GetTopRatedTvEvent>((event, emit) async{
      final result = await getTopRatedUseCase.execute();
      result.fold(
              (l){
            emit(state.copyWith(
                getTopRatedMessage: l.message,
                getTopRatedState: RequestStates.error
            ));
          },
              (r){
            emit(state.copyWith(
              getTopRatedTv: r,
              getTopRatedState: RequestStates.loaded,
            ));
          }
      );
    });

  }
}
