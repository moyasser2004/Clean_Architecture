import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/shared/core/enum.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/const/const.dart';
import '../../../shared/utiles/services_local.dart';
import '../../domain/entities/tv_details.dart';
import '../manager/tv_details_bloc.dart';
import '../manager/tv_details_event.dart';
import '../manager/tv_details_state.dart';

class TvDetailScreen extends StatelessWidget {
  final int id;

  const TvDetailScreen({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TvDetailsBloc>()
        ..add(GetTvDetailsEvent(id))
        ..add(GetTvRecommendationEvent(id)),
      child: const TvDetailContent(),
    );
  }
}

class TvDetailContent extends StatelessWidget {
  const TvDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        switch (state.getTvRecommendationState) {
          case RequestStates.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.lime,
              ),
            );
          case RequestStates.loaded:
            return Scaffold(
              body: CustomScrollView(
                key: const Key('movieDetailScrollView'),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 250.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.5, 1.0, 1.0],
                            ).createShader(
                              Rect.fromLTRB(
                                  0.0, 0.0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            imageUrl: AppLinks.imageUrl(
                                state.getTvDetails.backdropPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(state.getTvDetails.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                )),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius:
                                        BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    state.getTvDetails.firstAirDate
                                        .split('-')[0],
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      (state.getTvDetails
                                                  .voteAverage /
                                              2)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '(${state.getTvDetails.voteAverage})',
                                      style: const TextStyle(
                                        fontSize: 1.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16.0),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              state.getTvDetails.overview,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Genres: ${_showGenres(state.getTvDetails.genreTv)}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                        16.0, 16.0, 16.0, 24.0),
                    sliver: SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          'More like this'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                        16.0, 0.0, 16.0, 24.0),
                    sliver: _showRecommendations(),
                  ),
                ],
              ),
            );
          case RequestStates.error:
            return Center(
              child: Text(state.getTvDetailsMessage),
            );
        }
      },
    );
  }

  String _showGenres(List<GenreTv> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  Widget _showRecommendations() {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
        buildWhen: (previous, current) =>
            previous.getTvRecommendationState !=
            current.getTvRecommendationState,
        builder: (context, state) {
          final filteredRecommendations = state.getTvRecommendation
              .where((data) => data.backdropPath != null)
              .toList();
          switch (state.getTvRecommendationState) {
            case RequestStates.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.lime,
                ),
              );
            case RequestStates.loaded:
              return SliverPadding(
                padding: const EdgeInsets.fromLTRB(5, 0.0, 5, 24.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final data = filteredRecommendations[index];
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TvDetailScreen(id: data.id)));
                          },
                          child: FadeInUp(
                            from: 20,
                            duration:
                                const Duration(milliseconds: 500),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0)),
                              child: CachedNetworkImage(
                                imageUrl: AppLinks.imageUrl(
                                    data.backdropPath!),
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
                                          BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                height: 180.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: filteredRecommendations.length,
                  ),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.7,
                    crossAxisCount: 3,
                  ),
                ),
              );
            case RequestStates.error:
              return Center(
                child: Text(state.getTvRecommendationMessage),
              );
          }
        });
  }
}
