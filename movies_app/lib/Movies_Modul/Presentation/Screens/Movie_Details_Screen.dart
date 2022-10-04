import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_Details/Movie_Details_bloc.dart';
import 'package:movies_app/Movies_Modul/Presentation/Widgets/Bodys/Movies_Details_Screen_Body.dart';

import '../../../Core/Serveces/Services_Locator.dart';
import '../../../Core/utils/Constants_App.dart';
import '../Manger/Manger_Details/Movie_Details_Event.dart';


class MovieDetailsScreen extends StatelessWidget {
  final int id;

  MovieDetailsScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id: id))
        ..add(GetMoviesRecommendtionEvent(id: id)),
      child:
          Scaffold(
              backgroundColor:KscondryColor
              ,body: MoviesDetailsScreenBody())

    );
  }
}
