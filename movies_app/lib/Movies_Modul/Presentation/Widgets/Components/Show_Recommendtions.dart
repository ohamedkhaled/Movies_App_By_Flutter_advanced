import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/Api_Helper/Constant_Api.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_Details/Movie_Details_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../Manger/Manger_Details/Movie_Details_State.dart';


class ShowRecommendtions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieDetailsBloc,MoviesDetailsState>(
        builder: (BuildContext context, state) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: CachedNetworkImage(
                      imageUrl: ConstantApi()
                          .getImageUrl(state.moviesRecommendtionEnities[index].backdropPath!),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height:170,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              childCount: state.moviesRecommendtionEnities.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          );
        }

    );


  }
}
