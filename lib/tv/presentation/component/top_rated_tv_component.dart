import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/shared/core/enum.dart';
import 'package:movie/tv/presentation/manager/tv_manager_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/const/const.dart';
import '../manager/tv_manager_bloc.dart';
import '../pages/tv_details_screen.dart';

class TopRatedTvComponent extends StatelessWidget {
  const TopRatedTvComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvManagerBloc, TvManagerState>(
      buildWhen: (previous, current) =>
          previous.getTopRatedState != current.getTopRatedState,
      builder: (context, state) {
        switch (state.getTopRatedState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.lime,
                ),
              ),
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final movie = state.getTopRatedTv[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TvDetailScreen(
                                        id: movie.id,
                                      )));
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: AppLinks.imageUrl(
                                movie.backdropPath!),
                            placeholder: (context, url) =>
                                Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestStates.error:
            return SizedBox(
              height: 170.0,
              child: Center(
                child: Text(state.getTopRatedMessage),
              ),
            );
        }
      },
    );
  }
}
