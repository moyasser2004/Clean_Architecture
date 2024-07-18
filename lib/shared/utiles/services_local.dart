import 'package:get_it/get_it.dart';
import 'package:movie/movies/domain/use_cases/get_movies_details_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_movies_recommendation_use_case.dart';
import 'package:movie/movies/domain/use_cases/get_popular_movies_uscase.dart';
import 'package:movie/movies/domain/use_cases/get_top_rated_movies_uscase.dart';
import 'package:movie/movies/presentation/manager/block_page.dart';
import 'package:movie/movies/presentation/manager/movies_details_bloc.dart';
import 'package:movie/tv/data/data_sources/tv_remoted_data_sources.dart';
import 'package:movie/tv/domain/use_cases/get_details_tv_use_case.dart';
import 'package:movie/tv/domain/use_cases/get_recommendation_use_case.dart';
import 'package:movie/tv/presentation/manager/tv_details_bloc.dart';

import '../../movies/data/data_sources/movies_remoted_data_sources.dart';
import '../../movies/data/repositories/movies_repositories.dart';
import '../../movies/domain/repositories/base_repositories.dart';
import '../../movies/domain/use_cases/get_now_playing_movies_uscase.dart';
import '../../movies/presentation/manager/event_page.dart';
import '../../tv/data/repositories/tv_repositories.dart';
import '../../tv/domain/repositories/base_repositories.dart';
import '../../tv/domain/use_cases/get_now_playing_use_case.dart';
import '../../tv/domain/use_cases/get_popular_use_case.dart';
import '../../tv/domain/use_cases/get_top_rated_use_case.dart';
import '../../tv/presentation/manager/tv_manager_bloc.dart';
import '../../tv/presentation/manager/tv_manager_event.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl())
      ..add(GetNowPlayingMoviesEvent())
      ..add(GetPopularMoviesEvent())
      ..add(GetTopRatedMoviesEvent()));

    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));

    sl.registerLazySingleton<BaseMoviesRemotedDataSource>(
        () => MoviesRemotedDataSource());
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(
        () => GetMoviesRecommendationsUseCase(sl()));

    // tv manager
    sl.registerFactory(() => TvManagerBloc(sl(), sl(), sl())
      ..add(GetNowPlayingTvEvent())
      ..add(GetPopularTvEvent())
      ..add(GetTopRatedTvEvent()));

    sl.registerLazySingleton<BaseTvRemotedDataSources>(
        () => TvRemotedDataSources());

    sl.registerLazySingleton<BaseTvRepository>(
        () => TvRepository(sl()));

    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));

    sl.registerLazySingleton(() => GetPopularUseCase(sl()));

    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));

    sl.registerFactory(() => TvDetailsBloc(sl(), sl()));

    sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvRecommendationUseCase(sl()));
  }
}
