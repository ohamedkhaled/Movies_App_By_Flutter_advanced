import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manager_Movies/Movie_bloc.dart';

import '../../../../Core/Widgets/CachImageWidght.dart';
import '../../../../Core/utils/Api_Helper/Constant_Api.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/Constants_App.dart';
import '../../Manger/Manager_Movies/Movie_States.dart';
import '../../Screens/Movie_Details_Screen.dart';

class NowPlayingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieStates>(
        buildWhen: (previous, current) =>
            previous.MoviesPlayNowState != current.MoviesPlayNowState,
        builder: (BuildContext context, state) {
          switch (state.MoviesPlayNowState) {
            case RequestState.loading:
              return SizedBox(
                height: ConfigSize.defaultSize! * 40,
                child: Center(child: CircularProgressIndicator()),
              );
            case RequestState.loaded:
              return CarouselSlider(
                options: CarouselOptions(
                  height: ConfigSize.defaultSize! * 40,
                  viewportFraction: ConfigSize.defaultSize! / 10,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reson) {
                    //move_to_details_page
                  },
                  scrollDirection: Axis.horizontal,
                ),
                items: state.MoviesPlayNow.map(
                  (item) {
                    return Padding(
                        padding: EdgeInsets.only(
                            top: ConfigSize.defaultSize! * 3,
                            bottom: ConfigSize.defaultSize! * 1.5),
                        child: GestureDetector(
                            key: const Key('openMovieMinimalDetail'),
                            onTap: () {
                              //move_to_details_page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsScreen(id: item.id)));
                            },
                            child: Stack(children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: Colors.redAccent,
                                            size: ConfigSize.defaultSize! * 2,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            nowPlaying,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                            //textAlign: TextAlign.center,
                                          )
                                        ]),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${item.title}",
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                              ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        // fromLTRB
                                        Colors.transparent,
                                        Colors.black,
                                        Colors.black,
                                        Colors.transparent,
                                      ],
                                      stops: [0, 0.3, 0.5, 1],
                                    ).createShader(
                                      Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height),
                                    );
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: CachImageWidght(
                                    url: ConstantApi()
                                        .getImageUrl(item.backdropPath),
                                    height: ConfigSize.defaultSize! * 40,
                                    width: double.infinity,
                                  )),
                            ])));
                  },
                ).toList(),
              );
            case RequestState.error:
              return SizedBox(
                  height: ConfigSize.defaultSize! * 40,
                  child: Center(child: Text(state.messagePlayNow)));
          }
        });
  }
}
