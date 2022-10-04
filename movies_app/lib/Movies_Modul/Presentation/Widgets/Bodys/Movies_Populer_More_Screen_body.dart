import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_More_Populer/Movies_more_Bloc.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/enums.dart';
import '../../Manger/Manger_More_Populer/Movies_More_State.dart';
import '../../../../Core/Widgets/More_Widget.dart';

class MoviesPopulerMoreScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesMoreBloc, MoviesMoreStates>(
        buildWhen: (previous, current) =>
            previous.PopulerMoreState != current.PopulerMoreState,
        builder: (BuildContext context, state) {
          switch (state.PopulerMoreState) {
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
                    backdropPath: state.MoviesPopulerMore[index].backdropPath!,
                    title: state.MoviesPopulerMore[index].title,
                    voteAverage: state.MoviesPopulerMore[index].voteAverage,
                    overview: state.MoviesPopulerMore[index].overview,
                    releaseDate: state.MoviesPopulerMore[index].releaseDate,
                    id: state.MoviesPopulerMore[index].id,
                  );
                },
                itemCount: state.MoviesPopulerMore.length,
              );

            case RequestState.error:
              return SizedBox(
                  height: ConfigSize.defaultSize! * 40,
                  child: Center(child: Text(state.messagePopulerMore)));
          }
        });
  }
}
