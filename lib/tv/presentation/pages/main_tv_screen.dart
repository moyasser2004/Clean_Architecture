import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utiles/services_local.dart';
import '../component/play_now_Tv_component.dart';
import '../component/popular_tv_component.dart';
import '../component/top_rated_tv_component.dart';
import '../manager/tv_manager_bloc.dart';


class MainTvScreen extends StatelessWidget {
  const MainTvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TvManagerBloc>(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key("MainTvScreen"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlayNowTvComponent(),
              ////
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.amberAccent.shade400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                          Navigator.of(context).pushNamed("seeMorePopularTvScreen");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text('See More', style: TextStyle(
                              color: Colors.white,
                            ),),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ////
              PopularTvComponent(),
              ////
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  15.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.amberAccent.shade400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                         Navigator.of(context).pushNamed("SeeMoreTopRatedTvScreen");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Text('See More', style: TextStyle(
                              color: Colors.white,
                            ),),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ////
              TopRatedTvComponent(),
              ////
              const SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
    );
  }
}
