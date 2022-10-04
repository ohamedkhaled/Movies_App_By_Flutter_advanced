
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Serveces/Services_Locator.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Detials_Tv/Detiels_Tv_Events.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/utils/Api_Helper/Constant_Api.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/enums.dart';
import '../../Manger/Manger_Detials_Tv/Detiels_Tv_Bloc.dart';
import '../../Manger/Manger_Detials_Tv/Detiels_Tv_States.dart';

class ShowEpisodes extends StatelessWidget{

  final  int id;
  final int seasonNumber ;

  ShowEpisodes({ required this.id, required this.seasonNumber});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>getIt<DetielsTvBloc>()..add(GetEpisodesEvent(id: id, seasonNumber: seasonNumber)),
      child:   BlocBuilder<DetielsTvBloc,DetielsTvStates>(
        builder: (BuildContext context, state) {
          switch(state.episodesState){

            case RequestState.loaded:
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FadeInUp(
                                from: 20,
                                duration: const Duration(milliseconds: 500),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                  child: CachedNetworkImage(
                                    imageUrl: ConstantApi()
                                        .getImageUrl(state.episodes[index].stillPath!),
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height:50,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.yellowAccent,
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 130,
                                  ),
                                ),


                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${index+1}. ${state.episodes[index].name}"
                                    ,
                                    style: TextStyle( fontSize: 13,fontWeight: FontWeight.w600),
                                  ),
                                  Text(state.episodes[index].firstAirDate,
                                      style: TextStyle(fontWeight: FontWeight.w100)
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(state.episodes[index].overview ,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          )
                      )
                    ],
                  ),
                );
              },
              itemCount: state.episodes.length,
            );
            case RequestState.loading:
             return  SizedBox(
              height: ConfigSize.defaultSize! * 40,
              child: Center(child: CircularProgressIndicator()),
            );
            case RequestState.error:
              return SizedBox(
                  height: ConfigSize.defaultSize! * 40 ,
                  child: Center(child: Text(state.episodesMessage)));

          }
        }

        )

    );
  }

}