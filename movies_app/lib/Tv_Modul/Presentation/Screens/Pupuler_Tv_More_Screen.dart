import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Serveces/Services_Locator.dart';
import '../../../Core/utils/Constants_App.dart';
import '../Manger/Manger_Tv/Tv_Bloc.dart';
import '../Manger/Manger_Tv/Tv_Events.dart';
import '../Widgets/Bodys/Pupuler_Tv_More_Screen_Body.dart';

class PupulerTvMoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context)=>getIt<TvBloc>()..add(GetPopulerEvents()),
      child:Scaffold(
      appBar: AppBar(
        title: Text( populerMovies),
      ),
      backgroundColor: KscondryColor,
      body:PupulerTvMoreScreenBody() ,

    )
    );
  }
}