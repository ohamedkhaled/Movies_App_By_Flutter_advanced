import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Serveces/Services_Locator.dart';
import 'package:movies_app/Core/utils/Constants_App.dart';

import '../Manger/Manger_Tv/Tv_Bloc.dart';
import '../Manger/Manger_Tv/Tv_Events.dart';
import '../Widgets/Bodys/TopRate_Tv_More_Screen_Body.dart';

class TopRateTvMoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>getIt<TvBloc>()..add(GetTopRateEvents()),
    child: Scaffold(
      appBar: AppBar(
        title: Text(topRate),
      ),
      backgroundColor: KscondryColor,
      body: TopRateTvMoreScreenBody(),
    ) ,
    ) ;

  }
}