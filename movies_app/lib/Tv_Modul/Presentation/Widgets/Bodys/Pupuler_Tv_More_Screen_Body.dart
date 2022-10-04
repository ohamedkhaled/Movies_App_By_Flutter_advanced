import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_Bloc.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_States.dart';

import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/enums.dart';
import '../../../../Core/Widgets/More_Widget.dart';

class PupulerTvMoreScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvStates>(
        buildWhen: (previous, current) =>
            previous.PopulerTvRequest != current.PopulerTvRequest,
        builder: (context, state) {
          switch (state.PopulerTvRequest) {
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
                    backdropPath: state.PopulerTvMovies[index].backdropPath!,
                    title: state.PopulerTvMovies[index].name,
                    voteAverage: state.PopulerTvMovies[index].voteAverage,
                    overview: state.PopulerTvMovies[index].overview,
                    releaseDate: state.PopulerTvMovies[index].firstAirDate,
                    id: state.PopulerTvMovies[index].id,
                  );
                },
                itemCount: state.PopulerTvMovies.length,
              );

            case RequestState.error:
              return SizedBox(
                  height: ConfigSize.defaultSize! * 40,
                  child: Center(child: Text(state.PopulerTvMessage)));
          }
        });
  }
}
