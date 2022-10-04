

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/Core/utils/Constants_App.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_More_Populer/Movies_more_Bloc.dart';
import '../../../Core/Serveces/Services_Locator.dart';
import '../Manger/Manger_More_Populer/Movies_More_Event.dart';
import '../Widgets/Bodys/Movies_Populer_More_Screen_body.dart';




class MoviesMorePopulerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("MoviesMorePopulerScreen");
    return BlocProvider(
      create: (BuildContext context) =>getIt<MoviesMoreBloc>()..add(GetMorePopulerMovies())
     ,
      child: Scaffold(
          appBar:AppBar(
            title: Text(populerMovies),
          ),
          backgroundColor: KscondryColor,
          body: MoviesPopulerMoreScreenBody()
      ),

    );
  }
}