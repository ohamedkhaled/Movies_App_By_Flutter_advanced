
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_Details/Movie_Details_bloc.dart';
import '../../../../Core/utils/Api_Helper/Constant_Api.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/Constants_App.dart';
import '../../../Domin/Enities/Genres.dart';
import '../../Manger/Manger_Details/Movie_Details_State.dart';
import '../Components/Show_Recommendtions.dart';
import 'package:movies_app/Core/utils/Methods.dart';

class MoviesDetailsScreenBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MoviesDetailsState>(
        builder: (BuildContext context, state) {
          switch(state.moviesDetailsState){
            case RequestState.loading:
              return  SizedBox(
                  height: ConfigSize.defaultSize! * 40,
                  child: Center(child: CircularProgressIndicator()),
          );
            case RequestState.loaded:
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: ConfigSize.defaultSize! * 30,
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
                              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            width: ConfigSize.screenHeight,
                            imageUrl: ConstantApi().getImageUrl(
                                state.moviesDetails!.backdropPath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  , SliverToBoxAdapter(
                    child: FadeInUp(
                      duration: Duration(milliseconds: 500),
                      from: 20, //control scal of  animation
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.moviesDetails!.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                )),
                            SizedBox(height: ConfigSize.defaultSize),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    state.moviesDetails!.releaseDate.split('-')[0],
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
                                      (state.moviesDetails!.voteAverage / 2)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '(${state.moviesDetails!.voteAverage})',
                                      style: const TextStyle(
                                        fontSize: 2,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16.0),
                                Text(
                                  Methods.showFormatRunTime(state.moviesDetails!.runTime),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: ConfigSize.defaultSize! * 1.5,),
                            Text(
                              state.moviesDetails!.overview,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: ConfigSize.defaultSize! * 1.5,),
                            Text(
                              '${genres}: ${Methods.showGenres(state.moviesDetails!
                                  .genreIds)}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            )
                          ],
                        ),
                      ),

                    ),


                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    sliver: SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          moreLikeThis,
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
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    sliver:  ShowRecommendtions(),
                  )

                ],

              );
            case RequestState.error:
              return SizedBox(
                  height: ConfigSize.defaultSize! * 40 ,
                  child: Center(child: Text(state.messageMoviesDetails)));
          }

        }
    );
  }

  //
  // String _showFormatRunTime(int runtime) {
  //   final int hours = runtime ~/ 60;
  //   final int minutes = runtime % 60;
  //
  //   if (hours > 0) {
  //     return '${hours}h ${minutes}m';
  //   } else {
  //     return '${minutes}m';
  //   }
  // }
  //
  // String _showGenres(List<GenresEnities> genres) {
  //   String result = '';
  //   for (var genre in genres) {
  //     result += '${genre.name}, ';
  //   }
  //
  //   if (result.isEmpty) {
  //     return result;
  //   }
  //   return result.substring(0, result.length - 2);
  // }
}