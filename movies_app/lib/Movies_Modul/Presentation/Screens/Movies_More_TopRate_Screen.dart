import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Serveces/Services_Locator.dart';
import '../../../Core/utils/Constants_App.dart';
import '../Manger/Manger_More_TopRate/Movies_TopRate_More_Bloc.dart';
import '../Manger/Manger_More_TopRate/Movies_TopRate_More_Event.dart';
import '../Widgets/Bodys/Movies_TopRate_More_Screen_Body.dart';


class MoviesMoreTopRateScreen extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("MoviesMoreTopRateScreen");
    return BlocProvider(
        create: (BuildContext context) =>
        getIt<MoviesTopRateMoreBloc>()..add(GetMoreTopRateMovies()),
      child:Scaffold(
          appBar:AppBar(
            title: Text(topRateMovies),
          ),
          backgroundColor: KscondryColor,
          body: MoviesTopRateMoreScreenBody()
      ) ,
    );

  }
}