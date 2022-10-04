import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/enums.dart';

import '../../Manger/Manger_More_TopRate/Movies_TopRate_More_Bloc.dart';
import '../../Manger/Manger_More_TopRate/Movies_TopRate_More_States.dart';
import '../../../../Core/Widgets/More_Widget.dart';

class MoviesTopRateMoreScreenBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
print("MoviesTopRateMoreScreenBody");
  return BlocBuilder<MoviesTopRateMoreBloc,MoviesTopRateMoreStates>(
      buildWhen: (previous, current) =>
      previous.TopRateMoreState != current.TopRateMoreState,
      builder: (BuildContext context, state) {
        switch (state.TopRateMoreState) {
          case RequestState.loading:
            return SizedBox(
              height: ConfigSize.screenHeight,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return   MoreWidght(
                  backdropPath: state.MoviesTopRateMore[index].backdropPath!,
                  title: state.MoviesTopRateMore[index].title,
                  voteAverage: state.MoviesTopRateMore[index].voteAverage,
                  overview: state.MoviesTopRateMore[index].overview,
                  releaseDate: state.MoviesTopRateMore[index].releaseDate,
                  id: state.MoviesTopRateMore[index].id,
                );
              },
              itemCount: state.MoviesTopRateMore.length,
            );

          case RequestState.error:
            return SizedBox(
                height: ConfigSize.defaultSize! * 40,
                child: Center(child: Text(state.messageTopRateMore)));
        }
      }
  );
  }
}




