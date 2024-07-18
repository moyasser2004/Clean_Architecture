import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/shared/utiles/services_local.dart';
import 'package:movie/shared/widget/splash_screen.dart';
import 'package:movie/tv/presentation/pages/main_tv_screen.dart';
import 'package:movie/tv/presentation/pages/see_more_popular_tv.dart';
import 'package:movie/tv/presentation/pages/see_more_top_rated_screen.dart';

import 'movies/presentation/pages/main_movies_screen.dart';
import 'movies/presentation/pages/see_more_popular_screen.dart';
import 'movies/presentation/pages/see_more_top_rated_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "mainMoviesScreen": (content) => const MainMoviesScreen(),
        "SeeMoreTopRatedScreen": (content) =>
            const SeeMoreTopRatedScreen(),
        "SeeMorePopularScreen": (content) =>
            const SeeMorePopularScreen(),
        "mainTvScreen": (content) => const MainTvScreen(),
        "seeMorePopularTvScreen": (content) =>
            const SeeMorePopularTvScreen(),
        "SeeMoreTopRatedTvScreen": (content) =>
            const SeeMoreTopRatedTvScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light))),
      title: "Movies",
      home: const SecondClass(),
    );
  }
}
