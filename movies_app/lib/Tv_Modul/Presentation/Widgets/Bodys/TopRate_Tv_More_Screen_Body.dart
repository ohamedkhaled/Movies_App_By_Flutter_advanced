import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_Bloc.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_States.dart';

import '../../../../Core/Widgets/More_Widget.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/enums.dart';

class TopRateTvMoreScreenBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc,TvStates>(
        buildWhen: (previous, current) =>
        previous.TopRateTvRequest != current.TopRateTvRequest
        ,builder: (context, state) {
      switch (state.TopRateTvRequest) {
        case RequestState.loading:
          return SizedBox(
            height: ConfigSize.screenHeight,
            child: Center(child: CircularProgressIndicator()),
          );
        case RequestState.loaded:
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MoreWidght(
                backdropPath: state.TopRateTvMovies[index].backdropPath!,
                title: state.TopRateTvMovies[index].name,
                voteAverage: state.TopRateTvMovies[index].voteAverage,
                overview: state.TopRateTvMovies[index].overview,
                releaseDate: state.TopRateTvMovies[index].firstAirDate,
                id: state.TopRateTvMovies[index].id,
              );
            },
            itemCount: state.TopRateTvMovies.length,
          );

        case RequestState.error:
          return SizedBox(
              height: ConfigSize.defaultSize! * 40,
              child: Center(child: Text(state.TopRateTvMessage)));
      }
        });
  }

}